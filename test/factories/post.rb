FactoryGirl.define do
  factory :post do
    title "MyString2"
    content "some content"

    after(:create) do |t|
      t.publicate
    end
  end
end