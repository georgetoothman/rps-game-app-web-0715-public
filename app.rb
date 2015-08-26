require_relative 'config/environment'

class GameApp < Sinatra::Base
  get '/rps/:play' do
    move = params[:play].to_sym
    @game = RPSGame.new(move)
    erb :rps_game
  end
  
  attr_reader :play

  def initialize
    @play = play
  end
  
  def new
    if @play != rock || scissors || paper
      raise RPSGame::PlayTypeError
    end
  end
end
