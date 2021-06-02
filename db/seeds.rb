# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create([{
                        username:'admin',
                        email: 'admin@example.com',
                        password: 'admin123',
                        password_confirmation: 'admin123',
                        admin:true
                     }])
client = User.create([{
                       username:'client',
                       email: 'client@example.com',
                       password: 'client123',
                       password_confirmation: 'client123',
                       admin:false
                     }])

online = ActivityType.create([{name: "ONLINE"}])
indoor = ActivityType.create([{name: "INDOOR"}])
outdoor = ActivityType.create([{name: "OUTDOOR"}])

activity1 = Activity.create([{
                               activity_type: online.first,
                               user: admin.first,
                               name: "ONLINE ACT 1",
                               description: "ONLINE ACT 1 DESCR",
                               location: "ONLINE"
                             }])


schedule1 = Schedule.create([{
                              activity: activity1.first,
                              start: Time.now,
                              end: Time.now
                            }])


booking1 = Booking.create([{
                             user: client.first,
                             schedule: schedule1.first
                           }])