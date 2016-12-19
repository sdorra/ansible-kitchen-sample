# ansible-kitchen-sample

Demonstration of Infrastructure as Code with [Ansible](https://www.ansible.com/), [Docker](https://www.docker.com/), [Test Kitchen](http://kitchen.ci/), [Vagrant](https://www.vagrantup.com/), [VirtualBox](https://www.virtualbox.org/), [ServerSpec](http://serverspec.org/) and [Bats](https://github.com/sstephenson/bats).

## Requirements

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
* [Ruby](https://www.ruby-lang.org)
* [Bundler](http://bundler.io)

## Getting started

Install required ruby gems:

```bash
bundle install
```

Now you are able to create your virtual machine for your tests:

```bash
bundle exec kitchen create
```

### Installation

We are using [Ansible](https://www.ansible.com/) and [Docker](https://www.docker.com/)
for the installation of our services on the server. [Ansible](https://www.ansible.com/) is
used to install [Docker](https://www.docker.com/) prepare volumes and for the 
orchestration of our containers. The [Ansible](https://www.ansible.com/) configuration is
located at playbook.yml and the roles are located at roles. To run the playbook on 
the server just execute:

```bash
bundle exec kitchen converge
```

This command can be used multiple times, after each change of roles or playbook.

### Tests

Tests are located at tests test/integration/*suitename* the executed 
suites can be configured in _.kitchen.yml_, in this example the only 
configure suite is default.

The tests can be written with [ServerSpec](http://serverspec.org/) or 
[Bats](https://github.com/sstephenson/bats). We use both, because some
kinds of tests are hard to write with [ServerSpec](http://serverspec.org/)
(e.g.: rest api tests), but writing all tests with [Bats](https://github.com/sstephenson/bats)
requires much more boilerplate as with [ServerSpec](http://serverspec.org/).

If you want to test your installation, execute the following command:

```bash
bundle exec kitchen verify
```

This command can be used multiple times, after each change of installation or tests.

## Continious Integration

If you want to execute the whole process including installation and testing,
execute the following command:

```bash
bundle exec kitchen test
```
