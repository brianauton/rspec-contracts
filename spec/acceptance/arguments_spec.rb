describe "rspec-contracts with method arguments" do
  before do
    spec_data <<-END
      class Widget; end
      class Server
        def foo; end
      end
      SpecializedServer = Class.new(Server)
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

  it "requires an exact argument match to fulfill a contract" do
    spec_data <<-END
      describe Widget do
        it { expect(contract_double :server).to receive(:foo).with(1) }
        it { expect(contract_double :server).to receive(:foo).with(2) }
        it { expect(contract_double :server).to receive(:foo).with(1, 2) }
      end
      describe Server do
        fulfill_contract :server
        it { Server.new.foo(2) }
      end
    END
    expect(spec_result).to have(1).verified_contract
  end

  it "accepts any arguments if none are specified on the mock" do
    spec_data <<-END
      describe Widget do
        it { expect(contract_double :server).to receive(:foo) }
      end
      describe Server do
        fulfill_contract :server
        it { Server.new.foo(2, 3) }
      end
    END
    expect(spec_result).to have(1).verified_contract
  end

  it "requires all implementors of an interface to accept the arguments" do
    spec_data <<-END
      describe Widget do
        it { expect(contract_double :server).to receive(:foo).with(1) }
      end
      describe Server do
        fulfill_contract :server
        it { Server.new.foo(1) }
      end
      describe SpecializedServer do
        fulfill_contract :server
      end
    END
    expect(spec_result).to have(0).verified_contracts
  end
end
