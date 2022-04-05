class FriendstablesController < ApplicationController
  before_action :set_friendstable, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /friendstables or /friendstables.json
  def index
    @friendstables = Friendstable.all
  end

  # GET /friendstables/1 or /friendstables/1.json
  def show
  end

  # GET /friendstables/new
  def new
    #@friendstable = Friendstable.new
    @friendstable = current_user.friendstables.build
  end

  # GET /friendstables/1/edit
  def edit
  end

  # POST /friendstables or /friendstables.json
  def create
    #@friendstable = Friendstable.new(friendstable_params)
    @friendstable = current_user.friendstables.build(friendstable_params)

    respond_to do |format|
      if @friendstable.save
        format.html { redirect_to @friendstable, notice: "Friend was successfully created." }
        format.json { render :show, status: :created, location: @friendstable }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friendstable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friendstables/1 or /friendstables/1.json
  def update
    respond_to do |format|
      if @friendstable.update(friendstable_params)
        format.html { redirect_to @friendstable, notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friendstable }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friendstable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendstables/1 or /friendstables/1.json
  def destroy
    @friendstable.destroy
    respond_to do |format|
      format.html { redirect_to friendstables_url, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @friendstable = current_user.friendstables.find_by(id: params[:id])
    redirect_to friendstables_path, notice: "Not Authorized to Edit or Delete this Friend!" if @friendstable.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendstable
      @friendstable = Friendstable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friendstable_params
      params.require(:friendstable).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
