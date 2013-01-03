class Student < ActiveRecord::Base
  attr_accessible :date_of_birth, :eye_color, :first_name, :hair_color, :height, :last_name, :middle_name, :sex, :weight

  def self.seed_data!
    genders = ["Male", "Female"]
    eye_colors = ["blue", "green", "brown"]
    hair_color = ["red", "blonde", "brown", "black"]
    inches = (37..65).to_a
    pounds= (35..200).to_a

    earliest_birthdate = Date.parse("1-9-1994")
    latest_birthdate = Date.parse("30-8-2007")
    birthdates = (earliest_birthdate..latest_birthdate).to_a


    500.times do
      Student.create(
          :first_name => Faker::Name.first_name,
          :middle_name => Faker::Name.first_name,
          :last_name => Faker::Name.last_name,
          :date_of_birth => birthdates.shuffle.first,
          :hair_color => hair_color.shuffle.first,
          :eye_color => eye_colors.shuffle.first,
          :height => inches.shuffle.first,
          :weight => pounds.shuffle.first,
          :sex => genders.shuffle.first
      )
    end
  end

  def self.tommy_smiths
    Student.where(:first_name => "Tommy", :last_name => "Smith")
  end

  def self.number_of_five_year_olds
    five = Date.today - 5.years
    year = five + 1.years

    Student.where(:date_of_birth => five..year).count
  end

  def self.number_of_six_year_olds
    six = Date.today - 6.years
    year = six + 1.years

    Student.where(:date_of_birth => six..year).count
  end

  def self.number_of_seven_to_nine_year_olds
    seven = Date.today - 7.years
    nine = seven + 2.years

    Student.where(:date_of_birth => seven..nine).count
  end

  def self.number_of_teenagers
    thirteen = Date.today - 13.years
    nineteen = thirteen + 6.years

    Student.where(:date_of_birth => thirteen..nineteen).count
  end

  def self.green_eye_students

    Student.where(:eye_color => "green").count
  end

  def self.any_students_with_same_first_names?
    Student.count(:group => :first_name, :having => "count(*) > 1").any?
  end

  def self.any_students_with_same_last_names?
    Student.count(:group => :last_name, :having => "count(*) > 1").any?
  end

  def self.number_of_male_students
    Student.where(:sex => "Male").count
  end
end
