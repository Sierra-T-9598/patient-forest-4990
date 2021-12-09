require 'rails_helper'

RSpec.describe 'Movie Show' do
  describe 'When a user visits a movie show page' do
    before(:each) do
      @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      @raiders = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      @shrek = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

      @studio_2 = Studio.create!(name: 'Best Studio', location: 'Paris')
      @proposal = @studio_2.movies.create!(title: 'The Proposal', creation_year: 2000, genre: 'Comedy/Romance')
      @dune = @studio_2.movies.create!(title: 'Dune', creation_year: 2021, genre: 'Action/Adventure')

    end

    it 'displays the movie title' do
    end

    it 'displays the movie creation year' do
    end

    it 'displays the movie genre' do
    end

    it 'lists all of the actors from youngest to oldest' do
    end

    it 'shows the average age of all the actors' do
    end
  end
end
