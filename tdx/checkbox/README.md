The tests should be run locally on TDX host.

It is assumed that these commands are running on a TDX host
that has been setup properly.

The guest image must be available at the location : `checkbox-provider-tdx/data/tdx-guest.qcow2`
The guest image must enable ssh server with password-based authentication for `root` user.
The root user password must be `123456`

Run tests with pytest

```
$ ./run.sh pytest
```

Run tests with checkbox:

```
$ ./run.sh checkbox
```
