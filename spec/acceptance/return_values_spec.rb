describe "rspec-contracts with return values" do
  before do
    spec_data <<-END
      class Widget; end
    END
  end

  it "considers different return values from simple mocks to be separate contracts" do
    spec_data <<-END
      describe Widget do
        it { contract_double :server, foo: 1 }
        it { contract_double :server, foo: 2 }
      end
    END
    expect(spec_result).to have(2).contracts
  end

  it "considers different return values from expectations to be separate contracts" do
    spec_data <<-END
      describe Widget do
        it { expect(contract_double :server).to receive(:foo).and_return(1) }
        it { expect(contract_double :server).to receive(:foo).and_return(2) }
      end
    END
    expect(spec_result).to have(2).contracts
  end

  it "disregards all but the first return value in a sequence (for now)" do
    spec_data <<-END
      describe Widget do
        it { expect(contract_double :server).to receive(:foo).and_return(1, 2) }
        it { expect(contract_double :server).to receive(:foo).and_return(1, 4) }
      end
    END
    expect(spec_result).to have(1).contract
  end
end
