# Chipotle Software (c) 2014 GPLv3

Fabricator(:page) do
  title      { Faker::Lorem.characters 12 }
  body       { Faker::Lorem.characters 68 }
  discution  true
  published  false
  visits     3
  tags       "linux, education, elearning"
  rank       3
  cv         true
  editor     true
  user_id    { Fabricate(:user) } 
  section_id { Fabricate(:section) }
  slug       { Faker::Lorem.characters 12 }  
end
