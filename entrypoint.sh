#!/bin/sh -l

# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

gha_version="0.1.0"

image="${1}"
app_name="${2}"
location="${3}"
cluster_name="${4}"
project_id="${5}"
namespace="${6}"
expose_port="${7}"
k8s_manifests="${8}"

gke_deploy_command="gke-deploy run -i ${image} -a ${app_name} -l ${location} -c ${cluster_name} -p ${project_id}"

# Ensure all required variables are provided by workflow users.
if [ -z "${image}" ] || [ -z "${app_name}" ] || [ -z "${location}" ] || [ -z "${cluster_name}" ] || [ -z "${project_id}" ]; then
  echo "Error: Required variables (image, app_name, location, cluster_name, project_id) are not set."
  exit 1
fi

# Add namespace if the input is apparent.
if [ -n "${namespace}" ]; then
  gke_deploy_command="${gke_deploy_command} -n ${namespace}"
fi

# Add expose port if the input is apparent.
if [ -n "${expose_port}" ]; then
  gke_deploy_command="${gke_deploy_command} -x ${expose_port}"
fi

# Add k8s manifests file(s) if the input is apparent.
if [ -n "${k8s_manifests}" ]; then
  gke_deploy_command="${gke_deploy_command} -f ${k8s_manifests}"
fi

# Utilize Google APIs user agent for metrics with the following unique identifier:
export GOOGLE_APIS_USER_AGENT="google-github-action:deploy-gke/${gha_version}"

${gke_deploy_command}
