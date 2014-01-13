# Chipotle Software (c) 2014 GPLv3

Fabricator(:group) do
   name        { Faker::Name.first_name }
   description { Faker::Lorem.characters 22 }
end
