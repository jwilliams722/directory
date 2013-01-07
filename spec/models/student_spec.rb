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

  describe ".number_of_teenagers" do
    it "should count the number of students that are teenagers" do
      student = Student.create(:date_of_birth => Date.today - 15.years)
      older = Student.create(:date_of_birth => Date.today - 19.years)
      younger = Student.create(:date_of_birth => Date.today - 13.years + 1.day)

      Student.number_of_teenagers.should == 1
    end
  end

  describe ".green_eye_students" do
    it "should count the number of students with green eyes" do
      student = Student.create(:eye_color => "green")
      wrong_student = Student.create(:eye_color => "blue")

      Student.green_eye_students.should == 1
    end
  end

  describe ".any_students_with_same_first_names?" do
    it "should return true if there are any students with the same first name" do
      student_one = Student.create(:first_name => "Bill", :last_name => "Smith")
      student_two = Student.create(:first_name => "Bill", :last_name => "Orr")

      Student.any_students_with_same_first_names?.should == true
    end

    it "should return false if there are not any students with the same first name" do
      student_one = Student.create(:first_name => "Bill", :last_name => "Smith")
      student_two = Student.create(:first_name => "Sam", :last_name => "Orr")

      Student.any_students_with_same_first_names?.should == false
    end
  end

  describe ".any_students_with_same_last_names?" do
    it "should return true if there are any students with the same first name" do
      student_one = Student.create(:first_name => "Sam", :last_name => "Smith")
      student_two = Student.create(:first_name => "Bill", :last_name => "Smith")

      Student.any_students_with_same_last_names?.should == true
    end

    it "should return false if there are not any students with the same last name" do
      student_one = Student.create(:first_name => "Bill", :last_name => "Smith")
      student_two = Student.create(:first_name => "Sam", :last_name => "Orr")

      Student.any_students_with_same_last_names?.should == false
    end
  end

  describe ".number_of_male_students" do
    it "should return the number of male students" do
      student_one = Student.create(:sex => "Male")
      student_two = Student.create(:sex => "Male")
      student_three = Student.create(:sex => "Female")

      Student.number_of_male_students.should == 2
    end
  end

  describe ".number_of_female_students" do
    it "should return the number of male students" do
      student_one = Student.create(:sex => "Male")
      student_two = Student.create(:sex => "Male")
      student_three = Student.create(:sex => "Female")

      Student.number_of_female_students.should == 1
    end
  end

  describe ".redhead_students_first_names" do
    it "should return the first names of all the redhead students" do
      bill = Student.create(:first_name => "Bill", :hair_color => "red")
      mike = Student.create(:first_name => "Mike", :hair_color => "brown")

      Student.redhead_students_first_names.should == ["Bill"]
    end
  end

  describe ".students_ordered_by_birthdates" do
    it "should order all students by their birthdates" do
      student_one = Student.create(:date_of_birth => "30-8-2001")
      student_two = Student.create(:date_of_birth => "22-1-2002")
      student_three = Student.create(:date_of_birth => "15-4-2003")

      Student.students_ordered_by_birthdates.should == [student_one, student_two, student_three]
    end
  end
end



