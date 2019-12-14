# Specifications for the Rails Assessment
Specs:

 [x] Using Ruby on Rails for the project - Rails framework
 [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - User has_many reviews
 [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) - Product belongs_to user
 [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) - User has_many commented_products through reviews, Product has_many users through reviews
 [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
 [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - Review title and content
 [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - username, review title and content, product all
 [x]  Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
 [x] Include signup (how e.g. Devise) - ???
 [x] Include login (how e.g. Devise) - ???
 [x] Include logout (how e.g. Devise) - ???
 [x] Include third party signup/login (how e.g. Devise/OmniAuth) - Google Oauth2
 [x] Include nested resource show or index (URL e.g. users/2/recipes) product reviews
 [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) new_product_review(@product)
 [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:

 [x] The application is pretty DRY
 [x] Limited logic in controllers
 [x] Views use helper methods if appropriate
 [x] Views use partials if appropriate