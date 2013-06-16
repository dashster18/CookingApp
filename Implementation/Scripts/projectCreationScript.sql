# Nikesh Srivastava
# COP 4710
# Project Phase 4: Implementation
# 11/17/2012
# Creation of tables

drop database if exists NikeshProject; # If the database already exists, drop it so you can create a new one

create database NikeshProject; # Create the database

use NikeshProject; # Start using the newly created database

# The recipe table
create table Recipe (
	   RecipeID integer not null, # The primary key of this table
	   Directions longtext, # The directions for the food/drink you are trying to make
constraint Recipe_PK primary key (RecipeID) # Places a primary key constraint on RecipeID
);

# The mass table. Used to indicate how much of something you need for an ingredient
create table Mass (
	   Quantity varchar(20) not null, # The primary key and also how many of a specific ingredient you need
	   Weight integer, # The weight of the ingredient you need. Optional. Will be in grams.
constraint Mass_PK primary key (Quantity) # Places a primary key constraint on Quantity
);

# The Ingredient table. Ingredients are used in recipes and also in grocery lists
create table Ingredient (
	   IngredientID integer not null, # The primary key for this table
	   IngredientName varchar(100), # The name of the ingredient
	   Quantity varchar(20) not null, # How much of the ingredient you need
constraint Ingredient_PK primary key (IngredientID), # Places a primary key constraint on IngredientID
constraint Ingredient_FK foreign key (Quantity) references Mass(Quantity) # Places a foreign key constraint on Quantity, which is in the table Mass
);

# The relation between Recipe and Ingredient, as in Recipes are made up of ingredients
create table madeUpOf_areIn (
	   RecipeID integer not null, # Part of the primary key. Also a foreign key referring to Recipe
	   IngredientID integer not null, # Part of the primary key. Also a foreign key referring to Ingredient
constraint madeUpOf_areIn_PK primary key (RecipeID, IngredientID), # Places a primary key constraint on both attributes
constraint madeUpOf_areIn_FK1 foreign key (RecipeID) references Recipe(RecipeID), # Places a foreign key constraint on RecipeID, which refers to the PK of the Recipe table
constraint madeUpOf_areIn_FK2 foreign key (IngredientID) references Ingredient(IngredientID) # Place a FK constraint on IngredientID, which refers to the PK of the Ingredient table
);

# The Grocery List table
create table GroceryList (
	   ListID integer not null, # PK of this table
	   ShoppingDate date, # The date when this grocery list is set for
constraint GroceryList_PK primary key (ListID) # Sets ListID to the PK of this table
);

# The relation between GroceryList and Ingredient, as in grocery lists are have ingredients
create table has_areIn (
	   IngredientID integer not null, # Part of the PK. Also a FK referring to the Ingredient table
	   ListID integer not null, # Part of the PK. Also a FK referring to the GroceryList table
constraint has_areIn_PK primary key (IngredientID, ListID), # Creates the PK of this table
constraint has_areIn_FK1 foreign key (IngredientID) references Ingredient(IngredientID), # FK1
constraint has_areIn_FK2 foreign key (ListID) references GroceryList(ListID) # FK2
);

# The food table
create table Food (
	   FoodID integer not null, # PK of this table
	   FoodName varchar(100), # The name of the food
	   MealType varchar(10), check (MealType in ('Breakfast', 'Lunch', 'Dinner', 'Snack')), # When would you eat this kind of food?
	   Ethnicity varchar(100), # Which part of the world is this food from?
	   Calories integer, # The number of calories this food has
	   RecipeID integer not null, # Which recipe makes this food
constraint Food_PK primary key (FoodID), # Sets the PK of this table
constraint Food_FK foreign key (RecipeID) references Recipe(RecipeID) # FK which refers to the recipe makes this food
);

# The drink table
create table Drink (
	   DrinkID integer not null, # PK of this table
	   DrinkName varchar(100), # The name of the drink
	   isAlcoholic char(1), check (isAlcoholic in ('T', 'F')), # Is the drink alcoholic?
	   Ethnicity varchar(100), # Which part of the world is this drink from?
	   Calories integer, # The number of calories this drink has
	   RecipeID integer not null, # Which recipe makes this drink?
constraint Drink_PK primary key (DrinkID), # Sets the PK of this table
constraint Drink_FK foreign key (RecipeID) references Recipe(RecipeID) # FK which refers to the Recipe that makes this drink
);
