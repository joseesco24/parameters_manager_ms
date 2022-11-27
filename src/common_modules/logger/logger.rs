// ** info: third party libs imports
use env_logger::Env;

pub fn setup() {
    let env: Env = Env::default().filter_or("MY_LOG_LEVEL", "trace").write_style_or("MY_LOG_STYLE", "always");
    env_logger::init_from_env(env);
}
