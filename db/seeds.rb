require 'faker'


8.times do
    Category.create(
        title: Faker::Game.title
    )
end

15.times do |t|
    SubCategory.create(
        title: Faker::Game.title, 
        category_id: Category.all.sample.id
    )
end

35.times do
    Item.create(
        title: Faker::Game.title, 
        description: Faker::Hacker.say_something_smart, 
        stock: Faker::Number.between(from: 50, to: 1000), 
        price: Faker::Number.decimal(l_digits: 6, r_digits: 2), brand: Faker::Appliance.brand,
        sub_category_id: SubCategory.all.sample.id
    )
end

password = Faker::Internet.password
User.create(
    name: Faker::FunnyName.name, 
    email: Faker::Internet.email, 
    password: password, 
    password_confirmation: password, 
    admin: true
)

10.times do
    password = Faker::Internet.password
    User.create(
        name: Faker::Device.platform, 
        email: Faker::Internet.email, 
        password: password, 
        password_confirmation: password, 
        employee: Faker::Boolean.boolean(true_ratio: 0.4)
    )

    Cart.create(
        user_id: User.last.id   
    )

    Order.create(
        user_id: User.last.id,
        country: Faker::Address.country,
        city: Faker::Address.city,
        address: Faker::Address.full_address,
        telephone: Faker::PhoneNumber.cell_phone,
    )
end

8.times do |t|
    3.times do |tm|
        ItemCart.create(
            item_id: Item.all.first.id + t + tm,
            cart_id: Cart.all.first.id + t,
            quantity: Faker::Number.between(from: 1, to: 10)
        )

        ItemOrder.create(
            item_id: Item.all.first.id + t + tm,
            order_id: Order.all.first.id + t,
            quantity: Faker::Number.between(from: 1, to: 10),
            price: Faker::Number.between(from: 1000, to: 10000)
        )
    end
end