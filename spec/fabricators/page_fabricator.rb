Fabricator(:page) do
  title 'Foobar'
  email { Faker::Internet.email }
  
end
