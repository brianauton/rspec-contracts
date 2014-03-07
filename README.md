## rspec-contracts
[![Build Status](https://travis-ci.org/brianauton/rspec-contracts.png?branch=master)](https://travis-ci.org/brianauton/rspec-contracts)
[![Code Climate](https://codeclimate.com/github/brianauton/rspec-contracts.png)](https://codeclimate.com/github/brianauton/rspec-contracts)

Automatic contract verification for your RSpec suite

### Requirements

  * Rspec 3.0.0.beta2

### Getting Started

Install the rspec-contracts gem alongside rspec in your gemfile.

    group :development, :test do
      gem "rspec", "3.0.0.beta2"
      gem "rspec-contracts"
    end

Then update your bundle.

    $ bundle

Define doubles using `contract_double`, providing the contract name as
the first argument.

    user = contract_double(:user, email: "me@example.com")

Running the specs will then show a summary of unverified contracts.

    $ rspec
