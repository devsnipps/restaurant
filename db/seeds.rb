# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
 #Category.create([{ name: 'Italian' }, { name: 'French' }])
Category.where(name: 'Italian').first_or_create(name: 'Italian')
Category.where(name: 'Asian').first_or_create(name: 'Asian')
Category.where(name: 'Greek').first_or_create(name: 'Greek')
Category.where(name: 'French').first_or_create(name: 'French')
Category.where(name: 'Mexican').first_or_create(name: 'Mexican')
Category.where(name: 'India').first_or_create(name: 'India')
Category.where(name: 'Chineese').first_or_create(name: 'Chineese')
Category.where(name: 'Russia').first_or_create(name: 'Russia')
