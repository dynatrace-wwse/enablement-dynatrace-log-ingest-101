#!/bin/bash
# Load framework
source .devcontainer/util/source_framework.sh

printInfoSection "Running integration Tests for $RepositoryName"

assertRunningPod astroshop ad

assertRunningPod astroshop cart

assertRunningPod astroshop frontend

assertRunningPod astroshop frontend-proxy

assertRunningApp 30100
