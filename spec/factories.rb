FactoryGirl.define do
  factory :user do
    name     "Oleg"
    email    "trophymenko-oleg@yandex.ua"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :hotel do
    title     		"Eldorado"
    star_rating    	50
    rates_count 	1
    hphoto 			"15.jpeg"
  end
end