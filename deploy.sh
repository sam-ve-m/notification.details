#!/bin/bash
fission spec init
fission env create --spec --name notification-details-env --image nexus.sigame.com.br/fission-async:0.1.9 --builder nexus.sigame.com.br/fission-builder-3.8:0.0.1
fission fn create --spec --name notification-details-fn --env notification-details-env --src "./func/*" --entrypoint main.get_notification_details --executortype newdeploy --maxscale 1
fission route create --spec --name notification-details-rt --method GET --url /notification/details --function notification-details-fn