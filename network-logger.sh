#/bin/bash

# Cronjob every min to log network status.
#1 * * * * /usr/local/bin/network-logger.sh



{
	echo "###################################################################################################"
        echo "------Network status at ------ $(date)-----"
	ping -c2 8.8.8.8
	echo "###################################################################################################"


} 2>&1 | tee -a /usr/local/bin/network.log

