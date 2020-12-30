# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create({email: 'joni.batista@tecmic.pt', password: 'Tecmic.12345', name: 'Jóni Batista', manager: true})
User.create({email: 'john.doe@tecmic.pt', password: 'Tecmic.12345', name: 'John Doe', manager: false})

Customer.create([{name: 'TECMIC'}, {name: 'CARRIS'}, {name: 'CARRISTUR'}, {name: 'RODOTEJO'}])

TaskType.create([{name: 'Análise e levantamento de requisitos'}, {name: 'Especificação de requisitos'}, 
    {name: 'Desenvolvimento'}, {name: 'Teste, validação e deploy'}, {name: 'Suporte e operacionalização'}, 
    {name: 'Gestão'}, {name: 'Manutenção'}, {name: 'Actividade interna'}])
