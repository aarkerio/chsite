# Chipotle Software (c) 2014 GPLv3

Fabricator(:user) do
   fname {Faker::Name.first_name}
   lname {Faker::Name.last_name}
   uname {Faker::Name.first_name}
   email {Faker::Internet.email}
   password 'sdafsdf43543dsgfdsffsd' 
   password_confirmation 'sdafsdf43543dsgfdsffsd' 
   active "1"
   # created Time.now.to_s
   group  { Fabricate(:group) }
   encrypted_password { BCrypt::Password.create("asdasdastr4325234324sdfds") }
   #group { |a| a.association(:group) }
   #fb_id "12345"
   #fb_token "AAAAA"
   #fb_expires_at DateTime.tomorrow
   #passwd { Faker::Lorem.characters 10 }
   # password_confirmation { |u| u.password }
end
