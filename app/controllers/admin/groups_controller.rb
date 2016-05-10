
class Admin::GroupsController < AdminController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_member_search, only: [:new, :edit]

  def show
    @players=Player.where(group_id: params[:id])
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to admin_group_path(@group), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to admin_group_path(@group), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to admin_event_path(@group.event), notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def set_member_search
      @member_search = MemberSearch.new(params[:member_search])
    end



    def group_params
      params.require(:group).permit(:event_id, :name,:member_id, :number_person,:order,:note,
                                    players_attributes: [:id,:group_id,:member_id,:_destroy],
                                    songs_attributes: [:id,:name,:group_id,:time,:_destroy])
    end
end
