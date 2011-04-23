class CreateTasks < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `tasks` (
                `id` SMALLINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,           
                `name` VARCHAR(255) COMMENT 'Title of the task',
                `description` VARCHAR(255) COMMENT 'Description of the task',
                `difficulty` INT(11) UNSIGNED COMMENT 'Difficulty rating',           
                `created_by` INT(11) UNSIGNED COMMENT 'Person who created the task',           
                `assigned_to` INT(11) UNSIGNED COMMENT 'Person who the task is assigned to',           
                `project_id` INT(11) UNSIGNED COMMENT 'Project the task is associated with',           
                `status` enum ('to_do','in_progress','completed') DEFAULT 'to_do' COMMENT 'Status of meeting',
                `updated_at` TIMESTAMP NULL COMMENT 'Datetime of latest update',
                `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
                PRIMARY KEY  (`id`)
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8;)

    execute up_sql  
  end

  def self.down
    drop_table :tasks
  end
end
