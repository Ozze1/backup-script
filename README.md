# backup-script
Writing a backup script in bash.

Given a source directory and a target, that takes a backup of source to target.

The script should handle targets both local or remote (ssh).

The script should implement incremental backups.

Each new backup should live in a timestamped directory (i.e: the name of the directory is a timestamp).

