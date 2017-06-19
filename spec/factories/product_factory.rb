FactoryGirl.define do
	sequence(:id) { |n| "Product ##{n}" }

	factory :product do
		name "James"
		description "26 inch"
		price $780
		color "red"
	end

  end

