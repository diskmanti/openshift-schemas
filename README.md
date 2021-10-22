JSON schemas for use with [Kubeval][].

[kubeval]: https://github.com/instrumenta/kubeval

## Updating the schemas

### Prerequisites

Before updating the schemas, you will need the following:

- Install [openapi2jsonschema][].

  If the `openapi2jsonschema` command crashes with `KeyError:
  'properties'`, you will need to use the patch available in
  [PR #55][].

  If the command crashes with an `IndexError`, you will probably need
  the patch available in [PR #58][].

- Install the `oc` command.

  You can get the version of the `oc` command appropriate to our
  installed OpenShift version from the [Command Line Tools][] page.

[pr #55]: https://github.com/instrumenta/openapi2jsonschema/pull/55
[pr #58]: https://github.com/instrumenta/openapi2jsonschema/pull/58
[openapi2jsonschema]: https://github.com/instrumenta/openapi2jsonschema
[command line tools]: https://console-openshift-console.apps.ocp-prod.massopen.cloud/command-line-tools

### Generating updated schemas

To update these schemas:

```
make refresh all
```

The `Makefile` uses the `oc` command to obtain the server URL and
authentication token, so you must be authenticated prior to running
the above command.
