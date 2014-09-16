class NewsReleasesController < ApplicationController
  before_action :authenticate, except: [:index, :show]
  before_action :set_news_release, only: [:show, :edit, :update, :destroy]

  # GET /news_releases
  # GET /news_releases.json
  def index
    @news_releases = NewsRelease.all
  end

  # GET /news_releases/1
  # GET /news_releases/1.json
  def show
  end

  # GET /news_releases/new
  def new
    @news_release = NewsRelease.new
  end

  # GET /news_releases/1/edit
  def edit
  end

  # POST /news_releases
  # POST /news_releases.json
  def create
    @news_release = NewsRelease.new(news_release_params)

    respond_to do |format|
      if @news_release.save
        format.html { redirect_to news_releases_url, notice: 'Successfully created news release.' }
        format.json { render :show, status: :created, location: @news_release }
      else
        format.html { render :new }
        format.json { render json: @news_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_releases/1
  # PATCH/PUT /news_releases/1.json
  def update
    respond_to do |format|
      if @news_release.update(news_release_params)
        format.html { redirect_to @news_release, notice: 'News release was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_release }
      else
        format.html { render :edit }
        format.json { render json: @news_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_releases/1
  # DELETE /news_releases/1.json
  def destroy
    @news_release.destroy
    respond_to do |format|
      format.html { redirect_to news_releases_url, notice: 'News release was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_release
      @news_release = NewsRelease.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_release_params
      params.require(:news_release).permit(:title, :released_on, :body)
    end
end
