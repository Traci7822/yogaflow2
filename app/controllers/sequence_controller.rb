class SequenceController < ApplicationController
  before_action :set_sequences
  def index
    @sequences = Sequence.all
  end

  def new
    if current_user
      @sequence = Sequence.new
      @sequence.poses.build
    else
      redirect_to root_path
    end
  end

  def create
    @sequence = Sequence.create(title: sequence_params[:title], difficulty: sequence_params[:difficulty], repititions: sequence_params[:repititions])
    if @sequence.valid?
      @sequence.set_sequence_poses(sequence_params)
      redirect_to root_path
    else
      render :index
    end
  end

  def show
    @sequence = Sequence.find(params[:id])
  end

  private

  def set_sequences
    @sequences = Sequence.all
  end

  def sequence_params
    params.require(:sequence).permit(:title, :difficulty, :repititions, poses_attributes: [:sanskrit_name, :english_name], pose_ids: [])
  end
end
