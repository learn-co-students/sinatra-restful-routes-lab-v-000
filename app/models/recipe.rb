#Placeholder for a model
class Recipe < ActiveRecord::Base
end


=begin

<h1><heading>A Great Recipe to Try!</heading></h1>
<body>
<h2><%= @recipe.name %></h2>

<h3>The Ingredients: <%= @recipe.ingredients %></h3>

<h3>The Cooking Time: <%= @recipe.cook_time %></h3>

<h1>To Delete, Just Fill Out the Following:</h1>

  <input type="text" name="name">
  <input type="text" name="ingredients">
  <input type="text" name="cook_time">
=end