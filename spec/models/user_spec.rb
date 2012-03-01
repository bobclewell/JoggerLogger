require 'spec_helper'

describe User do
  it { should have_many :jogs }
  it { should have_many :goals }
end
