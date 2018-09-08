FactoryBot.define do
  factory :product do
    valid false
    name "MyString"
    description "MyString"
    catalogId 1
    fullCatalog false
    weight 1
    sku "MyString"
    images "MyString"
    images128 "MyString"
    images512 "MyString"
    imageCounter 1
    created "2018-09-08 16:10:00"
    mrpPrice 1
    rowLastUpdated "2018-09-08 16:10:00"
  end
end
