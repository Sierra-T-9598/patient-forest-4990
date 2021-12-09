require 'rails_helper'

RSpec.describe 'Movie Show' do
  describe 'When a user visits a movie show page' do
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

      visit "/movies/#{@raiders.id}"
    end

    it 'displays the movie title' do
      expect(page).to have_content(@raiders.title)
      expect(page).to_not have_content(@shrek.title)
    end

    it 'displays the movie creation year' do
      expect(page).to have_content(@raiders.creation_year)
      expect(page).to_not have_content(@shrek.creation_year)
    end

    it 'displays the movie genre' do
      expect(page).to have_content(@raiders.genre)
      expect(page).to_not have_content(@shrek.genre)
    end

    it 'lists all of the actors from youngest to oldest' do
      expect(@actor_3.name).to appear_before(@actor_1.name)
      expect(@actor_3.name).to appear_before(@actor_2.name)
      expect(@actor_2.name).to_not appear_before(@actor_1.name)
      expect(page).to_not have_content(@actor_4.name)
    end

    it 'does not list actors that are not part of the movie' do
      expect(page).to_not have_content(@actor_4.name)
      expect(page).to_not have_content(@actor_5.name)
      expect(page).to_not have_content(@actor_6.name)
    end

    it 'shows the average age of all the actors' do
      expect(page).to have_content('Average age of actors: 61')
    end

    it 'has a form to add an actor for this movie' do
      expect(page).to have_content("Add an actor for #{@raiders.title}")
      expect(page).to have_button('Submit')
      expect(current_path).to eq("/movies/#{@raiders.id}")
    end

    it 'can add an actor that exists for this movie' do
      fill_in(:name, with: 'Existing Actor')
      fill_in(:age, with: 90)

      click_button('Submit')

      expect(current_path).to eq("/movies/#{@raiders.id}")
      expect(page).to have_content('Existing Actor')
      save_and_open_page
    end
  end
end
