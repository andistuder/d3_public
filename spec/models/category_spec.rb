require 'spec_helper'

describe Category do
  it "can be instantiated" do
    Category.new.should be_an_instance_of(Category)
  end

  it { should have_and_belong_to_many(:news_items) }
  it { should have_and_belong_to_many(:pages) }

  it "has a name that is required" do
    @category = Category.new
    @category.respond_to?(:name).should be_true
    @category.should_not be_valid
  end
                                            

end
