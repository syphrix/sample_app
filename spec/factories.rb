FactoryGirl.define do
	factory :user do
		name		"Mike Brown"
		email		"mike@brown.none"
		password	"foobar"
		password_confirmation	"foobar"
	end
end