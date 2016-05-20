require 'spec_helper'

describe FrontierDataRenderer::ViewHelper do

  class FakeHelper
    include ActionView::Helpers
    include FrontierDataRenderer::ViewHelper
  end

  describe "#render_data" do
    subject { helper.render_data(value, format, options) }
    let(:helper) { FakeHelper.new }
    let(:options) { {} }

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
          it { should eq("<span class=\"text-muted\">No</span>") }
        end
      end

      context "when format is a currency" do
        let(:format) { :currency }
        let(:value) { 69.12 }

        it { should include("$69.12") }
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
          let(:options) { {precision: 1} }
          it { should include("55.7%") }
        end
      end

      context "when format is a text" do
        let(:format) { :text }
        let(:value) { "Thingo" }

        context "and no length is specified" do
          it { should eq("Thingo") }
        end

        context "and a length is specified" do
          let(:options) { {length: 5} }
          it { should eq("<span title=\"Thingo\">Th...</span>") }
        end

      end

      context "when format is a string" do
        let(:format) { :string }
        let(:value) { "Thing" }

        it { should eq("Thing") }
      end
    end

    context "when value is nil" do
      let(:value)  { nil }

      context "when type is boolean" do
        let(:format) { :boolean }

        context "when using default no_data_class" do
          it { should eq("<span class=\"text-muted\">No</span>") }
        end

        describe "overriding FrontierDataRenderer.no_data_class" do
          before { FrontierDataRenderer.no_data_class = no_data_class }
          after  { FrontierDataRenderer.no_data_class = "text-muted" }

          context "with a single class" do
            let(:no_data_class) { "text-quiet" }
            it { should eq("<span class=\"text-quiet\">No</span>") }
          end

          context "with multiple classes" do
            let(:no_data_class) { ["text-quiet", "data-na"] }
            it { should eq("<span class=\"text-quiet data-na\">No</span>") }
          end
        end

        describe "overriding no_content_text" do
          let(:options) { {no_content_text: "Yeah, nah"} }
          it { should eq("<span class=\"text-muted\">Yeah, nah</span>") }
        end
      end

      context "when type is not boolean" do
        let(:format) { :string }

        context "when using default no_data_class" do
          it { should eq("<abbr class=\"text-muted\" title=\"Not available\">N/A</abbr>") }
        end

        describe "overriding FrontierDataRenderer.no_data_class" do
          before { FrontierDataRenderer.no_data_class = no_data_class }
          after  { FrontierDataRenderer.no_data_class = "text-muted" }

          context "with a single class" do
            let(:no_data_class) { "text-quiet" }
            it { should eq("<abbr class=\"text-quiet\" title=\"Not available\">N/A</abbr>") }
          end

          context "with multiple classes" do
            let(:no_data_class) { ["text-quiet", "data-na"] }
            it { should eq("<abbr class=\"text-quiet data-na\" title=\"Not available\">N/A</abbr>") }
          end
        end

        describe "overriding no_content_text" do
          let(:options) { {no_content_text: "Jordan rules"} }
          it { should eq("<abbr class=\"text-muted\" title=\"Not available\">Jordan rules</abbr>") }
        end

        describe "overriding no_content_title" do
          let(:options) { {no_content_title: "Not applicable"} }
          it { should eq("<abbr class=\"text-muted\" title=\"Not applicable\">N/A</abbr>") }
        end
      end

    end
  end

end
