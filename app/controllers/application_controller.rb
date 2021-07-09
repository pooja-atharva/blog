class ApplicationController < ActionController::Base
    # include ActiveStorage::SetCurrent
    after_action :track_action
    
    protected

    def track_action
        # ahoy.trackAll();
        ahoy.track "Visited controller: #{params[:action]} and action: #{params[:action]} ", request.path_parameters
    end
end
