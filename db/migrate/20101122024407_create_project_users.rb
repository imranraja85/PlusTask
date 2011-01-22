class CreateProjectUsers < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `project_user` (
                `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,           
                `project_id` SMALLINT(11) UNSIGNED COMMENT 'ID of the project owner',
                `user_id` INT(11) UNSIGNED COMMENT 'ID of the project owner',
                `updated_at` TIMESTAMP NULL COMMENT 'Datetime of latest update',
                `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
                PRIMARY KEY  (`id`)
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8;)
    execute up_sql
  end

  def self.down
    drop_table :project_users
  end
end
