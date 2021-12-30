---
marp: true
---

<!-- _class: invert -->

## Azure Kubernetes Service (AKS)

* Azure Kubernetes Service (AKS) offers serverless Kubernetes, an integrated
  continuous integration and continuous delivery (CI/CD) experience, and
  enterprise-grade security and governance.

* AKS allos to deploy and manage containerized applications more easily with a
  fully managed Kubernetes service.

* AKS gives a means unite your development and operations teams on a single
  platform to rapidly build, deliver, and scale applications with confidence.

---

## Azure AKS

* Elastic provisioning of capacity without the need to manage the infrastructure
  and with the ability to add event-driven autoscaling and triggers through KEDA

* Faster end-to-end development experience through Visual Studio Code Kubernetes
  tools, Azure DevOps, and Azure Monitor

* Most comprehensive authentication and authorization capabilities using Azure
  Active Directory, and dynamic rules enforcement across multiple clusters with
  Azure Policy

* Availability in more regions than any other cloud provider

---

<!-- _class: invert -->

## az aks create

```
time az aks create --resource-group AZURE-AKS --name AKS-CLUSTER --node-count 3
```

```
{
<<< ... lines intentionally omitted ... >>>
      "count": 3,
<<< ... lines intentionally omitted ... >>>
      "nodeImageVersion": "AKSUbuntu-1804gen2containerd-2021.11.27",
}

real  3m36.299s
user  0m0.714s
sys 0m0.185s
```

---

## az group list ...

```
az group list --query '[].name' --output table
```

```
Result
-------------------------------------------
NetworkWatcherRG
AZURE-AKS
MC_AZURE-AKS_AKS-CLUSTER_germanywestcentral
```

---

## az resource list ...

```
az resource list --location germanywestcentral --query '[].name' --output table
```

```
Result
------------------------------------
AKS-CLUSTER
aks-nodepool1-22331274-vmss
AKS-CLUSTER-agentpool
kubernetes
aks-agentpool-29300101-nsg
d3a3fc00-546b-4ed2-9e7c-678385fbf50c
aks-agentpool-29300101-routetable
aks-vnet-29300101
NetworkWatcher_germanywestcentral
```

---

<!-- _class: invert -->

## kubectl get pods

```
kubectl get pods --all-namespaces
```

```
NAMESPACE     NAME                                  READY   STATUS    RESTARTS   AGE
kube-system   azure-ip-masq-agent-9bgd9             1/1     Running   0          3m38s
kube-system   azure-ip-masq-agent-9jfkq             1/1     Running   0          3m41s
kube-system   azure-ip-masq-agent-cqxx4             1/1     Running   0          3m24s
kube-system   coredns-58567c6d46-bqhzc              1/1     Running   0          3m33s
kube-system   coredns-58567c6d46-d624t              1/1     Running   0          4m55s
kube-system   coredns-autoscaler-54d55c8b75-pccvc   1/1     Running   0          4m53s
kube-system   kube-proxy-ds2fr                      1/1     Running   0          3m24s
kube-system   kube-proxy-tjqz6                      1/1     Running   0          3m38s
kube-system   kube-proxy-xmtsx                      1/1     Running   0          3m41s
kube-system   metrics-server-569f6547dd-pr6nb       1/1     Running   0          4m55s
kube-system   tunnelfront-6c67f7df64-2wcq6          1/1     Running   0          4m53s
```