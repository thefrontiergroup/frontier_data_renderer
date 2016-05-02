require 'spec_helper'

describe FrontierDataRenderer::ViewHelper do

  class FakeHelper
    include ActionView::Helpers
    include FrontierDataRenderer::ViewHelper
  end

  describe "#render_data" do
    subject { helper.render_data(value, format, opts) }
    let(:helper) { FakeHelper.new }
    let(:opts) { {} }

    context "with a value" do
      context "when format is a boolean" do
        let(:format) { :boolean }
        let(:value) { Date.new(2015, 5, 19) }

        context "when true" do
          let(:value) { true }
          it { should eq("Yes") }
        end

        context "when false" do
          let(:value) { false }
          it { should eq("No") }
        end

        context "when nil" do
          let(:value) { nil }
          it { should eq("No") }
        end
      end

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

      context "when format is a percentage" do
        let(:format) { :percentage }
        let(:value)  { 55.7 }

        context "without args" do
          it { should include("56%") }
        end

        context "with args" do
          let(:opts) { {precision: 1} }
          it { should include("55.7%") }
        end
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
