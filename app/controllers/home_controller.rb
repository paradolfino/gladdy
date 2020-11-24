class HomeController < ApplicationController
  def index
    game = Game::GameController.new()
  end
end
