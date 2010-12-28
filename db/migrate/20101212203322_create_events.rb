class CreateEvents < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `events` (
                `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,           
                `name` VARCHAR(255) COMMENT 'Name of the event',
                `start_date` INT(5) UNSIGNED COMMENT 'Day the event starts',           
                `start_time` INT(5) UNSIGNED COMMENT 'Time the event starts',           
                `end_time` INT(5) UNSIGNED COMMENT 'Time the event ends',           
                `status` enum ('In Process','Scheduled', 'Canceled') DEFAULT 'In Process' COMMENT 'Status of meeting',
                `updated_at` TIMESTAMP NULL COMMENT 'Datetime of latest update',
                `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
                PRIMARY KEY  (`id`)
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8;)
    execute up_sql
  end

  def self.down
    drop_table :events
  end
end
