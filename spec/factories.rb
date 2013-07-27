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
    #i couldn't understand how to push an adress to hotel,
    #so hotel tests are broken now particularly
    #address			{city: "Arkanzas"}
  end
end