class OrganizersController < ApplicationController
    def new
        @organizer = Organizer.new
    end

    def show
        @arrangement = Arrangement.new
        @arrangement.tournaments_created = Hash.new
        get_played_players(params[:tournament_id])
    end

    def update
        @arrangement = Arrangement.new
        @arrangement.tournaments_created = Hash.new
        get_played_players(params[:tournament_id])
    end

    def get_played_players(tournament_id)
    	arr = []
    	if(!current_account.admin)     
	        tournament_obj = Tournament.find(tournament_id)
	        tournament_name = tournament_obj.name
	        player_info = Player.where(tournament_id: tournament_id)
	        arr << player_info
	        sub_admin_info = SubAdmin.where(tournament_id: tournament_id)
	        arr << sub_admin_info
	        @arrangement.tournaments_created[tournament_name] = arr
	        arr = []
	    else
	    	organizer = Organizer.all
	    	organizer.each do |organizer|
	            tournament_id = organizer.tournament_id
	            tournament_obj = Tournament.find_by id: tournament_id
	            tournament_name = tournament_obj.name
	            player_info = Player.where(tournament_id: tournament_id)
	            arr << player_info
	            sub_admin_info = SubAdmin.where(tournament_id: tournament_id)
	            arr << sub_admin_info
	            @arrangement.tournaments_created[tournament_name] = arr
	            arr = []
        	end
	    end
    end
end

  class Arrangement
      attr_accessor :tournaments_created
  end
