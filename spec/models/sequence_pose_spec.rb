require 'rails_helper'

describe SequencePose do
  it {should belong_to(:sequence)}
  it {should belong_to(:pose)}
end
