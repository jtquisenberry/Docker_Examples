# GraphDB (Neo4j)

This example uses the upstream Neo4j 5.26.32 image. Neo4j requires authentication
by default; the start command prompts for a password rather than storing one in
this repository. The example publishes ports on localhost only.

Make sure Docker Desktop is running, then run these commands from the repository
root.

## Build the image

```powershell
docker build -t graphdb-local .\graphdb
```

## Start the container

Enter a password when prompted:

```powershell
$neo4jPassword = Read-Host "Enter a Neo4j password"
docker run --detach --name graphdb -p 127.0.0.1:7473:7473 -p 127.0.0.1:7474:7474 -p 127.0.0.1:7687:7687 --volume graphdb-data:/data --env "NEO4J_AUTH=neo4j/$neo4jPassword" graphdb-local
```

The Neo4j Browser is available at [http://localhost:7474](http://localhost:7474).
Log in with username `neo4j` and the password you entered. The Bolt endpoint is
`bolt://localhost:7687`.

## Test an authenticated query

After logging in to Neo4j Browser, run this Cypher query:

```cypher
RETURN 1 AS value;
```

The result should contain `1` in the `value` column.

The named `graphdb-data` volume keeps database files if the container is
removed and recreated.

## Stop and remove the container

```powershell
docker stop graphdb
docker rm graphdb
```

The `graphdb-data` volume is retained. To permanently delete the database data,
remove it explicitly:

```powershell
docker volume rm graphdb-data
```

Keep the password private. For production use, follow Neo4j's guidance for
secrets management rather than passing credentials directly as container
environment variables.
