class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  def join
    room = Room.find(params[:id])
    if @current_user.room_id.nil?
      @current_user.room_id  = room_id
      if @current_user.save
        render json: {status: 'success', room: room}
      end
    end
    render json: {status: 'fail'}
  end

  def exit
    room = Room.find(@current_user.room_id)
    @current_user.room_id = nil
    if @current_user.save
      msg = 'exit room normally'
      if room.users.size == 0
        msg = 'there is no one in the room destroy the room also'
        room.destroy
      end
      render json: {status: 'success', msg: msg}
    else
      render json: {status: 'fail'}
    end
  end

  def ready
    if @current_user.player.nil?
      render json: {status: 'fail'}
    end
    @current_user.player.status = 'ready'
    if @current_user.save
      render json: {status: 'success'}
    else
      render json: {status: 'fail'}
    end
  end

  def unready
    if @current_user.player.nil?
      render json: {status: 'fail'}
    end
    @current_user.player.status = nil
    if @current_user.save
      render json: {status: 'success'}
    else
      render json: {status: 'fail'}
    end
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    @room.status = "waiting"
    respond_to do |format|
      if(!@current_user.room_id.nil?)
        format.html { render :new }
        format.json { render json: {status: 'fail', message: 'need to exit room before creating a new one'} }
      end
      if @room.save
        @current_user.room_id = @room.id
        @current_user.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render json: {room_name: @room.name, room_user: @room.users, room_status: @room.status } }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: 'fail' }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:status, :name)
    end
end
