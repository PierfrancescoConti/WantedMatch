class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
    User.find(session[:user_id])[:teams].push(@team[:name])
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_member
    username=params['usname']
    @arr=@team[:members]
    @arr.delete(username)
    @team[:members]= @arr
    @team.save
    redirect_to edit_team_path
  end

  def accept_member
    username=params['usname']
    @mem=@team[:members]
    @req=@team[:requests]
    @req.delete(username)
    @mem.add(username)
    @team[:members]= @mem
    @team[:requests]= @req
    @team.save
    redirect_to edit_team_path
  end

  def refuse_member
    username=params['usname']
    @req=@team[:requests]
    @req.delete(username)
    @team[:requests]= @req
    @team.save
    redirect_to edit_team_path
  end

  def elimina_team
    nome=params['nome']
    Team.find_by(:name => nome).destroy
    redirect_to User.find(session[:user_id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :members, :captain)
    end
end
