#!/bin/bash

test -d /data/ || { echo "No data volume found. Skipping."; exit; }

# Grab wp-content if it's found (plugins etc)
if [ -f /data/config_inc.php ]; then
  echo "Linking config_inc.php.."
  ln -sf /data/config_inc.php /app/
fi

# Execute init.sh if it's found
if [ -x /data/init.sh ]; then
  echo "Executing custom init.sh.."
  /data/init.sh
fi

