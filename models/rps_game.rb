class RPSGame
  attr_accessor :move, :computer_play

  def initialize(move)
    @move = move
    @computer_play = [:rock, :paper, :scissors].sample
    raise PlayTypeError if !RPSGame.valid_play?(move) #could be self.class too
  end

  def self.valid_play?(move)
    [:rock, :paper, :scissors].include?(move)
  end

  def won?
    (self.move == beats_rock && self.computer_play == :rock) || (self.move == beats_scissors && self.computer_play == :scissors) || (self.move == beats_paper && self.computer_play == :paper)
  end

  def lost?
    !self.won? && !self.tied?
  end

  def tied?
    self.move == self.computer_play
  end

  def beats_rock
    :paper
  end

  def beats_paper
    :scissors
  end

  def beats_scissors
    :rock
  end

  class PlayTypeError < StandardError
    attr_reader :move
  end
end
