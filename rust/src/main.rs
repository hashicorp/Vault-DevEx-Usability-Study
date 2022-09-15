use std::env;

use hashicorp_vault;

use serde::{Serialize, Deserialize};

#[derive(Debug, Deserialize, Serialize)]
struct MySecret {
    sample_secret: String,
}

fn main() -> Result<(), hashicorp_vault::Error> {
    let vault_address = env::var("VAULT_ADDR").expect("VAULT_ADDR must be set");
    assert!(!vault_address.is_empty());

    let vault_token = env::var("VAULT_TOKEN").expect("VAULT_TOKEN must be set");
    assert!(!vault_address.is_empty());

    let vault_client = hashicorp_vault::Client::new(vault_address, vault_token)?;

    let secret: Result<MySecret, hashicorp_vault::Error> = vault_client.get_custom_secret("firstsecret");

    match secret {
        Ok(my_secret) => {
            println!("{}", my_secret.sample_secret);
            Ok(())
        },
        Err(err) => {
            eprintln!("error fetching secret: {}", err);
            Err(err)
        },
    }
}
