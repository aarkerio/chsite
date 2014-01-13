# Chipotle Software (c) 2014 GPLv3

Fabricator(:section) do
   description  { Faker::Lorem.characters 30 }
   order        { %w(1 2 4 3).sample }
   img          { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'test_images', 'audi.png')) }
end
