require 'spec_helper'

describe FaqCategory do
  it { should validate_presence_of(:name) }
  it { should have_and_belong_to_many(:faqs) }

  it "can be instantiated" do
    FaqCategory.new.should be_an_instance_of(FaqCategory)
  end

end
