class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
   $web_intra_path = 'https://fox-desktop-joseduin.c9users.io/'
  #$web_intra_path = 'https://intranet-jhoander-abdelg.c9users.io/'
  #$web_intra_path = 'https://yame-actual-01-12-17-abdelg.c9users.io'
  $web_app_path = 'https://ocelot-webapp-master-abdelg.c9users.io/'
  
#  $web_app_path = 'hhtp://localhost:3000/'
#  $web_intra_path = 'http://localhost:3001/'

  
end
