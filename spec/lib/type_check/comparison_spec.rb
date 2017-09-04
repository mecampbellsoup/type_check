require 'spec_helper'

RSpec.describe TypeCheck::Comparison do
  subject(:comparison) { described_class.new(rules: rules, params: params) }

  describe "#valid?" do
    subject { comparison.valid? }

    let(:rules) { { foo: String, bar: Integer } }

    context "params do not type check against the rules" do
      pending
    end

    context "params type check against the rules" do
      let(:params) { { foo: 'foo', bar: 1 } }

      it { is_expected.to eq true }
    end
  end
end
