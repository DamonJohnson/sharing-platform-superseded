class ProfilesController < ApplicationController
  before_action :list_states, only: [:new, :edit]
  skip_before_action :verify_authenticity_token
  before_action :create, only: [:show]

  def show
    render json: @profile
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.save
    
  end

  def new
    @profile = Profile.new
  end

  def edit
    
  end

  def update
  end

  def destroy
  end

  private

  def list_states
   @states = ['New South Wales', 'Victoria', 'Queensland', 'Western Australia', 'South Australia', 'Tasmania', 'Australian Capital Territory', 'Northern Territory']
  end
  

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :city, :postode, :state)
  end

  def get_user
    return current_user
  end

end