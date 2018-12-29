FactoryBot.define do
  factory :agency_rate do
    agency
    visit_type
    amount { rand(125.50...170.25) }
    arrangement { [0, 1, 2].sample }
  end
end
