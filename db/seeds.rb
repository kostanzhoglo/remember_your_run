# This file contains all the record creation needed to seed the database with EXAMPLE values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Once you understand the data being displayed, you can delete this seed data,
# by writing "rake db:drop".  To reset a new database, write "rake db:migrate",
# and you're ready to go!

# users
bobby = User.create(email: "bob@hotmail.com", password: "beamer")

# months
mar = Month.create(name: "March", year: "2018", goal: "Run average of 7:45 pace")
apr = Month.create(name: "April", year: "2018", goal: "Run 60 miles this month")


# runs
bobby1 = Run.create(date: "3/1", name: "Shore Dr.", distance: 4.1, duration: "35:00", notes: "Sunny outside", number_intervals: 10, interval_length: ":50", rest_between_interval: ":40", month_id: 1, user_id: 1)
bobby2 = Run.create(date: "4/1", name: "Shore Dr.", distance: 4.1, duration: "33:00", notes: "Fast today", number_intervals: 15, interval_length: ":50", rest_between_interval: ":40", month_id: 2, user_id: 1)
