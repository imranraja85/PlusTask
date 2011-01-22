class CreateProjects < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `projects` (
                `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,           
                `name` varchar(80) NOT NULL default '' COMMENT 'Name of the Project',
                `description` varchar(255) NOT NULL default '' COMMENT 'Description of the project',
                `status` enum ('Requirement Gathering', 'Design', 'Coding', 'Testing', 'Live') DEFAULT 'Requirement Gathering' COMMENT 'Status of project',
                `created_by_id` SMALLINT(5) UNSIGNED COMMENT 'ID of user that created this project',           
                `owner_id` SMALLINT(5) UNSIGNED COMMENT 'ID of the project owner',
                `updated_at` TIMESTAMP NULL COMMENT 'Datetime of latest update',
                `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
                PRIMARY KEY  (`id`)
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8;)
    execute up_sql

  end

  def self.down
    drop_table :projects
  end
end
