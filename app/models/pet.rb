class Pet < ActiveRecord::Base
   belongs_to :shelter
   belongs_to :adopter

   def self.oldest
      max_age = Pet.maximum(:age)
      Pet.all.find_by("age = ?", max_age)
   end

   def self.average_age
      Pet.average("age")
   end

   def in_dog_years
      self.species == "dog" ? self.age * 7 : self.age
   end
end
