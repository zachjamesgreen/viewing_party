require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe 'Formats time in minutes to H:MM format' do
    it 'returns the formated time' do
      formatted_time = helper.format_minutes(138)
      expect(formatted_time).to eq '2 hours 18 minutes'
    end

    it 'returns the formated time without hour' do
      formatted_time = helper.format_minutes(44)
      expect(formatted_time).to eq '44 minutes'
    end

    it 'returns the formated time without minutes' do
      formatted_time = helper.format_minutes(120)
      expect(formatted_time).to eq '2 hours'
    end

    it 'returns the formated time with 1 hour' do
      formatted_time = helper.format_minutes(60)
      expect(formatted_time).to eq '1 hour'
    end

    it 'returns the formated time with 1 minute' do
      formatted_time = helper.format_minutes(1)
      expect(formatted_time).to eq '1 minute'
    end
  end
end