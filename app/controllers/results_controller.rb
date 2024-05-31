# frozen_string_literal: true

class ResultsController < ApplicationController
  before_action lambda  {
    set_header_page('games')
  }

  def index
    @search_parameter = search_params
    unless @search_parameter.valid_parameter?
      @search_parameter.errors.full_messages.each do |message|
        flash.now[:danger] = message
      end
    end

    @games = Game.search(@search_parameter).take(100)
  end

  def show
    set_game
  end

  private

  def search_params
    GameSearchParameter.new(params.fetch(:game_search_parameter, {}))
  end

  def set_game
    @game = Game.find_by(id: params[:id])
  end
end
