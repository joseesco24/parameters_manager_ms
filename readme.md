# Users Crud Api Rust

A really simple CRUD REST API based on Docker and Rust.

<br/>

## Project commands

**Note:** Before running any of these commands be sure that your **CWD** is **users_crud_api_rust** directory.

### Format The Code Using Rustfmt

```bash
cargo fmt
```

### Run On development Mode

```bash
APP_MODE=development cargo run
```

### Run On Testing Mode

```bash
APP_MODE=testing cargo run
```

### Run On Production Mode

```bash
APP_MODE=production cargo run
```

<br/>

## Docker Project commands

**Note:** Before running any of these commands be sure that your **CWD** is **users_crud_api_rust** directory.

### Docker App Building Without Cache

```bash
docker build --no-cache --tag ghcr.io/joseesco24/users_crud_api_rust:latest .
```

### Docker App Building With Cache

```bash
docker build --tag ghcr.io/joseesco24/users_crud_api_rust:latest .
```

### Docker App Deployment Without Detach

```bash
docker run --rm --name users_crud_api_rust --publish 3064:3064 --env-file ./.env --env APP_PORT=3064 --env APP_MODE=production users_crud_api_rust:latest
```

### Docker App Deployment With Detach

```bash
docker run --detach --rm --name users_crud_api_rust --publish 3064:3064 --env-file ./.env --env APP_PORT=3064 --env APP_MODE=production users_crud_api_rust:latest
```

### Docker Access To The Container Terminal

```bash
docker exec -it users_crud_api_rust /bin/ash
```

### Docker Killing Containerized App

```bash
docker kill users_crud_api_rust
```

### Docker Login Into GitHub Container Registry

```bash
docker login -u joseesco24 -p < authentication token > ghcr.io
```

### Docker Push The Image To GitHub Container Registry

```bash
docker push ghcr.io/joseesco24/users_crud_api_rust:latest
```

<br/>
