// ** info: ustom modules declarations
mod common_modules;

// ** info: project modules imports
use crate::common_modules::configs::server_reader;
use crate::common_modules::logger::logger;

// **info: making log available at context level
#[allow(unused_imports)]
#[macro_use]
extern crate log;

// ** info: third party libs imports
use dotenvy::dotenv;
use log::info;

fn main() {
    // ** info: reading .env file
    dotenv().ok();

    // ** info: setting up the logger
    logger::setup();

    info!("starting app");

    // ** info: reading config files
    server_reader::read_server_config();
}
