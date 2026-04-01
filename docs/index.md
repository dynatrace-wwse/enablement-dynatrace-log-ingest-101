--8<-- "snippets/send-bizevent/index.js"

--8<-- "snippets/disclaimer.md"

## Lab Overview

During this hands-on training lab, we’ll learn how to capture logs from Kubernetes using the Dynatrace Operator to deploy the Dynatrace Log Module.  We'll then configure log monitoring in Dynatrace to maximize the value that we get from logs.  Finally, we'll analyze the logs in context using the various apps native to the Dynatrace platform.

**Lab tasks:**

1. Launch GitHub codespaces container with lab setup

     - Kubernetes cluster running AstroShop demo application

2. Deploy Kubernetes Platform Monitoring + Application Observability

3. Configure and validate Kubernetes log ingest into Dynatrace

4. Ingest CronJob logs

5. Configure advanced log monitoring in Dynatrace

    - Log module feature flags
    - Sensitive data masking
    - Timestamp patterns and splitting
    - Dynatrace component logs for self-monitoring

6. Configure Dynatrace OpenPipeline for log transformation on ingest

7. Analyze logs in context using apps native to the Dynatrace platform

    - Problems
    - Kubernetes
    - Distributed Tracing
    - Services

8. Clean up GitHub codespaces instance

--8<-- "snippets/opentelemetry-logs.md"

## Technical Specification

### Technologies Used
- [Dynatrace](https://www.dynatrace.com/trial)
- [Kubernetes Kind](https://kind.sigs.k8s.io/)
    - tested on Kind tag 1.30.0
- [Dynatrace Operator](https://github.com/Dynatrace/dynatrace-operator)
    - tested on v1.8.1 (Mar 2026)
- Dynatrace OneAgent
    - tested on v1.309 (Mar 2026)

### Reference Architecture

[Dynatrace on Kubernetes: Application observability](https://docs.dynatrace.com/docs/ingest-from/setup-on-k8s/how-it-works/application-monitoring)

[Dynatrace on Kubernetes: Platform monitoring](https://docs.dynatrace.com/docs/ingest-from/setup-on-k8s/how-it-works/kubernetes-monitoring)

[OpenTelemetry Astronomy Shop Demo Architecture](https://opentelemetry.io/docs/demo/architecture/)

## Continue

In the next section, we'll review the prerequisites for this lab needed before launching our Codespaces instance.

<div class="grid cards" markdown>
- [Continue to getting started:octicons-arrow-right-24:](2-getting-started.md)
</div>
