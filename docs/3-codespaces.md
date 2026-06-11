
--8<-- "snippets/dt-enablement.md"

## Create Codespace

Click to open Codespaces for this lab repository:

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/dynatrace-wwse/enablement-dynatrace-log-ingest-101){target="_blank"}

!!! tip "Codespace Configuration"
    - Branch
        - select the **main** branch
    - Dev container configuration
        - select **Enablement on codespaces template**
    - Machine type
        - select **4-core**
    - Region
        - select any region, preferably one closest to your Dynatrace tenant

### Wait for Codespace
We know your time is very valuable. This codespace takes around 7-10 minutes to be fully operational. A local Kubernetes ([k3d](https://k3d.io/){target="_blank"}) cluster will be configured and in it a sample application, AstroShop, will be deployed. To make your experience better, we are also installing and configuring tools like:

**k9s kubectl helm node jq python3 gh**

## Explore Codespace

Your Codespace has now deployed the following resources:

- A local Kubernetes ([k3d](https://k3d.io/){target="_blank"}) cluster, with some pre-deployed apps that will be used later in the demo.

- CronJobs running in Kubernetes that generate some sample log data

After a couple of minutes, you'll see this screen in your Codespaces terminal. It contains the links to the UI of the application which we will be using for our hands-on training.

Sample output:
![Codespaces finish](img/codespaces_finish.png)

## Validate your environment

Before deploying Dynatrace, confirm the cluster and the sample workloads are up. Open the **Terminal** tab and run the checks below — all three must pass before you continue.

```sh
kubectl get nodes
kubectl get pods -n astroshop
kubectl get pods -n cronjobs
```

<!-- LAB_QUESTION
type: shell-verification
question: "Verify the k3d cluster node is Ready"
buttonText: "Check Cluster"
command: "kubectl get nodes --no-headers 2>/dev/null | grep -c ' Ready'"
expect:
  operator: gt
  value: 0
hint: "The Codespace takes 7-10 minutes to be fully operational. Wait, then run `kubectl get nodes` in the Terminal tab and try again."
explanation: "The cluster node is Ready — your local Kubernetes is up."
-->

<!-- LAB_QUESTION
type: shell-verification
question: "Verify the AstroShop application pods are Running"
buttonText: "Check AstroShop"
command: "kubectl get pods -n astroshop --no-headers 2>/dev/null | grep -c Running"
expect:
  operator: gt
  value: 0
hint: "AstroShop is deployed automatically. If no pods are Running, recycle them with `kubectl delete pods --all -n astroshop` and wait a minute."
explanation: "AstroShop pods are Running — the demo application is ready to be monitored."
-->

<!-- LAB_QUESTION
type: shell-verification
question: "Verify the CronJobs namespace exists (it generates the sample log data)"
buttonText: "Check CronJobs"
command: "kubectl get namespace cronjobs --no-headers 2>/dev/null | grep -c cronjobs"
expect:
  operator: gt
  value: 0
hint: "If the namespace is missing, run `deployCronJobs` in the Terminal tab to (re)deploy the CronJob manifests."
explanation: "The cronjobs namespace exists — the sample CronJobs that produce log data are deployed."
-->

## Tips & Tricks

We want to boost your learning and try to make your experience as smooth as possible with Dynatrace trainings. Your Codespaces have a couple of convenience features added. 

### Show the greeting
In the terminal, there are functions loaded for your convenience. By creating a new terminal the greeting will be shown that includes the links to the exposed apps, the Github  pages, the Github Repository, the Dynatrace Tenant that is bound to this devcontainer (if applicable) and some of the tools installed.

You can create a new terminal directly in VSCode, type `zsh` or call the function `printGreeting` and that will print the greeting with the most relevant information.

### Navigating in your local Kubernetes
The client `kubectl` and `k9s` are configured so you can navigate in your local Kubernetes. 
![k9s](img/k9s.png)

### Exposing the apps to the public
The AstroShop app is being exposed in the devcontainer to your localhost. If you want to make the endpoints publicly accesible, just go to the ports section, right click on them and change the visibility to public.

## Troubleshooting

### AstroShop

If you encounter problems with the AstroShop app deployed in the `astroshop` namespace, you can easily recycle the pods.

Recycle pods:
```sh
kubectl delete pods --all -n astroshop
```

But before doing so, if you want to see what is happening we recommend the following: 

Verify all astroshop pods
```sh
kubectl get pods -n astroshop
```

Check for events in the astroshop namespace
```sh
kubectl get events -n astroshop
```

Check for system and cluster events 
```sh
kubectl get events -n kube-system
kubectl get events -n default
```

### App exposure
The Astroshop application is accessible via the nginx ingress controller. The URL is shown in the greeting — run `printGreeting` to display it.

Verify service:
```sh
kubectl get svc astroshop-frontendproxy -n astroshop
```

### CronJobs

If you encounter problems with the CronJobs deployed in the `cronjobs` namespace, reapply the manifests.

Deploy cronjobs:
```sh
deployCronJobs
```

## Continue

In the next section, we'll deploy Dynatrace on our Kubernetes cluster to start collecting logs (and more!).

<div class="grid cards" markdown>
- [Continue to Deploy Dynatrace:octicons-arrow-right-24:](4-deploy-dynatrace.md)
</div>
