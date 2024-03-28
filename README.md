# deploy-gke

This action deploys an existing image to a [GKE cluster](https://cloud.google.com/kubernetes-engine). This container action leverages the [gke-deploy CLI](https://github.com/GoogleCloudPlatform/cloud-builders/tree/master/gke-deploy) tool image which is a wrapper around `kubectl apply` for deploying images to GKE.

**This is not an officially supported Google product, and it is not covered by a Google Cloud support contract. To report bugs or request features in a Google Cloud product, please contact Google Cloud support.**

# Prerequisites

This action requires:

- Google Cloud credentials that are authorized to view a GKE cluster. You also need to create a [GKE cluster](https://cloud.google.com/kubernetes-engine/docs/deploy-app-cluster).
  - Use [google-github-actions/auth](https://github.com/google-github-actions/auth) to authenticate the action. We recommend using [Workload Identity Federation](https://cloud.google.com/iam/docs/workload-identity-federation) by specifying the credentials input.

- This action runs in a Docker container. It does not support the Windows platform. (See [runner #904](https://github.com/actions/runner/issues/904) for more details).

## Usage

```yaml
jobs:
  job_id:
    permissions:
      contents: 'read'
      id-token: 'write'

    steps:
    - id: 'auth'
      uses: 'google-github-actions/auth@v2'
      with:
        workload_identity_provider: 'projects/123456789/locations/global/workloadIdentityPools/my-pool/providers/my-provider'

    - name: 'deploy with gke-deploy cli'
      uses: 'google-github-actions/deploy-gke-container@v0.1'
      with:
        image: 'my-image'
        app_name: 'my-app'
        region: 'us-central1'
        cluster_name: 'my-cluster'
        project_id: 'my-project'
        namespace: 'my-namespace'
        expose: '8000'
    
    - name: 'get-deployments'
      shell: bash
      run: |
        kubectl get pods -n my-namespace
        kubectl get deployment -n my-namespace
```

## Inputs
- `image` - (Required) Image to be deployed.

- `app_name` - (Required) Application name of the Kubernetes deployment.

- `region` - (Required) Location (e.g. region or zone) in which the cluster
    resides. This value is required unless for the region/zone of GKE cluster
    to deploy to.

- `cluster_name` - (Required) Name of GKE cluster to deploy to.

- `project_id` - (Required) Project ID where the cluster is deployed.

- `namespace` - (Optional) Namespace of GKE cluster to deploy to.
    If not provided, it will not be passed to the binary. 

- `expose` - (Optional) The port provided will be used to expose the deployed
   workload object (i.e., port and targetPort will be set to the value provided
   in this flag). If not provided, it will not be passed to the binary.
