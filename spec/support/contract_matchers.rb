RSpec::Matchers.define :have do |number|
  match do |output|
    if @type == :verified
      output.include? ", #{number} verified,"
    elsif @type == :unverified
      output.include? ", #{number} unverified"
    else
      output.include? "#{number} contract"
    end
  end

  chain(:contract) {}
  chain(:contracts) {}
  chain(:verified_contract) { @type = :verified }
  chain(:verified_contracts) { @type = :verified }
  chain(:unverified_contract) { @type = :unverified }
  chain(:unverified_contracts) { @type = :unverified }
end
