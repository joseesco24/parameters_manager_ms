// ** info: third party libs imports
use log::info;
use log::warn;
use serde_json;
use std::fs;

// ** info: project modules imports
use crate::common_modules::configs::server_schema;

pub fn read_server_config() -> server_schema::Schema {
    const PATH: &str = "configs/server.json";

    info!("file path: {}", PATH);

    let data: String = match fs::read_to_string(PATH) {
        Err(error) => {
            warn!("error opening the file stored in {}", PATH);
            panic!("problem opening the file: {:?}", error)
        }
        Ok(file) => {
            info!("file found");
            file
        }
    };

    let config: server_schema::Schema = match serde_json::from_str(&data) {
        Err(error) => {
            warn!("json file stored at was not well-formatted {}", PATH);
            panic!("problem opening the file: {:?}", error)
        }
        Ok(file) => {
            info!("json file stored at {} succesfully parsed", PATH);
            file
        }
    };

    return config;
}
