puts "Seeding data..."

5.times do
   Shelter.create(
      name: Faker::Company.name,
      address: Faker::Address.full_address
   )
end

100.times do
   adopted_val = [true, false].sample
   adopter_id_val = adopted_val ? rand(1..100) : nil
   Pet.create(
      name: Faker::Creature::Animal.name,
      age: rand(1..24),
      species: ["cat", "dog", "mouse"].sample,
      adopted?: adopted_val,
      shelter_id: rand(1..5),
      adopter_id: adopter_id_val
   )
end

40.times do
   Adopter.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
   )
end

puts "Done seeding."