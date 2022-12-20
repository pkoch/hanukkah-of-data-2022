# Hanukkah of Data 2022

https://hanukkah.bluebird.sh/

## Setup

```bash
dropdb noahs && createdb noahs && psql noahs < noahs.sql
```

## Example run

```bash
echo 1.sql | entr -c bash -c "psql noahs < 1.sql"
```
