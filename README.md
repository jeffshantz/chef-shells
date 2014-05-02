# chef-shells

Chef cookbook to manage the shells installed on a system.

## Supported Platforms

* Ubuntu (tested on 14.04)
* CentOS (tested on 6.5)

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>packages</tt></td>
    <td>Array of Strings</td>
    <td>The packages to install on the system</td>
    <td><tt>[bash, csh, ksh, tcsh, zsh]</tt></td>
  </tr>
  <tr>
    <td><tt>symlinks</tt></td>
    <td>Hash</td>
    <td>
      <p>
        Symlinks to create on the system (see Usage below for an example).
        Parent directories of specified symlinks will be created on the system
        and do not need to be created manually.
      </p>
      <p>
        This is primarily used to fit a legacy infrastructure in which users'
        shells in NIS/NIS+/LDAP might be located in a non-standard location.
      </p>
    </td>
</table>

## Usage

### shells::default

Include `shells` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[shells::default]"
  ]
}
```

Configure the attributes as desired:

```json
{
  "default_attributes": {
    "shells": {
      "packages": ["bash", "csh", "ksh", "tcsh", "zsh"],
      "symlinks": {
        "/local/bash":         "/bin/bash",
        "/local/sh":           "/bin/sh",
        "/local/tcsh":         "/bin/tcsh",
        "/usr/local/bin/bash": "/bin/bash",
        "/usr/local/bin/tcsh": "/bin/tcsh",
        "/usr/shells/bash":    "/bin/bash",
        "/usr/shells/csh":     "/bin/csh",
        "/usr/shells/sh":      "/bin/sh",
        "/usr/shells/tcsh":    "/bin/tcsh"
      }
    }
  }
}
```

## Testing

Be sure that you've run `bundle` before attempting to run any of the
following commands.

Unit tests can be run with RSpec:

```bash
$ cd shells
$ rspec
```

While developing, however, you'll want to run Guard to have it
automatically run the unit tests each time a file is changed:

```bash
$ cd shells
$ guard
```

To run integration tests:

```bash
$ cd shells
$ kitchen test
```

You'll need to have VirtualBox and Vagrant installed.

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Jeff Shantz (<jeff@csd.uwo.ca>)

```text
Copyright:: 2014, Western University

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
