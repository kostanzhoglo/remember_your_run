#Specifications for the Rails Assessment

Specs:

[X]  Using Ruby on Rails for the project
      YES.
[X]  Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
      User has_many Runs
[X]  Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
      Runs belong_to User
[X]  Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
      User has_many Months through Runs
[X]  The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
      runs.distance
[X]  Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
      User, Run, Month
[X]  Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
      Run.fastest_pace  URL: /fastest_pace
[X]  Include signup (how e.g. Devise)
      YES. Local.
[X]  Include login (how e.g. Devise)
      YES. Local.
[X]  Include logout (how e.g. Devise)
      YES. Local.   URL:  /logout   or a link on /
[X]  Include third party signup/login (how e.g. Devise/OmniAuth)
      YES.  Github/OmniAuth
[X]  Include nested resource show or index (URL e.g. users/2/recipes)
      YES.  months/:id/runs
[X]  Include nested resource "new" form (URL e.g. recipes/1/ingredients)
      YES.  /months/:id
[X]  Include form display of validation errors (form URL e.g. /recipes/new)
      YES. /months/:id  "submit" Form with bad data and error messages will display.

Confirm:

[X]  The application is pretty DRY
[X]  Limited logic in controllers
[X]  Views use helper methods if appropriate
[X]  Views use partials if appropriate
