RSpec::Matchers.define :have do |number|
  match do |output|
    output.include? "of #{number} contract"
  end

  chain(:contract) {}
  chain(:contracts) {}
end
