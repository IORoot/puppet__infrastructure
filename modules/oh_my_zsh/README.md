# oh_my_zsh

Welcome to your new module. A short overview of the generated parts can be found in the PDK documentation at https://puppet.com/pdk/latest/pdk_generating_modules.html .

The README template below provides a starting point with details about what information to include in your README.

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with oh_my_zsh](#setup)
    * [What oh_my_zsh affects](#what-oh_my_zsh-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with oh_my_zsh](#beginning-with-oh_my_zsh)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

Contains plans to:

- Install zsh
- Install oh_my_zsh

## Setup

### Beginning with oh_my_zsh

You need to have bolt installed and configured.

## Usage


To install zsh:

``` bolt_plan
bolt plan run oh_my_zsh::install -t <nodes to install zsh on>
```

To install oh_my_zsh:

``` bolt_plan
bolt plan run oh_my_zsh -t <nodes to configure oh_my_zsh on> -u <user to setup with zsh>
```

## Limitations

None known.

## Development

If anyone wants to add plugin tasks or plans it would be appreciated.