# CHANGELOG for cacert

This file is used to list changes made in each version of cacert.

## 0.4.0:

* Rename the `hash` attribute to `cert_hash` (used by the `cacert` (default)
  and `cacert_hash` provider).

  This change is a workaround, as Chef-12.16.42 apparently fails with a hard to
  track down error message if an attribute is named `hash`. See this [Github
  issue](https://github.com/chef/chef/issues/5565) for details.

## 0.3.1:

* Add support for checksums

## 0.3.0:

* Check whether hashes match when it's provided
* Do not use https when fetching cacert.org certificates
* cacert.org recipe now also installs cacert.org class 3 PKI

## 0.2.0:

* Add default recipe, that installs certificates according to attributes

## 0.1.0:

* Initial release of cacert
