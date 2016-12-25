class SequenceController < ApplicationController
  def index
    @sequences = Sequence.all
  end

  def new
    @sequence = Sequence.new
  end

  def create
  end
end
