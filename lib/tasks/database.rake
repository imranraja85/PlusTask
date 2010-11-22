namespace :db do
  desc "reload db and start from scratch"
  task :reload => ["db:drop", "db:create", "db:migrate"]
end
