# Plex Database Cleaner
A script that runs on synology and probably other distributions that removes the older base, only if it exists. Without deleting the newest one, regardless of age.

Configure backup database in plex settings --> scheduled task -->

check backup database every three days and configure backup directory.

Remember, to grant plex app permissions for directory.

Edit this line according to your needs: DIR="/volume1/homes/admin/PlexMediaServer/Backup"

In synology settings, go to task scheduler and paste code from script.sh in new task.
