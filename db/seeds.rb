name  = "Admin"
email = "admin@gmail.com"
password = "password"
password_confirmation =  "password"
admin = true
User.create!(name: name, email: email, password: password, password_confirmation: password_confirmation, admin: admin)
