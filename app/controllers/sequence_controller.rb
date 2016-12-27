class SequenceController < ApplicationController
  def index
    @sequences = Sequence.all
  end

  def new
    @sequence = Sequence.new
    @sequence.poses.build
  end

  def create
    binding.pry
    @sequence = Sequence.create(title: sequence_params[:title], difficulty: sequence_params[:difficulty], repititions: sequence_params[:repititions])
    if @sequence.valid?
      # build method to add poses here (pre-existing & new)
      @sequence.set_sequence_poses(sequence_params)
    end
  end

  private

  def sequence_params
    # new poses aren't passing in input
    params.require(:sequence).permit(:title, :difficulty, :repititions, poses_attributes: [:sanskrit_name, :english_name], pose_ids: [])
  end
end
