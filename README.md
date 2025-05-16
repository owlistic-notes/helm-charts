# Owlistic Charts

<div align="center">

  <img src="https://raw.githubusercontent.com/owlistic-notes/owlistic/main/src/frontend/assets/logo/owlistic-w-text.png" width="400px" />
  
  # 🦉 Open-source real-time notetaking & todo app 🔄⚡️🚀

  [![Release](https://img.shields.io/github/release/owlistic-notes/helm-charts?style=flat-square)](https://github.com/owlistic-notes/helm-charts/releases/latest)
  [![Docs](https://img.shields.io/badge/docs-online-blue.svg?style=flat-square)](https://owlistic-notes.github.io/owlistic/docs/category/overview)
  [![License](https://img.shields.io/badge/license-GPLv3-blue.svg?style=flat-square)](LICENSE)
  [![standard-readme](https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

  [![Activity](https://img.shields.io/github/commit-activity/m/badges/shields)](https://github.com/owlistic-notes/helm-charts/pulse)

</div>

This repo contains helm charts the owlistic community developed to help deploy [Owlistic](https://github.com/owlistic-notes/owlistic) on Kubernetes cluster. It leverages the bjw-s [Common Library](https://bjw-s-labs.github.io/helm-charts/docs/common-library/) chart.

## Table of Contents

- [Configuration](#configuration)
- [Install](#install)
- [Uninstall](#install)
- [Maintainers](#maintainers)
- [Contributing](#contributing)
- [License](#license)

## Configuration

The chart is highly customizable. You can see a detailed documentation of all possible changes within the `charts/owlistic/values.yaml` file.

A complete list of possible values can be found in Common Library [values.yaml](https://github.com/bjw-s-labs/helm-charts/blob/main/charts/library/common/values.yaml)

## Install

```
$ helm install --create-namespace --namespace owlistic owlistic oci://ghcr.io/owlistic-notes/helm-charts/owlistic -f values.yaml
```

You should not copy the full values.yaml from this repository. Only set the values that you want to override.

There are a few things that you are required to configure in your values.yaml before installing the chart:
- You need to separately create a PVC for your data volume and configure `owlistic.persistence.data.existingClaim` to reference that PVC
- You need to make sure that Owlistic has access to a kafka and postgresql instance. Both can be enabled directly in the `values.yaml`, or by manually setting the `env` to point to an existing instance.

## Uninstall

To see the currently installed Owlistic chart:

```bash
helm ls --namespace owlistic
```

To uninstall/delete the `owlistic` chart:

```bash
helm delete --namespace owlistic owlistic
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Maintainers

- [@Davide Rutigliano](https://github.com/DavideRutigliano)

## Contributing

Owlistic is developed by the community, for the community. We welcome contributions of all kinds - from code improvements to documentation updates. Check out our [Contributing Guide](https://owlistic-notes.github.io/owlistic/docs/category/contributing) to learn how you can help.

Small note: If editing the README, please conform to the
[standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

GPLv3.0 © 2025 owlistic-notes
