require 'spec_helper'

describe FrontierDataRenderer::ViewHelper do

  class FakeHelper
    include ActionView::Helpers
    include FrontierDataRenderer::ViewHelper
  end

  describe "#render_data" do
    subject { helper.render_data(value, format) }
    let(:helper) { FakeHelper.new }

    context "with a value" do
      context "when format is a datetime" do
        let(:format) { :datetime }
        let(:value) { DateTime.new(2015, 5, 19, 17, 24) }

        it { should include("Tue, 19 May 2015 17:24:00 +0000") }
      end

      context "when format is a date" do
        let(:format) { :date }
        let(:value) { Date.new(2015, 5, 19) }

        it { should include("2015-05-19") }
      end

      context "when format is a string" do
        let(:format) { :string }
        let(:value) { "Thing" }

        it { should eq("Thing") }
      end
    end

    context "when value is nil" do
      let(:format) { :string }
      let(:value)  { nil }
      it { should include("N/A") }
    end
  end

end
