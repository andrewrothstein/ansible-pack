<andrewrothstein.pack
=========
![Build Status](https://github.com/andrewrothstein/ansible-pack/actions/workflows/build.yml/badge.svg)

Installs the [pack](https://github.com/buildpack/pack) CLI from the buildpacks.io project

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.pack
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
