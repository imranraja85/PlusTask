class CreateMilestones < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `milestones` (
                `id` SMALLINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,           
                `company_id` INT(11) UNSIGNED NOT NULL COMMENT 'Foreign key to company table',           
                `created_by` INT(11) UNSIGNED COMMENT 'Person who created the milestone',           
                `name` VARCHAR(255) NULL COMMENT 'Name of the milestone',
                `assigned_to` INT(11) UNSIGNED COMMENT 'Person who is responsible for the milestone',           
                `project_id` INT(11) UNSIGNED COMMENT 'Project the milestone is associated with',           
                `due_date` TIMESTAMP NULL COMMENT 'Date that the milestone should be completed',
                `updated_at` TIMESTAMP NULL COMMENT 'Datetime of latest update',
                `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
                PRIMARY KEY  (`id`)
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8;)

    execute up_sql  
  end

  def self.down
    drop_table :milestones
  end
end
