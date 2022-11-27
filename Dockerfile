# ---------------------------------------------------------------------------------------------------------------------
# ** info: stage 1: building image
# ---------------------------------------------------------------------------------------------------------------------

# ** info: declaration of the rust building image version
FROM rust:1.65.0 AS build

# ** info: declaration of the project file system inside the building image
ARG WORKDIR=/home/rust_prod

# ** info: creating the directories for the file system.
RUN mkdir -p $WORKDIR

# ** info: establishing the default work directory.
WORKDIR $WORKDIR

# ** info: copying the source code and the dependencies files to the building image and building the app.
COPY ["Cargo.lock", "$WORKDIR"]
COPY ["Cargo.toml", "$WORKDIR"]

COPY ["src", "$WORKDIR/src"]

RUN cargo build --release

# ---------------------------------------------------------------------------------------------------------------------
# ** stage 2: production image.
# ---------------------------------------------------------------------------------------------------------------------

# ** info: declaration of the production alpine version.
FROM debian:buster-slim

# ** info: declaration of the project file system and username inside the deployment image.
ARG USERNAME=production
ARG WORKDIR=/home/$USERNAME

# ** info: creating the user on bash and their home directory.
RUN useradd --create-home --shell /bin/bash $USERNAME

# ** info: changing the premises of the file system.
RUN chown -R $USERNAME $WORKDIR

RUN find "$WORKDIR/" -type d -exec chmod 755 {} \;
RUN find "$WORKDIR/" -type f -exec chmod 755 {} \;

RUN chmod 755 $WORKDIR

# ** info: establishing the default user and the default working directory.
WORKDIR $WORKDIR
USER $USERNAME

# ** info: copying external needed files to the deployment image.
COPY ["configs", "$WORKDIR/configs"]

# ** info: copying the builded app and the schems from the building image to the deployment image.
COPY --from=build ["/home/rust_prod/target/release/users_crud_api_rust", "$WORKDIR"]

# ** info: executing the app.
ENTRYPOINT ["./users_crud_api_rust"]
