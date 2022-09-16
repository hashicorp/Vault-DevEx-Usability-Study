use std::env;

use hashicorp_vault;

use serde::{Deserialize, Serialize};

#[derive(Debug, Deserialize, Serialize)]
struct MySecret {
    sample_secret: String,
}

fn main() -> Result<(), hashicorp_vault::Error> {
    let vault_address = env::var("VAULT_ADDR").expect("VAULT_ADDR must be set");
    assert!(!vault_address.is_empty());

    let vault_role_id = env::var("VAULT_ROLE_ID").expect("VAULT_ROLE_ID must be set");
    assert!(!vault_role_id.is_empty());

    let vault_role_secret_id =
        env::var("VAULT_ROLE_SECRET_ID").expect("VAULT_ROLE_SECRET_ID must be set");
    assert!(!vault_role_secret_id.is_empty());

    let vault_client = hashicorp_vault::Client::new_app_role(
        vault_address,
        vault_role_id,
        Some(vault_role_secret_id),
    )?;

    let secret: Result<MySecret, hashicorp_vault::Error> =
        vault_client.get_custom_secret("firstsecret");

    match secret {
        Ok(my_secret) => {
            println!("{}", my_secret.sample_secret);
            Ok(())
        }
        Err(err) => {
            eprintln!("error fetching secret: {}", err);
            Err(err)
        }
    }
}
