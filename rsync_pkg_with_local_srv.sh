

#/bin/bash

# Cronjob to sync local package.
#30 3 * * * /usr/local/bin/rsync_local_pkg.sh


{
        echo "###################################################################################################"
        if ping -c 1 #.#.#.#
        then
                echo "----- server connected  at ------ $(date)-----"
                echo "----- rsyncing packages -----"
                rsync -avzhe ssh --progress root@#.#.#.#:/var/cache/pacman/pkg/ /var/cache/pacman/pkg/
        else
                echo "-----  server is not available at ------ $(date)--- -----"
        fi
        echo "###################################################################################################"


} 2>&1 | tee -a /usr/local/bin/rsync.log
