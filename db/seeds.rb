User.create!(email: "ngovanduong@railstutorial.org",
             password:              "ngovanduong",
             password_confirmation: "ngovanduong")

50.times do |n|
  email = "ngovanduong-#{n+1}@railstutorial.org"
  password = "ngovanduong"
  User.create!(email: email,
               password:              password,
               password_confirmation: password)
end