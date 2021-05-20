class SlotsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if user_session.nil?
      render plain: 'Error! You not authorized.', status: :unauthorized
      return
    end

    saves_list = Slot.where(user_id: current_user.id).all
    @save_names_list = []

    saves_list&.each do |it|
      @save_names_list.append(it.name)
    end
  end

  def new
    return unless user_session.nil?

    render plain: 'Error! You not authorized.', status: :unauthorized
  end

  def create
    if params[:save_form][:name_save] == ''
      flash.alert = 'Invalid name save!'
      render 'new'
    else
      slot = Slot.find_by(name: params[:save_form][:name_save])

      if slot.nil?
        create_new_slot
      else
        rewrite_slot(slot)
      end
    end
  end

  def create_new_slot
    slot = Slot.new
    slot.set_from_user(current_user, params[:save_form][:name_save])

    slot.save
    redirect_to '/game'
  end

  def rewrite_slot(slot)
    slot.set_from_user(current_user, params[:save_form][:name_save])
    slot.save
    redirect_to '/game'
  end

  def load_game
    user_saves_list = Slot.where(user_id: current_user.id).all
    slot = user_saves_list.find_by(name: params[:load_form][:saves_list])

    current_user.load_from_slot(slot)

    redirect_to '/game'
  end
end
