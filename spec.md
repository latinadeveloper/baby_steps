# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
The has_many relationships can be found in the Child model. It has_many skills and accomplishments. The Skill model also has_many accomplishments, and the User model has_many children.

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
In the Accomplishment model there are two belongs_to relationships, one is to the child and the other to a skill. In the Child model you will find a belongs_to the user relationship.

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
The has_many_through relationship is found in the Child model, where a Child has many skills through accomplishments.

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
The comment attribute and perform attribute are both submittable ones in through form. Located in the skill index page.

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
Validations included in the User, and Chid model.

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
In the Accomplishment model class method self.recent_skills was created to view the Recent 5 Skills a child has achieved. This is viewed through the skills recent page.

- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
The custom attribute writer child_attributes=(attributes) can be found in the User model. This is used through a nested form where it checks to see if a child exists, if so the attributes are updated for the child, but if there is no child this method will create a new child, with its attributes for its associated user.

- [x] Include signup (how e.g. Devise)
Sign up form can be found in the user/new file.

- [x] Include login (how e.g. Devise)
Sign up form can be found in the sessions/new file where the user will be asked to log in. The create method in the session controller signs in the user.

- [x] Include logout (how e.g. Devise)
The sign out link can be found once a user is logged in. It will use the signout_path and call the destroy method in the sessions controller.

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
The OmniAuth gem for facebook was used to login the user through a third party. This can be seen in the sessions controller create method, where it checks to see if the request is done by omniauth.

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
Nested index can be found in the skills/index file. The form_fields for accomplishments can be viewed.

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
The button to add a new skill from the skills/index page uses a nested resource to create a new accomplishment. It can be directly seen on the skills/new file where a drop down list of the available accomplishments can be selected as well as adding a comment for that accomplishment.

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
In the form when adding a new chid which is file children/new, or in the users/new file validations will be displayed when the requested information on the form is not there or in desired format.

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
