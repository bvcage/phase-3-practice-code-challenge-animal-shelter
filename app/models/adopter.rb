class Adopter < ActiveRecord::Base
   has_many :pets
   has_many :shelters, through: :pets

   def full_name
      "#{self.first_name} #{self.last_name}"
   end

   def adopt(pet)
      return if pet.adopted? == true
      pet.update({
         :adopted? => true,
         :adopter_id => self.id
      })
   end

   def fav_pet
      return if self.pets.count == 0
      self.pets.group(:species).count.max_by{|k,v| v}[0]
   end
end
