class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session, only: [:edit, :update]
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
    @team[:members]=[]
    @team[:requests]=[]

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
    Match.all.each do |element|
      if @team.id==element[:team1]
        element.destroy
      else
        if @team.id==element[:team2]
          element.team2=nil
        end
      end
    end
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_member
    username=params['username']
    idteam=params['idteam']
    @t=Team.find(idteam)
    @arr=@t[:members]
    @arr.delete(username)
    @t[:members]= @arr
    @t.save
    redirect_to edit_team_path(@t)
  end

  def form2
    idteam=params['idteam']
    @t=Team.find(idteam)
    redirect_to edit_team_path(@t)
  end

  def accept_member
    idteam=params['idteam']
    username=params['username']
    @t=Team.find(idteam)
    @mem=@t[:members]
    @req=@t[:requests]
    @req.delete(username)
    @mem.push(username)
    @t[:members] = @mem
    @t[:requests] = @req
    @t.save
    redirect_to edit_team_path(@t)
    flash[:notice] = "Hai accettato '"+username.to_s+"'"

  end

  def refuse_member
    idteam=params['idteam']
    username=params['username']
    @t=Team.find(idteam)
    @req=@t[:requests]
    @req.delete(username)
    @t[:requests]= @req
    @t.save
    redirect_to edit_team_path(@t)
    flash[:notice] = "Hai rifiutato '"+username.to_s+"'"

  end

  def elimina_team
    idteam=params['idteam']
    @t=Team.find(idteam)
    Match.all.each do |element|
      if @t.id==element[:team1]
        element.destroy
      else
        if @t.id==element[:team2]
          flash[:error]= "Questa squadra non può essere eliminata, perchè impegnata in una gara imminente."
          redirect_to User.find(session[:user_id])
          return
        end
      end
    end
    @t.destroy

    redirect_to User.find(session[:user_id])
  end

  def send_request
    idteam=params['idteam']
    usname=User.find(session[:user_id]).usname
    @t=Team.find(idteam)
    @req=@t[:requests]
    @req.push(usname)
    @t[:requests]=@req
    @t.save

    redirect_to @t
    flash[:notice] = "Inviata la richiesta di partecipazione al Team '"+@t.name.to_s+"'"
  end

  def leave_team
    idteam=params['idteam']
    usname=User.find(session[:user_id]).usname
    @t=Team.find(idteam)
    @mem=@t[:members]
    @mem.delete(usname)
    @t[:members]=@mem
    @t.save

    redirect_to @t
    flash[:notice] = "Sei uscito dal Team '"+@t.name.to_s+"'"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :logo, :members, :captain)
    end
end
