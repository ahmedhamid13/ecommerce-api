require 'faker'

password = Faker::Internet.password
User.create(name: Faker::FunnyName.name, email: Faker::Internet.email, password: password, password_confirmation: password, admin: true)

5.times do
    password = Faker::Internet.password
    User.create(name: Faker::Device.platform, email: Faker::Internet.email, password: password, password_confirmation: password, employee: Faker::Boolean.boolean(true_ratio: 0.4))
end

10.times do
    Category.create(title: Faker::Game.title)
end

20.times do
    Item.create(title: Faker::Game.title, description: Faker::Hacker.say_something_smart, stock: Faker::Number.between(from: 50, to: 1000), price: Faker::Number.decimal(l_digits: 6, r_digits: 2), brand: Faker::Appliance.brand)

    SubCategory.create(title: Faker::Game.title,item_id: Item.all.last.id, category_id: Category.all.sample.id)
end