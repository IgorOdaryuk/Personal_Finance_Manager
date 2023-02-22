require 'faker'

5.times do |num|
  user = User.new(
    email: "test#{num + 1}@test.com",
    password: "qwerty",
    created_at: Time.now,
    updated_at: Time.now,
    locale: 'en'
  )

  user.save!
end

cats = { 'House' => 'Things to my home',
         'Beer' => 'Favourite alcohol',
         'Internet' => 'Payment in web',
         'Restaurants' => 'Business lunch',
         'Games' => "Games on PC",
         'Coffee' => "Just to wake up",
         'Music' => 'Outlays to keep my menthal health',
         'Business' => 'Income from my skateshop',
         'Work' => 'My  freelance salary'

}

5.times do |user|
  cats.each do |cat_name, cat_desc|
    cat = Category.new(
      name: cat_name,
      description: cat_desc,
      created_at: Time.now,
      updated_at: Time.now,
      user_id: user + 1
    )

    cat.save!
  end
end

# House operations
rand(30...50).times do
  operation = Operation.new(
    amount: rand(5..1000),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::House.furniture}",
    category_id: 1,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: rand(1..5),
    income: false
  )

  operation.save!
end

# Beer operations
rand(30...50).times do
  operation = Operation.new(
    amount: rand(5..100),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Beer.name}",
    category_id: 2,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: rand(1..5),
    income: false
  )

  operation.save!
end

# Internet operations
rand(30...50).times do
  operation = Operation.new(
    amount: rand(100..500),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "Buy on #{Faker::Internet.domain_name}",
    category_id: 3,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: rand(1..5),
    income: false
  )

  operation.save!
end

# Restaurants operations
rand(30...50).times do
  operation = Operation.new(
    amount: rand(50..200),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Food.description}",
    category_id: 4,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: rand(1..5),
    income: false
  )

  operation.save!
end

# Games operations
rand(30...50).times do
  operation = Operation.new(
    amount: rand(100..1000),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Game.title}",
    category_id: 5,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: rand(1..5),
    income: false
  )

  operation.save!
end

# Coffee operations
rand(30...50).times do
  operation = Operation.new(
    amount: rand(20..300),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Coffee.blend_name}",
    category_id: 6,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: rand(1..5),
    income: false
  )

  operation.save!
end

# Music operations
rand(30...50).times do
  operation = Operation.new(
    amount: rand(20..300),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "#{Faker::Music.album}",
    category_id: 7,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: rand(1..5),
    income: false
  )

  operation.save!
end

# Business income operations
rand(30...50).times do
  operation = Operation.new(
    amount: rand(1..1500),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "From #{Faker::Business.credit_card_number}",
    category_id: 8,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: rand(1..5),
    income: true
  )

  operation.save!
end

# Work income operations
rand(30...50).times do
  operation = Operation.new(
    amount: rand(1000..4500),
    odate: Faker::Time.between_dates(from: Date.today - 700, to: Date.today, period: :day),
    description: "From #{Faker::Business.credit_card_number}",
    category_id: 9,
    created_at: Time.now,
    updated_at: Time.now,
    user_id: rand(1..5),
    income: true
  )

  operation.save!
end
