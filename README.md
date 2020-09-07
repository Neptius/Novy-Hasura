# Novy-Hasura

```bash
# Pour créer le conteneur (MAC)
docker run -d -p 10000:8080 --name novy-hasura -v $(pwd)/migrations:/hasura-migrations -v $(pwd)/metadata:/hasura-metadata -e HASURA_GRAPHQL_DATABASE_URL=postgres://postgres:pass@host.docker.internal:5432/novy_db -e HASURA_GRAPHQL_ADMIN_SECRET=pass -e HASURA_GRAPHQL_AUTH_HOOK=http://host.docker.internal:10001/auth/webhook hasura/graphql-engine:latest.cli-migrations-v2

# Pour supprimer le conteneur
docker stop novy-hasura && docker rm novy-hasura

# Démarrer hasura avec la synchronisation
hasura console --admin-secret=pass
```