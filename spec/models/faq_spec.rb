require 'spec_helper'

describe Faq do
  it "can be instantiated" do
    Faq.new.should be_an_instance_of(Faq)
  end

  it { should validate_presence_of(:question) }
  it { should validate_presence_of(:answer) }

  it { should have_and_belong_to_many(:categories) }

  it "have a friendly id" do
    @faq = Faq.new
    @faq.respond_to?(:friendly_id).should be_true
    end
end
