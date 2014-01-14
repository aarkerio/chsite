# Chipotle Software (c) 2014 GPLv3

# include ActionDispatch::TestProcess

Fabricator(:image) do
    file   { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'test_images', 'audi.png')) }
#    tags   { Faker::Lorem.characters 20 }
    user   { Fabricate(:user) } 
end
