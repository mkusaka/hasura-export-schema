# hasura-export-schema

# usage
## up docker containers
```bash
docker compose up -d
```

## create database with dispaly name `default` from console
1. open `http://localhost:8080/console/data/manage/connect`
2. set `Database Dispaly Name` to `default`
3. set `Database URL` to `postgres://postgres:postgrespassword@postgres:5432`
4. and `Connect Database`

![image](./images/manageconsole.png)

## resume table via ddl in hasura

```bash
curl -X POST localhost:8080/v2/query -d '{
  "type": "run_sql",
  "args": {
    "source": "default",                                                         
    "sql": "CREATE TABLE \"public\".\"prefectures\" ( \"id\" integer NOT NULL, \"name\" character varying(50) NOT NULL, PRIMARY KEY (\"id\")); CREATE TABLE \"public\".\"postalcodes\" ( \"id\" integer NOT NULL, \"code\" character varying(7) NOT NULL, \"prefecture_id\" integer NOT NULL, PRIMARY KEY (\"id\"), CONSTRAINT \"postalcodes_prefecture_id_foregin_key\" FOREIGN KEY (\"prefecture_id\") REFERENCES \"public\".\"prefectures\" (\"id\") ON UPDATE NO ACTION ON DELETE NO ACTION);" 
  }
}'
```

## go to publich schma page and add untracked tables & relationships
1. open `http://localhost:8080/console/data/default/schema/public`
2. press the button `Track` under `Untracked tables or views`
3. press the button `Track` under `Untracked foreign-key relationships`

![image](./images/untracktables.png)

## export graphql schema

```bash
npm install -g graphqurl
gq http://localhost:8080/v1/graphql --introspect > db.graphql
```
