ALTER TABLE tbl_projects
ADD proj_n_collaborators INT NULL DEFAULT 0 AFTER proj_completion_time; 

ALTER TABLE tbl_projects
ADD COLUMN `active` INT NULL DEFAULT 1;