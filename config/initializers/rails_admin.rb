RailsAdmin.config do |config|

  config.main_app_name = ['EspressGo', 'Admin']

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.try(:admin?)
  end

  config.actions do
    dashboard
    index
    new
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
