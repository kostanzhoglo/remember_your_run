#1 - Grab some CSS from ToDoMVC to Asset Pipeline, to integrate front-end styles.

#2 - Let people CRUD their runs.

 - create a run
 - see their runs over the past month
 - show a run and it's stats.
 - edit a run


run
  belongs to a user
  belongs to a month

user
  has many runs
  has many months through runs

month
  has many runs
  has many users through runs
