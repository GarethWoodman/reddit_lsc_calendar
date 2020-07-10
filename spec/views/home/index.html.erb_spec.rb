require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  describe 'index page' do
    it 'shows the right content' do
      visit 'home/index'
      expect(page).to have_content('Hello, world!')
    end
  end
end
