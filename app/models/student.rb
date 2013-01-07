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
          :date_of_birth => birthdates.sample,
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

  def self.number_of_female_students
    Student.where(:sex => "Female").count
  end

  def self.redhead_students_first_names
    Student.where(:hair_color => "red").map(&:first_name)
  end

  def self.birthdates_within_thirty_days
    thirty_days_later = Date.today - 30.days
    birthdate_range = Date.today..thirty_days_later
    Student.where(:date_of_birth => birthdate_range).order(:date_of_birth => :asc)
    #I need to minus the year on the birthdates (date_select :discard_year => true)
  end

  def self.students_ordered_by_birthdates
    earliest_birthdate = Date.parse("1-9-1994")
    latest_birthdate = Date.parse("30-8-2007")
    birthdates = (earliest_birthdate..latest_birthdate).to_a

    Student.where(:date_of_birth => birthdates).order(:date_of_birth => :asc)
  end

  def self.output_name_and_age
    Student.order("date_of_birth ASC").each do |student|
      puts "#{student.first_name} #{student.last_name} is #{(Time.now.year - student.date_of_birth.year)} years old."
    end
  end

  def self.list_by_eye_color
    puts "Blue eyes"
    Student.where(:eye_color => "blue").map(&:first_name)
    puts "Green eyes"
    Student.where(:eye_color => "green").map(&:first_name)
    puts "Brown eyes"
    Student.where(:eye_color => "brown").map(&:first_name)
  end

    #eyes = Student.select("first_name, eye_color").group("eye_color")
    #eyes.each do |eye|
    #  puts "*" * 50
    #  puts eye.eye_color.upcase
    #  puts "*" * 50
    #  student = Student.select("first_name, eye_color")
    #  students.each do |student|
    #    puts student.first_name if student.eye_color == eye.eye_color
    #  end
    #end
end
