# frozen_string_literal: true

require 'csv'

models = [VisitType, Discipline, Agency, Contract]
models.each do |m|
  CSV.foreach("lib/seeds/#{m.name.underscore}.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    m.create!(row.to_h)
  end
  puts "#{m}: #{m.count}"
end

CSV.foreach("lib/seeds/user_2.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  User.create!(row.to_h)
end
puts "User: #{User.count}"


models2 = [Clearance, Patient, AgencyRate, Rate, Visit]
models2.each do |m|
  CSV.foreach("lib/seeds/#{m.name.underscore}.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    m.create!(row.to_h)
  end
  puts "#{m}: #{m.count}"
end
