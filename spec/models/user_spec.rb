require 'rails_helper'
require 'support/factory_bot'

RSpec.describe User, type: :model do
  describe '.Base' do
    it 'load_from_slot' do
      (user = build(:user)).init_stats
      (slot = Slot.new).base_init
      user.load_from_slot(slot)
      expect(user.money).to eq 5000
    end

    it 'set_from_user' do
      (user = build(:user)).init_stats
      (slot = Slot.new).base_init
      slot.set_from_user(user, 'saved_game')
      expect(slot.money).to eq 5000
    end

    it 'victory_game' do
      (user = build(:user)).init_stats
      user.money = 50_000
      expect(user.check_win_lose).to eq \
        'You win! Now Valera can buy notebook and work at home, drinking while working.'
    end

    it 'defeat_game' do
      (user = build(:user)).init_stats
      user.happiens = -10
      expect(user.check_win_lose).to eq 'You defeated! Valera got depressed.'
    end

    it 'continue_game' do
      (user = build(:user)).init_stats
      user.happiens = 5
      user.money = 5000
      expect(user.check_win_lose).to eq ''
    end

    it 'fix_stats' do
      (user = build(:user)).init_stats
      user.happiens = 15
      user.apply_stats(-30, 0, 30, 1250)
      expect(user.happiens).to eq 10
    end
  end

  describe '.GameActions' do
    it 'go_job_success' do
      (user = build(:user)).init_stats
      expect(user.go_job).to eq "Unloved job brings Valera a stable income. At least when he's not drunk."
    end

    it 'go_job_failed' do
      (user = build(:user)).init_stats
      user.mana = 80
      expect(user.go_job).to eq 'You cannot go job: you are drunk.'
    end

    it 'rest' do
      (user = build(:user)).init_stats
      expect(user.rest).to eq 'Valera got some rest.'
    end

    it 'watch_serial' do
      (user = build(:user)).init_stats
      expect(user.watch_serial).to eq 'Watching a good serial cheers up Valera.'
    end

    it 'drink_with_marginls_success' do
      (user = build(:user)).init_stats
      expect(user.drink_with_marginals).to eq 'Valera sometimes like drink glass of vodka with his marginal-friends.'
    end

    it 'drink_with_marginls_failed' do
      (user = build(:user)).init_stats
      user.money = 1499
      expect(user.drink_with_marginals).to eq "You don't have enough money have a drink with your marginal-friends."
    end

    it 'sleep' do
      (user = build(:user)).init_stats
      expect(user.sleep).to eq 'Valera slept well and is ready for new achievements.'
    end

    it 'sing_bonus' do
      (user = build(:user)).init_stats
      user.mana = 80
      user.money = 0
      user.sing
      expect(user.money).not_to eq 0
    end

    it 'sing_no_bonus' do
      (user = build(:user)).init_stats
      expect(user.sing).to eq "This time, no one appreciated Valera's singing."
    end
  end
end
