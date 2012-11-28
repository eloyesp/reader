namespace :feed do
  desc "Update all channels"
  task :update => :environment do
    puts "Starting update - #{Time.now}"
    Channel.update_all
    puts "Finished update - #{Time.now}"
  end
end

