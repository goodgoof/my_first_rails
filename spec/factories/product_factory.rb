FactoryGirl.define do
	sequence(:id) { |n| "Product ##{n}" }

	factory :product do
		name "James"
		description "26 inch"
		price $780
		color "red"
		image_url "https://www.pinterest.com/pin/494270127825878851"
	end

  end

