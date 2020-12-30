# puppet-zsh ![License badge][license-img]

1. [Overview](#overview)
2. [Description](#description)
3. [Setup](#setup)
4. [Usage](#usage)
5. [Limitations](#limitations)
6. [Development](#development)
7. [Miscellaneous](#miscellaneous)

## Overview

Zsh is  a shell designed  for interactive use, although  it is also  a powerful
scripting language.   Many of the useful  features of bash, ksh,  and tcsh were
incorporated into zsh; many original features were added.

[zsh.org](http://www.zsh.org/)

## Description

Puppet module to install, deploy and configure zsh.

## Setup

Copy this module in your modules folder without *puppet-* in the name.

or

```bash
puppet module install vpgrp-zsh
```

## Usage

```puppet
class { 'zsh':
  package => true,
}
```

## Limitations

So far, this is compatible with Debian, RedHat, and other derivatives.

## Development

Please read carefully CONTRIBUTING.md before making a merge request.

## Miscellaneous

```
    ╚⊙ ⊙╝
  ╚═(███)═╝
 ╚═(███)═╝
╚═(███)═╝
 ╚═(███)═╝
  ╚═(███)═╝
   ╚═(███)═╝
```

[license-img]: https://img.shields.io/badge/license-Apache-blue.svg
