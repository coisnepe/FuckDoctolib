# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all


the_speciality = ['Cardilogue','Généraliste','Dentiste','Pneumologue', 'Médécin du sport', 'Gynécologue', 'Neuro-Chirurgien(ne)', 'psychiatre']

10.times do
    city = City.create!(city_name: Faker::Address.city)
end


10.times do
    doctor = Doctor.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      zip_code: Faker::Address.zip_code,
      speciality: the_speciality.sample,
    )
end


10.times do
    patient = Patient.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
    )
end

#pick_city = ['Lyon', 'Marseille', 'Paris', 'La Rochelle', 'Montpellier', 'Agen', 'Ajaccio', 'Nantes', 'Bordeaux', 'Aix-en-Provence']

50.times do
    appointment = Appointment.create!(
      doctor_id: Doctor.all.sample.id,
      patient_id: Patient.all.sample.id,
      date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default),
      city_id: City.all.sample.id
    )
end


puts "Voilà! j'ai crée 10 Docteurs, 10 Patients, 10 villes et généré 50 appointments! "