#!/bin/bash
#loading functions to script
export SECONDS=0
source .devcontainer/util/source_framework.sh

setUpTerminal

startK3dCluster

installK9s

deployAstroshop

deployCronJobs

finalizePostCreation

printInfoSection "Your dev container finished creating"
