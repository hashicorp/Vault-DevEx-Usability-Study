use std::env;

use hashicorp_vault;

fn main() -> Result<(), hashicorp_vault::Error> {
    let vault_address = env::var("VAULT_ADDR").expect("VAULT_ADDR must be set");
    assert!(!vault_address.is_empty());

    let vault_token = env::var("VAULT_TOKEN").expect("VAULT_TOKEN must be set");
    assert!(!vault_address.is_empty());

    let vault_client = hashicorp_vault::Client::new(vault_address, vault_token)?;

    match vault_client.get_secret("firstsecret") {
        Ok(secret) => println!("{}", secret),
        Err(err) => eprintln!("Error getting secret: {}", err),
    }

    Ok(())
}
