#!/bin/bash
#loading functions to script
export SECONDS=0
source .devcontainer/util/source_framework.sh

setUpTerminal

startKindCluster

installK9s

deployAstroshop

deployCronJobs

finalizePostCreation

printInfoSection "Your dev container finished creating"
