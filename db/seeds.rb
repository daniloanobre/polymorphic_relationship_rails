# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# herman = Author.create name: 'Herman Melville'
# danilo = Author.create name: 'Danilo Assis'
# moby = Book.create title: 'Moby Dick'
# faroeste = Book.create title: 'Faroeste Caboclo'
# herman.books << moby
# herman.books << faroeste

# danilo.books << faroeste


# herman = Author.create name: 'Herman Melville'
# moby = Book.create title: 'Moby Dick', author_id: herman.id
Author.delete_all
Book.delete_all

author = Author.create(name: 'Herman Melville')
Book.create([{title: 'Moby Dick', author_id: author.id}])


# picture = Picture.create path: '/home/danilo/teste.jpg'
# moby.pictures << picture