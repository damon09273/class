class EventsController < ApplicationController

before_action :set_event, :only => [ :show, :edit, :update, :destroy]

def index
  @events = Event.page(params[:page]).per(5)
  Rails.logger.debug("xxxxx: #{@events.count}")

  respond_to do |format|
    format.html # index.html.erb
    format.xml { render :xml => @events.to_xml }
    format.json { render :json => @events.to_json }
    format.atom { @feed_title = "My event list" } # index.atom.builder
  end
end

def show 
 	@page_title = @event.name
  respond_to do |format|
    format.html { @page_title = @event.name } # show.html.erb
    format.xml # show.xml.builder
    format.json { render :json => { id: @event.id, name: @event.name,created_time: @event.created_at}.to_json }
  end

end


def new
  @event = Event.new
end

def create
	@event = Event.new(event_params)
	if 	@event.save
			flash[:notice] = "新增成功"
			redirect_to :action => :index
	else
    	render :action => :new
  end
end


def edit
end

def update
  if @event.update(event_params)
  		flash[:notice] = "更新成功"
    redirect_to event_path (@event)
  else
    render :action => :edit
  end
end




def destroy
  @event.destroy
  flash[:alert] = "刪除成功"
  redirect_to events_path # events#index
end


private
def event_params
	params.require(:event).permit(:name, :description)
end


def set_event
  @event = Event.find(params[:id])
end

def event_params
  params.require(:event).permit(:name, :description, :category_id)
end


end
