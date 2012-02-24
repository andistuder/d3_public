require 'spec_helper'

describe Asset do
  
  before :each do
    # Asset.stub!(:find).and_return(mock_model(Asset))
    # @asset = mock_model(Asset)
  end
  
  it "can be instantiated" do
    Asset.new.should be_an_instance_of(Asset)
  end                                           
  
  it "has many assets via paperclip" do
    Asset.new.asset.should_not be_nil
  end
  
  it { should have_and_belong_to_many(:pages) }
  it { should have_and_belong_to_many(:news_items) }
  it { should have_and_belong_to_many(:feature_categories) }
  it { should have_and_belong_to_many(:projects) }
  it { should have_and_belong_to_many(:case_studies) }
  it { should have_and_belong_to_many(:partners) }

  it "has a name that is required" do
    @asset = Asset.new
    @asset.respond_to?(:name).should be_true
    @asset.should_not be_valid
  end  
  
  it "has a description that is required" do
    @asset = Asset.new
    @asset.respond_to?(:description).should be_true
    @asset.should_not be_valid
  end

end
