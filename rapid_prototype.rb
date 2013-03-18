#Remove base rails index page
run 'rm public/index.html'

#install gems (including Twitter-Bootstrap for UI)
gem 'bootstrap-sass', '~> 2.2.2.0'
gem 'rails_bootstrap_easy_navbar'

#Copy controllers, views, helpers, stylesheets and generators
local_path = File.expand_path("../rapid_prototype")
{
 'controllers' => 'app',
 'views' => 'app',
 'helpers' => 'app',
 'stylesheets' => 'app/assets',
 'generators' => 'lib/generators'}.each {|src, dest| FileUtils.cp_r "#{local_path}/#{src}", dest }

# Include Twitter-Bootstrap styles and Javascripts
File.open('app/assets/stylesheets/bootstrap_and_overrides.css.scss', 'w') { |file| file.puts '@import "bootstrap";' }
File.open('app/assets/javascripts/application.js', 'a') { |file| file.puts '//= require bootstrap' }

#Generate base routing
route 'root :to => "static_pages#home"'
