describe "rspec-contracts with method arguments" do
  before do
    spec_data <<-END
      class Widget; end
    END
  end

  it "considers method calls with different arguments to be separate contracts" do
    spec_data <<-END
      describe Widget do
        it { expect(contract_double :server).to receive(:foo).with(1) }
        it { expect(contract_double :server).to receive(:foo).with(2) }
        it { expect(contract_double :server).to receive(:foo).with(1, 2) }
      end
    END
    expect(spec_result).to have(3).contracts
  end
end
