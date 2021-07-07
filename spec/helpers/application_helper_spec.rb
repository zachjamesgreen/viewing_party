require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe 'Formats time in minutes to H:MM format' do
    it 'returns the formated time' do
      formatted_time = helper.format_minutes(138)
      expect(formatted_time).to eq '2:18'
    end
  end
end