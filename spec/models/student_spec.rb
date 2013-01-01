require "spec_helper"

describe Student do
  describe ".seed_data!" do
    it "should create 500 random students" do
      Student.seed_data!
      Student.count.should == 500
    end
  end
end