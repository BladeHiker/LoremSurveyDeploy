# LoremSurveyDeploy

```
docker build -t lorem .
docker run --env MARIADB_PASSWORD="3325111" -e MARIADB_ALLOW_EMPTY_ROOT_PASSWORD="3325111" -e MARIADB_RANDOM_ROOT_PASSWORD="3325111" -d -p 5050:80 lorem
```
