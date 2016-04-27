
class Home::MembersController < ApplicationController

  layout 'public_page'

  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @members = Member.order(:kana_name)
  end

  def show
  end
  def new
    @member = Member.new
  end


  def edit
  end

  def create
    @member = Member.new(member_params)
    @member.user_id = current_user.id
    respond_to do |format|
      if @member.save
        format.html { redirect_to home_member_path(@member), notice: 'メンバーの登録に成功しました' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to home_member_path(@member), notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to home_members_path, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :year,:kana_name,:gender)
  end
end