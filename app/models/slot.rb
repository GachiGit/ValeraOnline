# frozen_string_literal: true

class Slot < ApplicationRecord
  def set_from_user(user, slot_name)
    self.user_id = user.id
    self.name = slot_name
    self.mana = user.mana
    self.happiens = user.happiens
    self.money = user.money
    self.fatigue = user.fatigue
  end

  def base_init
    self.user_id = 0
    self.name = ''
    self.mana = 30
    self.happiens = 5
    self.fatigue = 0
    self.money = 5000
  end
end
