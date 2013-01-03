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

  describe ".number_of_five_year_olds" do
    it "should count the number of all students five years old" do
      five = Student.create(:date_of_birth => Date.today - 5.years)
      older = Student.create(:date_of_birth => Date.today - 6.years)
      younger = Student.create(:date_of_birth => Date.today - 4.years + 1.day)

      Student.number_of_five_year_olds.should == 1
    end
  end

  describe ".number_of_six_year_olds" do
    it "should count the number of all students six years old" do
      six = Student.create(:date_of_birth => Date.today - 6.years)
      older = Student.create(:date_of_birth => Date.today - 7.years)
      younger = Student.create(:date_of_birth => Date.today - 5.years + 1.day)

      Student.number_of_six_year_olds.should == 1
    end
  end

  describe ".number_of_seven_to_nine_year_olds" do
    it "should count the number of all students between seven and nine years old" do
      student = Student.create(:date_of_birth => Date.today - 8.years)
      older = Student.create(:date_of_birth => Date.today - 9.years)
      younger = Student.create(:date_of_birth => Date.today - 6.years + 1.day)

      Student.number_of_seven_to_nine_year_olds.should == 1
    end
  end

end



