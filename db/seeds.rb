FactoryGirl.create :user, email: "duong@gmail.com", role: "admin"
50.times do
  FactoryGirl.create :user
end

FactoryGirl.create :team
FactoryGirl.create :project
