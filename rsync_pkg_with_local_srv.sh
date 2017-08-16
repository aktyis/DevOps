#/bin/bash

# Cronjob to sync local package with server.
#30 3 * * * /usr/local/bin/rsync_local_pkg.sh


{
        echo "###################################################################################################"
        echo "------Package Synced with local server at ------ $(date)-----"
        rsync -avzhe ssh --progress /var/cache/pacman/pkg/ root@192.168.223.40:/var/cache/pacman/pkg/
        ping -c2 8.8.8.8
        echo "###################################################################################################"


} 2>&1 | tee -a /usr/local/bin/rsync.log

