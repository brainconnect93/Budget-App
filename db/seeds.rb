# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# rails g migration CreateUsers name:string
# rails g migration CreateGroups name:string icon:string
# rails g migration CreateExpenses name:string amount:decimal
# rails g migration CreateGroupExpenses


# rails g migration AddUserRefToGroups user:references:index
# rails g migration AddUserRefToExpenses user:references:index
# rails g migration AddGroupsRefToExpenses group:references:index