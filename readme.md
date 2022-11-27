# Users Crud Api Rust

A really simple CRUD REST API based on Docker and Rust.

## Project commands

**Note:** Before running any of these commands be sure to be inside the **main** directory of the repo.

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

### Docker Containerized App Building

**Note:** Before running any of these commands be sure to be inside the **root** directory of the repo.

#### Without Cache

```bash
docker build --no-cache --tag users_crud_api_rust:latest .
```

#### With Cache

```bash
docker build --tag users_crud_api_rust:latest .
```

### Docker Containerized App Deployment

#### Without Detach

```bash
docker run --rm --name users_crud_api_rust --publish 3064:3064 --env-file ./.env --env APP_PORT=3064 --env APP_MODE=production users_crud_api_rust:latest
```

#### With Detach

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

## Format The Code Using Rustfmt

```bash
cargo fmt
```
