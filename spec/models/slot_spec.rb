require 'rails_helper'
require 'support/factory_bot'

RSpec.describe Slot, type: :model do
  describe '.Slot' do
    it 'base_init' do
      (slot = described_class.new).base_init
      expect(slot.happiens).to eq 5
    end

    it 'load_from_slot' do
      (user = build(:user)).init_stats
      user.money = 50_000

      (slot = described_class.new).base_init
      slot.set_from_user(user, 'saved_game')
      expect(slot.money).to eq 50_000
    end
  end
end
