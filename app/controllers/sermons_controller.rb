class SermonsController < ApplicationController
  # GET /sermons
  # GET /sermons.json
  def index
    @sermons = Sermon.all(:order=> 'publish_date', :include => [:speaker]).reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sermons }
      format.rss { render :layout => false} #index.rss.builder

    end
  end

  # GET /sermons/1
  # GET /sermons/1.json
  def show
    @sermon = Sermon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @sermon }
      format.rss { render rss}
    end
  end

  # GET /sermons/new
  # GET /sermons/new.json
  def new
    @sermon = Sermon.new
    @books = Book.all
    @speakers = Speaker.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @sermon }
    end
  end

  # GET /sermons/1/edit
  def edit
    @sermon = Sermon.find(params[:id])
    @books = Book.all
    @speakers = Speaker.all


  end

  # POST /sermons
  # POST /sermons.json
  def create
    @sermon = Sermon.new(params[:sermon])
    @books = Book.all
    respond_to do |format|
      if @sermon.save
        format.html { redirect_to @sermon, :notice => 'Sermon was successfully created.' }
        format.json { render :json => @sermon, :status => :created, :location => @sermon }
      else
        format.html { render :action => "new" }
        format.json { render :json => @sermon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sermons/1
  # PUT /sermons/1.json
  def update
    @sermon = Sermon.find(params[:id])
    @books = Book.all
    @speakers = Speaker.all
    respond_to do |format|
      if @sermon.update_attributes(params[:sermon])
        format.html { redirect_to @sermon, :notice => 'Sermon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @sermon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sermons/1
  # DELETE /sermons/1.json
  def destroy
    @sermon = Sermon.find(params[:id])
    @sermon.destroy

    respond_to do |format|
      format.html { redirect_to sermons_url }
      format.json { head :no_content }

    end
  end

  def rss
    # This code should be moved to a model

    rss = RSS::Maker.make("2.0") do |maker|
      maker.channel.author = "Calvary Chapel of Mercer County"
      maker.channel.updated = Time.now.to_s
      maker.channel.about = "http://www.ccmc.org/en/feeds/news/rss"
      maker.channel.title = "Calvary Chapel Mercer County Podcast"


    end

    rss
  end
end
