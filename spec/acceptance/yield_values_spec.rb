describe "rspec-contracts with return values" do
  before do
    spec_data <<-END
      class Widget; end
      class Server
        def foo; yield 2; end
      end
      class OtherServer
        def foo; end
      end
    END
  end

  it "considers different yielded values from expectations to be separate contracts" do
    spec_data <<-END
      describe Widget do
        it { expect(contract_double :server).to receive(:foo).and_yield(1) }
        it { expect(contract_double :server).to receive(:foo).and_yield(2) }
      end
    END
    expect(spec_result).to have(2).contracts
  end

  it "considers multiple yield values in a sequence to be separate contracts" do
    spec_data <<-END
      describe Widget do
        it { expect(contract_double :server).to receive(:foo).and_yield(1, 2) }
        it { expect(contract_double :server).to receive(:foo).and_yield(1, 4) }
      end
    END
    expect(spec_result).to have(3).contracts
  end

  it "observes yielded values to fulfill contracts" do
    spec_data <<-END
      describe Widget do
        it { expect(contract_double :server).to receive(:foo).and_yield(2) }
        it { expect(contract_double :server).to receive(:foo).and_yield(3) }
      end
      describe Server do
        fulfill_contract :server
        it { Server.new.foo{} }
      end
    END
    expect(spec_result).to have(1).verified_contract
  end

  it "requires only one implementor of an interface to support the yielded value" do
    spec_data <<-END
      describe Widget do
        it { expect(contract_double :server).to receive(:foo).and_yield(2) }
      end
      describe Server do
        fulfill_contract :server
        it { Server.new.foo{} }
      end
      describe OtherServer do
        fulfill_contract :server
        it { OtherServer.new.foo{} }
      end
    END
    expect(spec_result).to have(1).verified_contract
  end
end
