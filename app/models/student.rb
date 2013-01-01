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
          :date_of_birth => birthdates.shuffle,
          :hair_color => hair_color.shuffle,
          :eye_color => eye_colors.shuffle,
          :height => inches.shuffle.first,
          :weight => pounds.shuffle.first,
          :sex => genders.shuffle
      )
    end
  end

end
