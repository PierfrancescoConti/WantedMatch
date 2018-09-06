class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
end

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  def show_match
    idmatch=params['idmatch']

    service = Google::Apis::CalendarV3::CalendarService.new
    service.client_options.application_name = "WantedMatch"
    service.authorization = current_user.oauth_token

    @calendar_list = service.list_calendar_lists

    redirect_to Match.find(idmatch)
  end


  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)
    if @match[:date] < Date.today or (@match[:date] == Date.today and @match[:time].to_formatted_s(:time) <= Time.now.to_formatted_s(:time))
      flash[:error]="Data non valida"
      redirect_to new_match_path

    else

      respond_to do |format|
        if @match.save
          format.html { redirect_to @match, notice: 'Match was successfully created.' }
          format.json { render :show, status: :created, location: @match }
        else
          format.html { render :new }
          format.json { render json: @match.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def choose_team
    id=params['id']
    flash[:success]="Choosen team"
    flash[:success]=Team.find(id).name

  end

  def seleziona_team
  end



  def new_event

    idmatch=params['idmatch']
    idteam=params['idteam']
    @match=Match.find(idmatch)

    service = Google::Apis::CalendarV3::CalendarService.new
    service.client_options.application_name = "WantedMatch"
    service.authorization = current_user.oauth_token

    today = Date.today

    event = Google::Apis::CalendarV3::Event.new({
      start: Google::Apis::CalendarV3::EventDateTime.new(date: today),
      end: Google::Apis::CalendarV3::EventDateTime.new(date: today + 1),
      summary: 'New event!'
    })

    service.insert_event(params[:calendar_id], event)

    redirect_to events_url(calendar_id: params[:calendar_id])

  end

  def select_team
    idmatch=params['idmatch']
    idteam=params['idteam']
    @match=Match.find(idmatch)

    Team.find(@match.team1).members.each do |e1|
      Team.find(idteam).members.each do |e2|
        if e1==e2
          $idm=idmatch
          $idt=idteam
          redirect_to seleziona_team_path
          return
        end
      end
    end
    @match[:team2]=idteam
    @match.save

    #aggiungere google calendar

     redirect_to User.find(session[:user_id])
     flash[:success]="Trovata squadra sfidante!"
  end

  def select_team2
    idmatch=params['idmatch']
    idteam=params['idteam']
    @match=Match.find(idmatch)
    @match[:team2]=idteam
    @match.save
    redirect_to User.find(session[:user_id])
    flash[:success]="Trovata squadra sfidante!"
    #aggiungere google calendar
  end


  def elimina_match
    idmatch=params['idmatch']
    Match.find(idmatch).destroy
    redirect_to User.find(session[:user_id])
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:location, :time, :tipo, :date, :team1, :team2)
    end
end
