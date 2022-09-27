class Shelter < ActiveRecord::Base
   has_many :pets
   has_many :adopters, through: :pets

   def current_pets
      self.pets.filter {|pet| pet.adopted? == false}
   end

   def adopted_pets
      self.pets.filter {|pet| pet.adopted? == true}
   end
end
