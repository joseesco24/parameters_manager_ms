// Custom modules declarations
mod configs;

// Custom modules imports
use crate::configs::readers;

// Third party libs
#[allow(unused_imports)]
#[macro_use]
extern crate log;

use dotenv::dotenv;

use env_logger::Env;

use log::info;

fn main() {
    dotenv().ok();

    let env: Env = Env::default()
        .filter_or("MY_LOG_LEVEL", "trace")
        .write_style_or("MY_LOG_STYLE", "always");

    env_logger::init_from_env(env);

    info!("starting app");

    readers::server::read_server_config();
}
