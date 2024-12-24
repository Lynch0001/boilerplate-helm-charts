#!/bin/sh

#
# Shell script to create new DEMO Cluster project helm chart values files
# Copies, templatizes, and creates new project values file using boilerplate binary at BOILERPLATE_PATH
#
# execution command: ./build.sh new_project
#
echo "started helm build"
TARGET_PROJECT=$1
BOILERPLATE_PATH="/Users/timothylynch/workspace/app"
BOILERPLATE_BINARY="boilerplate_darwin_amd64"
REPO_PATH="."

sed -i 's/Project: .*/Project: '"$TARGET_PROJECT"'/g' /Users/timothylynch/workspace/app/boilerplate-helm-charts/build_vars.yml

#
# Archiver
#

SERVICE="archiver"
BASE_PATH="$SERVICE/values/demo"
cp /Users/timothylynch/workspace/app/boilerplate-helm-charts/$BASE_PATH/alpha/values.yaml /Users/timothylynch/workspace/app/boilerplate-helm-charts/$BASE_PATH/alpha-template/values.yaml
sed -i 's/alpha/{{ .Project }}/g' /Users/timothylynch/workspace/app/boilerplate-helm-charts/$BASE_PATH/alpha-template/values.yaml
sed -i 's/replicas: .*/replicas: {{ .ArchiverVariables.replicas }}/g' /Users/timothylynch/workspace/app/boilerplate-helm-charts/$BASE_PATH/alpha-template/values.yaml
sed -i 's/minReplicas: .*/minReplicas: {{ .ArchiverVariables.scalerMin }}/g' /Users/timothylynch/workspace/app/boilerplate-helm-charts/$BASE_PATH/alpha-template/values.yaml
sed -i 's/maxReplicas: .*/maxReplicas: {{ .ArchiverVariables.scalerMax }}/g' /Users/timothylynch/workspace/app/boilerplate-helm-charts/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file /Users/timothylynch/workspace/app/boilerplate-helm-charts/build_vars.yml --template-url /Users/timothylynch/workspace/app/boilerplate-helm-charts/$BASE_PATH/alpha-template --output-folder /Users/timothylynch/workspace/app/boilerplate-helm-charts/$BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml
#
##
## Console
##
#SERVICE="console"
#BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
#cp $BASE_PATH/alpha/values.yaml $BASE_PATH/alpha-template/values.yaml
#sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/replicas: .*/replicas: {{ .ConsoleVariables.replicas }}/g' $BASE_PATH/alpha-template/values.yaml
#$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file boilerplate-helm-charts/build_vars.yml --template-url $BASE_PATH/alpha-template --output-folder $BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml
#
##
## Datastore
##
#SERVICE="datastore"
#BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
#cp $BASE_PATH/alpha/values.yaml $BASE_PATH/alpha-template/values.yaml
#sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/replicas: .*/replicas: {{ .DatastoreVariables.replicas }}/g' $BASE_PATH/alpha-template/values.yaml
#$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file boilerplate-helm-charts/build_vars.yml --template-url $BASE_PATH/alpha-template --output-folder $BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml
#
##
## Deliver
##
#SERVICE="deliver"
#BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
#cp $BASE_PATH/alpha/values.yaml $BASE_PATH/alpha-template/values.yaml
#sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/replicas: .*/replicas: {{ .DeliverVariables.replicas }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/minReplicas: .*/minReplicas: {{ .DeliverVariables.scalerMin }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/maxReplicas: .*/maxReplicas: {{ .DeliverVariables.scalerMax }}/g' $BASE_PATH/alpha-template/values.yaml
#$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file boilerplate-helm-charts/build_vars.yml --template-url $BASE_PATH/alpha-template --output-folder $BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml
#
##
## Inbound
##
#SERVICE="inbound"
#BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
#cp $BASE_PATH/alpha/values.yaml $BASE_PATH/alpha-template/values.yaml
#sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/replicas: .*/replicas: {{ .InboundVariables.replicas }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/minReplicas: .*/minReplicas: {{ .InboundVariables.scalerMin }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/maxReplicas: .*/maxReplicas: {{ .InboundVariables.scalerMax }}/g' $BASE_PATH/alpha-template/values.yaml
#$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file boilerplate-helm-charts/build_vars.yml --template-url $BASE_PATH/alpha-template --output-folder $BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml
#
##
## Client
##
#SERVICE="client"
#BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
#cp $BASE_PATH/alpha/values.yaml $BASE_PATH/alpha-template/values.yaml
#sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/replicas: .*/replicas: {{ .ClientVariables.replicas }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/minReplicas: .*/minReplicas: {{ .ClientVariables.scalerMin }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/maxReplicas: .*/maxReplicas: {{ .ClientVariables.scalerMax }}/g' $BASE_PATH/alpha-template/values.yaml
#$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file boilerplate-helm-charts/build_vars.yml --template-url $BASE_PATH/alpha-template --output-folder $BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml
#
##
## Ingester
##
#SERVICE="ingester"
#BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
#cp $BASE_PATH/alpha/values.yaml $BASE_PATH/alpha-template/values.yaml
#sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/replicas: .*/replicas: {{ .IngesterVariables.replicas }}/g' $BASE_PATH/alpha-template/values.yaml
#$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file boilerplate-helm-charts/build_vars.yml --template-url $BASE_PATH/alpha-template --output-folder $BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml
#
##
## parser
##
#SERVICE="parser"
#BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
#cp $BASE_PATH/alpha/values.yaml $BASE_PATH/alpha-template/values.yaml
#sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/replicas: .*/replicas: {{ .ParserVariables.replicas }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/minReplicas: .*/minReplicas: {{ .ParserVariables.scalerMin }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/maxReplicas: .*/maxReplicas: {{ .ParserVariables.scalerMax }}/g' $BASE_PATH/alpha-template/values.yaml
#$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file boilerplate-helm-charts/build_vars.yml --template-url $BASE_PATH/alpha-template --output-folder $BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml
#
##
## preparser
##
#SERVICE="preparser"
#BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
#cp $BASE_PATH/alpha/values.yaml $BASE_PATH/alpha-template/values.yaml
#sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/replicas: .*/replicas: {{ .PreparserVariables.replicas }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/minReplicas: .*/minReplicas: {{ .PreparserVariables.scalerMin }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/maxReplicas: .*/maxReplicas: {{ .PreparserVariables.scalerMax }}/g' $BASE_PATH/alpha-template/values.yaml
#$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file boilerplate-helm-charts/build_vars.yml --template-url $BASE_PATH/alpha-template --output-folder $BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml
#
##
## resubmit
##
#SERVICE="resubmit"
#BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
#cp $BASE_PATH/alpha/values.yaml $BASE_PATH/alpha-template/values.yaml
#sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/replicas: .*/replicas: {{ .ResubmitVariables.replicas }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/minReplicas: .*/minReplicas: {{ .ResubmitVariables.scalerMin }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/maxReplicas: .*/maxReplicas: {{ .ResubmitVariables.scalerMax }}/g' $BASE_PATH/alpha-template/values.yaml
#$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file boilerplate-helm-charts/build_vars.yml --template-url $BASE_PATH/alpha-template --output-folder $BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml
#
##
## router
##
#SERVICE="router"
#BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
#cp $BASE_PATH/alpha/values.yaml $BASE_PATH/alpha-template/values.yaml
#sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/replicas: .*/replicas: {{ .RouterVariables.replicas }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/minReplicas: .*/minReplicas: {{ .RouterVariables.scalerMin }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/maxReplicas: .*/maxReplicas: {{ .RouterVariables.scalerMax }}/g' $BASE_PATH/alpha-template/values.yaml
#$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file boilerplate-helm-charts/build_vars.yml --template-url $BASE_PATH/alpha-template --output-folder $BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml
#
##
## twinning
##
#SERVICE="twinning"
#BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
#cp $BASE_PATH/alpha/values.yaml $BASE_PATH/alpha-template/values.yaml
#sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/replicas: .*/replicas: {{ .TwinningVariables.replicas }}/g' $BASE_PATH/alpha-template/values.yaml
#$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file boilerplate-helm-charts/build_vars.yml --template-url $BASE_PATH/alpha-template --output-folder $BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml
#
##
## OTI
##
#SERVICE="oti"
#BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
#cp $BASE_PATH/alpha/values.yaml $BASE_PATH/alpha-template/values.yaml
#sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/replicas: .*/replicas: {{ .OtiVariables.replicas }}/g' $BASE_PATH/alpha-template/values.yaml
#$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file boilerplate-helm-charts/build_vars.yml --template-url $BASE_PATH/alpha-template --output-folder $BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml
#
##
## OTI-API
##
#SERVICE="oti-api"
#BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
#cp $BASE_PATH/alpha/values.yaml $BASE_PATH/alpha-template/values.yaml
#sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/replicas: .*/replicas: {{ .OtiApiVariables.replicas }}/g' $BASE_PATH/alpha-template/values.yaml
#$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file boilerplate-helm-charts/build_vars.yml --template-url $BASE_PATH/alpha-template --output-folder $BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml
#
##
## Twingate
##
#SERVICE="twingate"
#BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
#cp $BASE_PATH/alpha/values.yaml $BASE_PATH/alpha-template/values.yaml
#sed -i 's/alpha/{{ .Project }}/g' $BASE_PATH/alpha-template/values.yaml
#sed -i 's/replicas: .*/replicas: {{ .TwingateVariables.replicas }}/g' $BASE_PATH/alpha-template/values.yaml
#$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file boilerplate-helm-charts/build_vars.yml --template-url $BASE_PATH/alpha-template --output-folder $BASE_PATH/$TARGET_PROJECT --non-interactive
#rm $BASE_PATH/alpha-template/values.yaml

sed -i 's/Project: .*/Project: placeholder/g' /Users/timothylynch/workspace/app/boilerplate-helm-charts/build_vars.yml
