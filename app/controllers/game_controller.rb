class GameController < ApplicationController
  def index
    if user_session.nil?
      render plain: 'Error! You not authorized.', status: :unauthorized
      return
    end

    check_end_game
  end

  def check_end_game
    result = current_user.check_win_lose

    if result == ''
      @is_lose = false
    else
      flash.notice = result
      @is_lose = true
    end
  end

  def new_game
    current_user.init_stats

    redirect_to '/game'
  end

  def go_job
    flash.notice = current_user.go_job
    redirect_to '/game'
  end

  def rest
    flash.notice = current_user.rest
    redirect_to '/game'
  end

  def watch_serial
    flash.notice = current_user.watch_serial
    redirect_to '/game'
  end

  def drink_with_marginals
    flash.notice = current_user.drink_with_marginals
    redirect_to '/game'
  end

  def sleep
    flash.notice = current_user.sleep
    redirect_to '/game'
  end

  def sing
    flash.notice = current_user.sing
    redirect_to '/game'
  end
end
