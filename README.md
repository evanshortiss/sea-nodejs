# Containerized Node.js SEA (Single Executable Application) Example

Demonstrates how a TypeScript application can be packaged into a Node.js
Single Executable Application, and packaged as container image.

### Local Development

## Building

Use `docker` or `podman`:

```bash
podman build . -f Containerfile -t sea-nodejs-example
```

## Running

```bash
podman run --rm -p 8080:8080 sea-nodejs-example
```

You can now access http://localhost:8080 and receive a "Hello, World" response.

### Deploy on Kubernetes

Use the *k8s/deployment.yaml* to deploy a pre-built version of the application on a Kubernetes cluster.

If you'd like to use your own build, you'll need to:

1. Use the `podman build` step above, and use a tag you can push to, e.g `quay.io/your-username/sea-nodejs-example`.
1. Push your tag, i.e `podman push quay.io/your-username/sea-nodejs-example`.
1. Update *k8s/deployment.yaml* to reference your version of the image.
1. Apply the Deployment YAML to your Kubernetes cluster.