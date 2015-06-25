FactoryGirl.create :user, email: "duong@gmail.com", role: "admin"
FactoryGirl.create :user, email: "duongnv.hedspi@gmail.com",
                          password: "mr.cay30492",
                          password_confirmation: "mr.cay30492",
                          role: "admin"
50.times do
  FactoryGirl.create :user
end

FactoryGirl.create :team
FactoryGirl.create :project
