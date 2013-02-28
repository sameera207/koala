# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  	factory :document do |f|
	  f.title "sameera CV"
	  f.document { File.new(File.join(Rails.root, 'spec/features', 'support', 'sample.txt')) }
	end
end
