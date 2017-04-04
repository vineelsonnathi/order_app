# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.new(name: "pqr", description: "pzy", price: 26.21).save
Product.new(name: "xyz", description: "xyz", price: 43.38).save
Product.new(name: "ppp", description: "ppp", price: 23.26).save
Product.new(name: "aaa", description: "aaa", price: 45.23).save