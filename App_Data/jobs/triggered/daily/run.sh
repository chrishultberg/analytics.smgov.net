#!/bin/bash

export HOME="$HOME/site/wwwroot"
export ANALYTICS_KEY=$(echo -e $ANALYTICS_KEY)
export ANALYTICS_CMD="${HOME}/node_modules/analytics-reporter/bin/analytics"

cd $HOME

for envFile in "envs/*.env"
do
  (
    domain=$(basename $envFile)
    domain=${domain%.*}

    mkdir -p "data/$domain"
    echo "Polling domain: $domain"

    source $envFile
    eval $ANALYTICS_CMD --output="data/$domain" --frequency=daily --slim --verbose
    eval $ANALYTICS_CMD --output="data/$domain" --frequency=daily --slim --verbose --csv
  ) &
done