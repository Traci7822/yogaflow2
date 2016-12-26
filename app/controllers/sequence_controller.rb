class SequenceController < ApplicationController
  def index
    @sequences = Sequence.all
  end

  def new
    @sequence = Sequence.new
  end

  def create
    @sequence = Sequence.create(title: sequence_params[:title], difficulty: sequence_params[:difficulty], repititions: sequence_params[:repititions])
    if @sequence.valid?
      # build method to add poses here (pre-existing & new)
      @sequence.set_sequence_poses(sequence_params)
    end
  end

  private

  def sequence_params
    params.require(:sequence).permit(:title, :difficulty, :repititions, poses: [:pose_ids, :sanskrit_name, :english_name], pose_ids: [])
  end
end
