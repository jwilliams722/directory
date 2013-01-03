require "spec_helper"

describe Student do
  describe ".seed_data!" do
    it "should create 500 random students" do
      Student.seed_data!
      Student.count.should == 500
    end
  end

  describe ".tommy_smiths" do
    it "should find all students named Tommy Smith" do
      tommy_smith = Student.create(:first_name => "Tommy", :last_name => "Smith")
      alice = Student.create(:first_name => "Alice", :last_name => "Williams")

      Student.tommy_smiths.should == [tommy_smith]
    end
  end
end



