# Novy-Hasura

```bash
# Pour créer le conteneur (MAC)
docker run -d -p 10000:8080 --name novy-hasura -e HASURA_GRAPHQL_DATABASE_URL=postgres://postgres:pass@host.docker.internal:5432/novy_db_dev -e HASURA_GRAPHQL_ENABLE_CONSOLE=true -v $(pwd)/migrations -v $(pwd)/metadata:/hasura-metadata -e HASURA_GRAPHQL_ADMIN_SECRET=pass -e HASURA_GRAPHQL_AUTH_HOOK=http://host.docker.internal:100001/auth/webhook hasura/graphql-engine:v1.3.1.cli-migrations-v2

# Pour supprimer le conteneur
docker stop novy-hasura && docker rm novy-hasura

# Démarrer hasura avec la synchronisation
hasura console --admin-secret=pass
```