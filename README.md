<p align="center">metadata-resource - Concourse resource for obtaining pipeline name, team name, etc</p>
<p align="center">
  <a href="https://github.com/orgs/hangar-ci/packages?repo_name=metadata-resource"><img src="https://github.com/hangar-ci/metadata-resource/workflows/release/badge.svg" alt="Release Status"></a>
  <a href="https://github.com/orgs/hangar-ci/packages/container/metadata-resource/versions"><img src="https://img.shields.io/badge/Docker-hangar--ci%2Fmetadata--resource-blue.svg" alt="Docker"></a>
  <a href="https://liam.sh/chat"><img src="https://img.shields.io/badge/Community-Chat%20with%20us-green.svg" alt="Community Chat"></a>
</p>

## Why

TODO

## Usage

```yaml
resource_types:
  - name: metadata
    type: registry-image
    source:
      repository: ghcr.io/hangar-ci/metadata-resource
      tag: latest

resources:
  - name: metadata
    type: metadata

jobs:
  - name: build
    plan:
    - get: metadata
    - task: build
        file: tools/tasks/build/task.yml

[...]
```

### Source Parameters

*None.*

## Behavior

### `check`: Produces new data for each check run

Produce the current timestamp for each check run to ensure the latest information is being utilized.

### `in`: Write the metadata so it can be used in other jobs/tasks/etc.

Take a look [here](https://github.com/hangar-ci/metadata-resource/blob/483d49a05e364513a74c4df71a80b18b507bcfca/resource/in#L9)
for some examples of what metadata we would be writing.

We write each environment variable into `<out-directory>/<env-name>`. Additionally, we write a script
located at `<out-directory>/set-variables`, that you can source, to get the environment variables into
your environment/script. E.g:

```console
$ source metadata/set-variables
```

#### Parameters

*None.*

### `out`: Unused

Unused. Will throw an error.

#### Parameters

*None.*

## Contributing

Please review the [CONTRIBUTING](CONTRIBUTING.md) doc for submitting issues/a guide
on submitting pull requests and helping out.

## License

```
MIT License

Copyright (c) 2021 Hangar CI

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```