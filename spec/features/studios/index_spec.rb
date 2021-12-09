require 'rails_helper'

RSpec.describe 'Studio Index' do
  describe 'when user visits the studio index page' do
    before(:each) do
      @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      @raiders = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      @shrek = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

      @studio_2 = Studio.create!(name: 'Best Studio', location: 'Paris')
      @proposal = @studio_2.movies.create!(title: 'The Proposal', creation_year: 2000, genre: 'Comedy/Romance')
      @dune = @studio_2.movies.create!(title: 'Dune', creation_year: 2021, genre: 'Action/Adventure')

      visit '/studios'
    end

    it 'displays each studio name and location' do
      expect(page).to have_content(@universal.name)
      expect(page).to have_content(@universal.location)

      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@studio_2.location)
    end

    it 'under each studio is the titles of all its movies' do
      expect(page).to have_content(@raiders.title)
      expect(page).to have_content(@shrek.title)
      expect(page).to have_content(@proposal.title)
      expect(page).to have_content(@dune.title)
    end
  end
end
