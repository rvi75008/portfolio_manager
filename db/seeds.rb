# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
r1 = Role.create({ name: 'Admin', description: 'Can read and create items. Can update and destroy own items' })
r2 = Role.create({ name: 'Regular', description: 'Can perform any CRUD operation on any resource' })

u1 = User.create({ name: 'Raphaël', email: 'raphael.vignes@laposte.net', password: 'a', password_confirmation: 'a', role_id: r1.id })
u2 = User.create({ name: 'Mélodie', email: 'msouksone@gmail.com', password: 'a', password_confirmation: 'a', role_id: r2.id })

o1 = Owner.create({ first_name: 'Raphaël', last_name: 'VIGNES', user_id: u1.id })
o2 = Owner.create({ first_name: 'Mélodie', last_name: 'VIGNES', user_id: u2.id })
