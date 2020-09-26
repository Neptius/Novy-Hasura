# Novy-Hasura

```sh
# Pour créer le conteneur (MAC)
docker run -d -p 10000:8080 --name novy-hasura -e HASURA_GRAPHQL_DATABASE_URL=postgres://postgres:pass@host.docker.internal:5432/novy -e HASURA_GRAPHQL_ENABLE_CONSOLE=true -v $(pwd)/migrations:/hasura-migrations -v $(pwd)/metadata:/hasura-metadata -e HASURA_GRAPHQL_ADMIN_SECRET=pass -e HASURA_GRAPHQL_AUTH_HOOK=http://host.docker.internal:100001/auth/webhook hasura/graphql-engine:v1.3.2.cli-migrations-v2

# Pour créer le conteneur (Windows)
docker run -d -p 10000:8080 --name novy-hasura -e HASURA_GRAPHQL_DATABASE_URL=postgres://postgres:pass@host.docker.internal:5432/novy -e HASURA_GRAPHQL_ENABLE_CONSOLE=true -v %cd%/migrations:/hasura-migrations -v %cd%/metadata:/hasura-metadata -e HASURA_GRAPHQL_ADMIN_SECRET=pass -e HASURA_GRAPHQL_AUTH_HOOK=http://host.docker.internal:100001/auth/webhook hasura/graphql-engine:v1.3.2.cli-migrations-v2
```

```sh
# Démarrer hasura avec la synchronisation
hasura console --admin-secret=pass

# Pour supprimer le conteneur
docker stop novy-hasura && docker rm novy-hasura
```