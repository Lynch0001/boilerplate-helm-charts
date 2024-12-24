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
ROOT_PATH="/Users/timothylynch/workspace/app/boilerplate-helm-charts"

sed -i  '' 's/Project: .*/Project: '"$TARGET_PROJECT"'/g' $ROOT_PATH/build_vars.yml

#
# Archiver
#

SERVICE="archiver"
BASE_PATH="$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .ArchiverVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/minReplicas: .*/minReplicas: {{ .ArchiverVariables.scalerMin }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/maxReplicas: .*/maxReplicas: {{ .ArchiverVariables.scalerMax }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $BASE_PATH/alpha-template/values.yaml

#
# Console
#
SERVICE="console"
BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .ConsoleVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml

#
# Datastore
#
SERVICE="datastore"
BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .DatastoreVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml

#
# Deliver
#
SERVICE="deliver"
BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .DeliverVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/minReplicas: .*/minReplicas: {{ .DeliverVariables.scalerMin }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/maxReplicas: .*/maxReplicas: {{ .DeliverVariables.scalerMax }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml

#
# Inbound
#
SERVICE="inbound"
BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .InboundVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/minReplicas: .*/minReplicas: {{ .InboundVariables.scalerMin }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/maxReplicas: .*/maxReplicas: {{ .InboundVariables.scalerMax }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml

#
# Client
#
SERVICE="client"
BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .ClientVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/minReplicas: .*/minReplicas: {{ .ClientVariables.scalerMin }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/maxReplicas: .*/maxReplicas: {{ .ClientVariables.scalerMax }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml

#
# Ingester
#
SERVICE="ingester"
BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .IngesterVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml

#
# parser
#
SERVICE="parser"
BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .ParserVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/minReplicas: .*/minReplicas: {{ .ParserVariables.scalerMin }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/maxReplicas: .*/maxReplicas: {{ .ParserVariables.scalerMax }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml

#
# preparser
#
SERVICE="preparser"
BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .PreparserVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/minReplicas: .*/minReplicas: {{ .PreparserVariables.scalerMin }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/maxReplicas: .*/maxReplicas: {{ .PreparserVariables.scalerMax }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml

#
# resubmit
#
SERVICE="resubmit"
BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .ResubmitVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/minReplicas: .*/minReplicas: {{ .ResubmitVariables.scalerMin }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/maxReplicas: .*/maxReplicas: {{ .ResubmitVariables.scalerMax }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml

#
# router
#
SERVICE="router"
BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .RouterVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/minReplicas: .*/minReplicas: {{ .RouterVariables.scalerMin }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/maxReplicas: .*/maxReplicas: {{ .RouterVariables.scalerMax }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml

#
# twinning
#
SERVICE="twinning"
BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .TwinningVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml

#
# OTI
#
SERVICE="oti"
BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .OtiVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml

#
# OTI-API
#
SERVICE="oti-api"
BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .OtiApiVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml

#
# Twingate
#
SERVICE="twingate"
BASE_PATH="$REPO_PATH/$SERVICE/values/demo"
cp $ROOT_PATH/$BASE_PATH/alpha/values.yaml $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/alpha/{{ .Project }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
sed -i  '' 's/replicas: .*/replicas: {{ .TwingateVariables.replicas }}/g' $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml
$BOILERPLATE_PATH/$BOILERPLATE_BINARY --var-file $ROOT_PATH/build_vars.yml --template-url $ROOT_PATH/$BASE_PATH/alpha-template --output-folder $ROOT_PATH/$BASE_PATH/$TARGET_PROJECT --non-interactive
rm $ROOT_PATH/$BASE_PATH/alpha-template/values.yaml

sed -i  '' 's/Project: .*/Project: placeholder/g' $ROOT_PATH/build_vars.yml
