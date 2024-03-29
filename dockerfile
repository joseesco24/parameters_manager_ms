# ---------------------------------------------------------------------------------------------------------------------
# ** info: stage 1: building image
# ---------------------------------------------------------------------------------------------------------------------

# ** info: declaration of the building image base version
FROM rust:1.73.0 AS build

# ** info: declaration of the building image working directory
ARG WORKDIR=/home/rust_prod

# ** info: creating the building image working directory
RUN mkdir -p $WORKDIR

# ** info: establishing the default working directory
WORKDIR $WORKDIR

# ** info: copying the requirements files from the building context to the working directory
COPY ["Cargo.lock", "$WORKDIR"]
COPY ["Cargo.toml", "$WORKDIR"]

# ** info: copying the source code of the application from the building context to the working directory
COPY ["src", "$WORKDIR/src"]

# ** info: building the application
RUN cargo build --release

# ---------------------------------------------------------------------------------------------------------------------
# ** stage 2: production image
# ---------------------------------------------------------------------------------------------------------------------

# ** info: declaration of the production image base version
FROM debian:buster-slim

# ** info: declaration of the production working directory and username inside the production image
ARG USERNAME=production
ARG WORKDIR=/home/$USERNAME

# ** info: creating the user on bash and their home directory (working directory)
RUN useradd --create-home --shell /bin/bash $USERNAME

# ** info: changing the premises of the working directory
RUN chown -R $USERNAME $WORKDIR

RUN find "$WORKDIR/" -type d -exec chmod 755 {} \;
RUN find "$WORKDIR/" -type f -exec chmod 755 {} \;

RUN chmod 755 $WORKDIR

# ** info: establishing the default working directory and user inside the production image
WORKDIR $WORKDIR
USER $USERNAME

# ** info: copying external needed files from the building context to the production image
COPY ["configs", "$WORKDIR/configs"]

# ** info: copying the builded app from the building image to the production image
COPY --from=build ["/home/rust_prod/target/release/parameters_manager_ms", "$WORKDIR"]

# ** info: executing the app
ENTRYPOINT ["./parameters_manager_ms"]