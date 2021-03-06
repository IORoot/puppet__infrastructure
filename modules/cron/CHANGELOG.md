# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v2.0.0](https://github.com/voxpupuli/puppet-cron/tree/v2.0.0) (2020-01-13)

[Full Changelog](https://github.com/voxpupuli/puppet-cron/compare/v1.3.1...v2.0.0)

**Breaking changes:**

- drop Ubuntu support [\#76](https://github.com/voxpupuli/puppet-cron/pull/76) ([bastelfreak](https://github.com/bastelfreak))
- modulesync 2.7.0 and drop puppet 4 [\#70](https://github.com/voxpupuli/puppet-cron/pull/70) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Changes the defaults of the cronjob-files from 644 to 600 [\#75](https://github.com/voxpupuli/puppet-cron/pull/75) ([ralfbosz](https://github.com/ralfbosz))
- allow dots in cron::user data type [\#71](https://github.com/voxpupuli/puppet-cron/pull/71) ([rwaffen](https://github.com/rwaffen))

**Fixed bugs:**

- If you attempt to use anything below \*/3 the regex fails [\#66](https://github.com/voxpupuli/puppet-cron/pull/66) ([elmobp](https://github.com/elmobp))
- Fix `job::cron` `special` parameter [\#64](https://github.com/voxpupuli/puppet-cron/pull/64) ([alexjfisher](https://github.com/alexjfisher))

## [v1.3.1](https://github.com/voxpupuli/puppet-cron/tree/v1.3.1) (2018-10-14)

[Full Changelog](https://github.com/voxpupuli/puppet-cron/compare/v1.3.0...v1.3.1)

**Closed issues:**

- Special parameter is now set incorrectly with two @ [\#59](https://github.com/voxpupuli/puppet-cron/issues/59)

**Merged pull requests:**

- modulesync 2.1.0 and allow puppet 6.x [\#62](https://github.com/voxpupuli/puppet-cron/pull/62) ([bastelfreak](https://github.com/bastelfreak))

## [v1.3.0](https://github.com/voxpupuli/puppet-cron/tree/v1.3.0) (2018-07-16)

[Full Changelog](https://github.com/voxpupuli/puppet-cron/compare/v1.2.0...v1.3.0)

**Implemented enhancements:**

- Update data types to allow comma-delimited lists [\#50](https://github.com/voxpupuli/puppet-cron/pull/50) ([jcbollinger](https://github.com/jcbollinger))

**Fixed bugs:**

- Comma character in hour/minute parameters [\#49](https://github.com/voxpupuli/puppet-cron/issues/49)

## [v1.2.0](https://github.com/voxpupuli/puppet-cron/tree/v1.2.0) (2018-06-25)

[Full Changelog](https://github.com/voxpupuli/puppet-cron/compare/v1.1.1...v1.2.0)

**Fixed bugs:**

- Code in init.pp doesn't match defined types [\#31](https://github.com/voxpupuli/puppet-cron/issues/31)

**Closed issues:**

- Make first release under voxpupuli's 'puppet' namespace [\#36](https://github.com/voxpupuli/puppet-cron/issues/36)
- Add defined types for parameter validation. [\#30](https://github.com/voxpupuli/puppet-cron/issues/30)

**Merged pull requests:**

- Remove docker nodesets [\#47](https://github.com/voxpupuli/puppet-cron/pull/47) ([bastelfreak](https://github.com/bastelfreak))
- bump puppet version dependency to \>= 4.10.0 \< 6.0.0 [\#46](https://github.com/voxpupuli/puppet-cron/pull/46) ([bastelfreak](https://github.com/bastelfreak))
- Add types for parameter validation. [\#29](https://github.com/voxpupuli/puppet-cron/pull/29) ([pillarsdotnet](https://github.com/pillarsdotnet))

## [v1.1.1](https://github.com/voxpupuli/puppet-cron/tree/v1.1.1) (2018-01-19)

[Full Changelog](https://github.com/voxpupuli/puppet-cron/compare/v1.1.0...v1.1.1)

**Merged pull requests:**

- Release 1.1.1 [\#43](https://github.com/voxpupuli/puppet-cron/pull/43) ([alexjfisher](https://github.com/alexjfisher))
- Fix README.md links [\#42](https://github.com/voxpupuli/puppet-cron/pull/42) ([alexjfisher](https://github.com/alexjfisher))

## [v1.1.0](https://github.com/voxpupuli/puppet-cron/tree/v1.1.0) (2018-01-19)

[Full Changelog](https://github.com/voxpupuli/puppet-cron/compare/v1.0.0...v1.1.0)

**Fixed bugs:**

- Fix hiera lookup regression [\#40](https://github.com/voxpupuli/puppet-cron/pull/40) ([alexjfisher](https://github.com/alexjfisher))

**Merged pull requests:**

- Voxpupuli migration [\#37](https://github.com/voxpupuli/puppet-cron/pull/37) ([alexjfisher](https://github.com/alexjfisher))

## v1.0.0 (2017-10-14)

  * BREAKING: Require Puppet version >=4.9.1
  * Added type-hinting to all manifest parameters
  * Added management of /etc/cron.allow and /etc/cron.deny
  * Replaced hiera\_hash() with lookup() calls
  * Replaced params.pp with in-module data (Hiera 5)
  * Replaced create\_resources with iterators
  * Replaced anchor pattern with contain
  * Made the cron::job command attribute optional

## v0.2.1 (2017-07-30)

  * Added support for special time options
  * Rspec fixes

## v0.2.0 (2016-11-22)

  * BREAKING: Added cron service managment
    The cron service is now managed by this module and by default the service will be started
  * Rspec fixes

## v0.1.8 (2016-06-26)

  * Added support for Scientific Linux

## v0.1.7 (2016-06-12)

  * Properly support Gentoo
  * Documentation fixes
  * Rspec fixes

## v0.1.6 (2016-04-10)

  * Added description parameters

## v0.1.5 (2016-03-06)

  * Fix release on forge

## v0.1.4 (2016-03-06)

  * Added possibility to add jobs from hiera
  * Added Debian as supported operating system
  * Allow declaration of cron class without managing the cron package
  * Properly detect RHEL 5 based cron packages
  * Fix puppet-lint warnings
  * Add more tests

## v0.1.3 (2015-09-20)

  * Support for multiple cron jobs in a single file added (cron::job::multiple)
  * Make manifest code more readable
  * Change header in template to fit standard 80 char wide terminals
  * Extend README.md

## v0.1.2 (2015-08-13)

  * Update to new style of Puppet modules (metadata.json)

## v0.1.1 (2015-07-12)

  * Make module Puppet 4 compatible
  * Fix Travis CI integration

## v0.1.0 (2013-08-27)

  * Add support for the `ensure` parameter

## v0.0.3 (2013-07-04)

  * Make job files owned by root
  * Fix warnings for Puppet 3.2.2

## v0.0.2 (2013-05-11)

  * Make mode of job file configurable

## v0.0.1 (2013-03-02)

  * Initial PuppetForge release


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
