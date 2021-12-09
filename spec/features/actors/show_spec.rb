require 'rails_helper'

RSpec.describe 'Actor Show' do
  describe 'when a user visits an actor show page' do
    before(:each) do
      @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      @raiders = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      @shrek = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
      @actor_1 = @raiders.actors.create!(name: 'Harrison Ford', age: 65)
      @actor_2 = @raiders.actors.create!(name: 'Paul Freeman', age: 68)
      @actor_3 = @raiders.actors.create!(name: 'Karen Allen', age: 50)
      @actor_4 = @shrek.actors.create!(name: 'Eddie Murphy', age: 40)

      @studio_2 = Studio.create!(name: 'Best Studio', location: 'Paris')
      @proposal = @studio_2.movies.create!(title: 'The Proposal', creation_year: 2000, genre: 'Comedy/Romance')
      @actor_5 = @proposal.actors.create!(name: 'Sandra Bullock', age: 40)
      @dune = @studio_2.movies.create!(title: 'Dune', creation_year: 2021, genre: 'Action/Adventure')
      @actor_6 = @dune.actors.create!(name: 'Zendaya', age: 40)

      visit "/actors/#{@actor_1.id}"
    end

    it 'displays the actor name' do
      expect(page).to have_content(@actor_1.name)
    end

    it 'displays the actor age' do
      expect(page).to have_content(@actor_1.age)
      expect(page).to_not have_content(@actor_2.age)
    end

    it 'list coactors for this actor' do
      expect(page).to have_content(@actor_2.name)
      expect(page).to have_content(@actor_3.name)
      expect(page).to_not have_content(@actor_6.name)
      expect(page).to_not have_content(@actor_5.name)
    end
  end
end
