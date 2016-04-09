class Home::EntriesController < ApplicationController

  before_action :set_member_search, only: [:new,:edit]

  layout 'public_page'

  def index

  end

  def new
    @entry = Group.new
  end

  def create
    @entry = Group.new(entries_params)
    respond_to do |format|
      if @entry.save
        format.html { redirect_to home_entries_path, notice: 'エントリーが完了しました.' }
        format.json { render :index, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def set_member_search
      @member_search = MemberSearch.new(params[:member_search])
    end

    def entries_params
      params.require(:group).permit(:event_id, :name,:member_id, :number_person,:order,
                                    players_attributes: [:id,:group_id,:member_id,:_destroy],
                                    songs_attributes: [:id,:name,:group_id,:time,:_destroy])
    end


end