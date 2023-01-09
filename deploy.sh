fission spec init
fission env create --spec --name notification-details-env --image nexus.sigame.com.br/fission-notification-details:0.1.0-2 --poolsize 0 --version 3 --imagepullsecret "nexus-v3" --spec
fission fn create --spec --name notification-details-fn --env notification-details-env --code fission.py --targetcpu 80 --executortype newdeploy --maxscale 3 --requestsperpod 10000 --spec
fission route create --spec --name notification-details-rt --method GET --url /notification/details --function notification-details-fn
