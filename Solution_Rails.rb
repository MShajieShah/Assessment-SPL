# What is active record?
Ans:
Active record provides an interface and connection between the tables in a relational database.
Active record specify all the associations

# What are strong params in rails?
# Ans:
Strong Parameters is a feature of Rails that prevents assigning request parameters to objects unless they have been explicitly permitted
Strong params are used in lots of Rails programs to increase the safety of information sent through forms. strong Params allow to specify 
in the controller which parameters are conventional and used

# What if we allow all params then will their be any advantage or disadvantage. Describe in a situation
Ans:
Answer:
In scenario, when we go to other page with some params info so we'll passing params of regarding information of any thing like product_id 
etc. If we passing all params that are required this is good and optimizated because if we didn't pass total required params so we'll find on
 controller which there are method from database. So this is good if we have params so we'll be passing it which we need.

# You should have seen model helper files that are in directory app/helpers. When should we use
# those file in what situation . Describe in a situation where we can utilize those helper files
Ans:
If you want to use helper methods for all your controller and views. Then you can add methods to application helper and include it to 
application controller. However if you dont want to expose methods to views, then you can use rails concerns. create a methods inside
it and include it inside different controllers.
No helper do not name the same name only for readability. you still need to include inside your same name controller to call functions 
if you want to use it inside controller. But you can still use inside views methods with same name.



# How we can create parent child in association in rails
# In parent model what we write
 Ans:
class Vehicle < ActiveRecord::Base
  has_many :child
end

# In child model what we write
 Ans:
class Vehicle < ActiveRecord::Base
belongs_to :parent
end

# And if we delete a parent its children should be destroyed . how should we go about doing this
# Ans:

# What are active record migrations in rails?
Ans:
Active record migration allows you to evolve your database schema over time.

# What is layout in rails?
Ans:
To make a complete view ,pieces that fit together (for example header, footer, menus, etc) 
# What are partial templates and when they are used? What are the advantages of using those?
 Ans:
 They are only use to create a unique cache key. Example header.html