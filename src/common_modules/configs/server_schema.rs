// ** info: third party libs imports
use serde::Deserialize;
use serde::Serialize;

#[derive(Serialize, Deserialize, Debug)]
pub struct Schema {
    pub server_mode: String,
    pub server_port: i16,
}
