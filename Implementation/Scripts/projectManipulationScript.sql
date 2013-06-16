use NikeshProject; # Use the correct DB

# See how many Recipes are in the database
select count(*)
from Recipe;

# Decide what to eat for a snack
select FoodName
from Food
where MealType = 'Snack';

# Decide what you might want to drink with your snack
select DrinkName
from Drink
where isAlcoholic = 'F';

# Now look up the directions of the things you might want to make

# Look up the directions for snacks
select FoodName, Directions
from Food cross join Recipe
where Food.RecipeID = Recipe.RecipeID
	  AND Food.MealType = 'Snack';

# Look up the directions for a non-alcoholic drink
select DrinkName, Directions
from Drink cross join Recipe
where Drink.RecipeID = Recipe.RecipeID
	  AND Drink.isAlcoholic = 'F';

# Now check what ingredients your Food needs
select FoodName, IngredientName
from Food cross join madeUpOf_areIn cross join Ingredient
where Food.RecipeID = madeUpOf_areIn.RecipeID
  and madeUpOf_areIn.IngredientID = Ingredient.IngredientID
  and Food.MealType = 'Snack';

# And check what ingredients your Drink needs
select DrinkName, IngredientName
from Drink cross join madeUpOf_areIn cross join Ingredient
where Drink.RecipeID = madeUpOf_areIn.RecipeID
  and madeUpOf_areIn.IngredientID = Ingredient.IngredientID
  and Drink.isAlcoholic = 'F';

# Pull up the grocery list for the week
select GroceryList.ShoppingDate, Ingredient.IngredientName, Ingredient.Quantity
from GroceryList natural join madeUpOf_areIn natural join Ingredient;

# insert some new items into the database
insert into Recipe values(5, 'A recipe(algorithm) to solve NP problems in polynomial time'); # Oops, do not know if this works or not, if it did I would have a $1M 

# Sadly, I do not have that algorithm 
delete from Recipe
where RecipeID = 5;

# Let us insert some real recipes in here though

# Cinnabon roll
insert into Recipe values(6, 'Place ingredients in the pan of the bread machine in the order recommended by the manufacturer. Select dough cycle; press Start.
After the dough has doubled in size turn it out onto a lightly floured surface, cover and let rest for 10 minutes. In a small bowl, combine brown sugar and cinnamon.
Roll dough into a 16x21 inch rectangle. Spread dough with 1/3 cup butter and sprinkle evenly with sugar/cinnamon mixture. Roll up dough and cut into 12 rolls. Place rolls in a lightly greased 9x13 inch baking pan. Cover and let rise until nearly doubled, about 30 minutes. Meanwhile, preheat oven to 400 degrees F (200 degrees C).
Bake rolls in preheated oven until golden brown, about 15 minutes. While rolls are baking, beat together cream cheese, 1/4 cup butter, confectioners sugar, vanilla extract and salt. Spread frosting on warm rolls before serving.');

insert into Food values(3, 'Clone of a Cinnabon', 'Snack', 'American', 525, 6);

# Insert all the masses which you do not already have in the table
insert into Mass values('1/3 cup', 83);
insert into Mass values('4 1/2 cups', 900);
insert into Mass values('2 1/2 tsp', null);
insert into Mass values('1 (3 ounce) package', 85);
insert into Mass values('1/4 cup', 50);
insert into Mass values('1 1/2 cups', 150);
insert into Mass values('1/2 tsp', null);
insert into Mass values('1/8 tsp', null);

# Insert the ingredients into the ingredient table
insert into Ingredient values(35, 'warm milk (110 degrees F/45 degrees C)', '1 cup');
insert into Ingredient values(36,'eggs, room temperature', '2');
insert into Ingredient values(37, 'margarine, melted', '1/3 cup');
insert into Ingredient values(38, 'bread flour', '4 1/2 cups');
insert into Ingredient values(39, 'salt', '1 tsp');
insert into Ingredient values(40, 'white sugar', '1/2 cup');
insert into Ingredient values(41, 'bread machine yeast', '2 1/2 tsp');
insert into Ingredient values(42, 'brown sugar, packed', '1 cup');
insert into Ingredient values(43, 'ground cinnamon', '2 1/2 tsp');
insert into Ingredient values(44, 'butter, softened', '1/3 cup');
insert into Ingredient values(45, 'cream cheese, softened', '1 (3 ounce) package');
insert into Ingredient values(46, 'butter, softened', '1/4 cup');
insert into Ingredient values(47, 'confectioners sugar', '1 1/2 cups');
insert into Ingredient values(48, 'vanilla extract', '1/2 tsp');
insert into Ingredient values(49, 'salt', '1/8 tsp');

# Now just add the relationship between the Cinnabon Recipe and the Ingredients that make it 
insert into madeUpOf_areIn values(6, 35);
insert into madeUpOf_areIn values(6, 36);
insert into madeUpOf_areIn values(6, 37);
insert into madeUpOf_areIn values(6, 38);
insert into madeUpOf_areIn values(6, 39);
insert into madeUpOf_areIn values(6, 40);
insert into madeUpOf_areIn values(6, 41);
insert into madeUpOf_areIn values(6, 42);
insert into madeUpOf_areIn values(6, 43);
insert into madeUpOf_areIn values(6, 44);
insert into madeUpOf_areIn values(6, 45);
insert into madeUpOf_areIn values(6, 46);
insert into madeUpOf_areIn values(6, 47);
insert into madeUpOf_areIn values(6, 48);
insert into madeUpOf_areIn values(6, 49);

# Now make a grocery list for next week and start it off by adding the Ingredients needed for the Cinnabon roll
insert into GroceryList values(2, "2012-12-08");

# insert into this grocery list all the ingredients for the cinnabon roll
insert into has_areIn values(35, 2);
insert into has_areIn values(36, 2);
insert into has_areIn values(37, 2);
insert into has_areIn values(38, 2);
insert into has_areIn values(39, 2);
insert into has_areIn values(40, 2);
insert into has_areIn values(41, 2);
insert into has_areIn values(42, 2);
insert into has_areIn values(43, 2);
insert into has_areIn values(44, 2);
insert into has_areIn values(45, 2);
insert into has_areIn values(46, 2);
insert into has_areIn values(47, 2);
insert into has_areIn values(48, 2);
insert into has_areIn values(49, 2);
