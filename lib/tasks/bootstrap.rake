#place all of the bootstrap tasks in this file
#place all of the supporting files in the lib/bootstrap folder
#place all of the supporting rake tasks in the lib/bootstrap_helper.rake file
#
#if you need to reset the db and seed data, use Rake::Task["db:reload"].invoke
#if you want to load data from a .csv file in the lib/bootstrap/csv, use Seed::table_from_csv('posts')
#
#supporting take tasks such as :setup are in the bootstrap_helpers.rake file

namespace :bootstrap do        
  desc 'Basic bootstrapping'   
  task :fill => :environment do
    Rake::Task["db:reload"].invoke
    Seed::table_from_csv('companies')
    Seed::table_from_csv('projects')
    Seed::table_from_csv('users')
    Seed::table_from_csv('project_user')
    Seed::table_from_csv('tasks')
    Seed::table_from_csv('comments')
    Seed::table_from_csv('milestones')
  end
end
