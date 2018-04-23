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

#3 Create new run

  A Run doesn't exist outside of the context of what Month it belongs_to.  MUST be created with this in mind.
    -Represent this through the URL.
      -NESTED RESOURCE.

  POST /months/:id/runs

  Nested Resource
    -Runs are nested in terms of URLs under their parent Month

#4 Create users and signup/login (AUTHENTICATION)

What URLs do I need?
  get /users/new      <!-- users#new -->
    -form
  post /users         <!-- users#create -->
    -create user in the database


  get /login          <!-- sessions#new -->
    -form
  post /sessions      <!-- sessions#create -->
    -"log the user in"
