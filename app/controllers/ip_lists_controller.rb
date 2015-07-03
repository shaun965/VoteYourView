class IpListsController < ApplicationController
  before_action :set_ip_list, only: [:show, :edit, :update, :destroy]

  # GET /ip_lists
  # GET /ip_lists.json
  def index
    @ip_lists = IpList.all
  end

  # GET /ip_lists/1
  # GET /ip_lists/1.json
  def show
  end

  # GET /ip_lists/new
  def new
    @ip_list = IpList.new
  end

  # GET /ip_lists/1/edit
  def edit
  end

  # POST /ip_lists
  # POST /ip_lists.json
  def create
    @ip_list = IpList.new(ip_list_params)

    respond_to do |format|
      if @ip_list.save
        format.html { redirect_to @ip_list, notice: 'Ip list was successfully created.' }
        format.json { render :show, status: :created, location: @ip_list }
      else
        format.html { render :new }
        format.json { render json: @ip_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ip_lists/1
  # PATCH/PUT /ip_lists/1.json
  def update
    respond_to do |format|
      if @ip_list.update(ip_list_params)
        format.html { redirect_to @ip_list, notice: 'Ip list was successfully updated.' }
        format.json { render :show, status: :ok, location: @ip_list }
      else
        format.html { render :edit }
        format.json { render json: @ip_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ip_lists/1
  # DELETE /ip_lists/1.json
  def destroy
    @ip_list.destroy
    respond_to do |format|
      format.html { redirect_to ip_lists_url, notice: 'Ip list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ip_list
      @ip_list = IpList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ip_list_params
      params[:ip_list]
    end
end
