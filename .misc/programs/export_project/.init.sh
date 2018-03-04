#!/bin/sh

PPPHOME="../../.."

# get projects
PROJECTS=`ls $PPPHOME/programming/programs`

# create dir
cd $HOME
mkdir -p .export_projects

#create age files
cd .export_projects
for project in $PROJECTS; do
  agefile="$project".age;
  echo 0 > $agefile;
done
