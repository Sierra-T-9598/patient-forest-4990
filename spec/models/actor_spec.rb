require 'rails_helper'

  RSpec.describe Actor, type: :model do
    describe "relationships" do
      it {should have_many :actor_movies}
      it {should have_many(:movies).through(:actor_movies)}
    end

    describe 'class methods' do
      describe '::by_age' do
        it 'lists actors from youngest to oldest' do
          universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
          raiders = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
          shrek = universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
          actor_1 = raiders.actors.create!(name: 'Harrison Ford', age: 65)
          actor_2 = raiders.actors.create!(name: 'Paul Freeman', age: 68)
          actor_3 = raiders.actors.create!(name: 'Karen Allen', age: 50)
          actor_4 = shrek.actors.create!(name: 'Eddie Murphy', age: 40)

          expect(Actor.by_age).to eq([actor_4, actor_3, actor_1, actor_2])
        end

      describe '::average_age' do
          it 'calculates the average age of actors' do
            universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
            raiders = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
            shrek = universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
            actor_1 = raiders.actors.create!(name: 'Harrison Ford', age: 65)
            actor_2 = raiders.actors.create!(name: 'Paul Freeman', age: 68)
            actor_3 = raiders.actors.create!(name: 'Karen Allen', age: 50)

            expect(Actor.average_age).to eq(61)
          end
      end
    end
  end
end
