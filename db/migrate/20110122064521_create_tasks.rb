class CreateTasks < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `tasks` (
                `id` SMALLINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,           
                `created_by` INT(11) UNSIGNED NOT NULL,           
                `assigned_to` INT(11) UNSIGNED NOT NULL,           
                `status` enum ('To Do','In Process','Completed') DEFAULT 'To Do' COMMENT 'Status of meeting',
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
