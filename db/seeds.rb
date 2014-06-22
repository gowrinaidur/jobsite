# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Admin.new
admin.status = 1
user = admin.build_user
user.first_name = "Super"
user.last_name = "Admin"
user.username = 'superadmin'
user.email = "admin@example.com"
user.password = "admin123"
user.password_confirmation = "admin123"
user.phone = "9876543210"
admin.save