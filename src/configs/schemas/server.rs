use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Debug)]

pub struct ServerConfig {
    pub server_mode: String,
    pub server_port: i16,
}
