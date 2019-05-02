# psql

```bash
export PSQL_PATH=/usr/bin/psql
export EDITOR=nano
export PSQL_EDITOR="/usr/bin/nano"
alias psql_master='PAGER=less LESS="-iMSx4 -FX" $PSQL_PATH -h localhost -p 5432 -U maindb_owner maindb'
```
