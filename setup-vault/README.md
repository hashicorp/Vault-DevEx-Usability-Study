# Setting Up The Vault Server Using Vault Binary
A Vault server can be provisioned locally by downloading the [binary](https://www.vaultproject.io/downloads)
and using the resources in `./setup-vault/local` to bootstrap a developer instance.  

#### Assumptions
 - Vault binary is installed on users `$PATH`
 - Vault server is currently not running

#### Tasks
 - Simply execute the script applicable to your environment

_This is a **development server** and does not reflect how to operate Vault in a production setting!_

|                   | Value                  |
|-------------------|------------------------|
| Vault Address     | http://localhost:8200  |
| Secret Path       | secret/firstsecret     |
| Secret Key        | sample_secret          |
| Read-Only Token   | demo-read-only         |
| AppRole ID        | approle-demo-readonly  |
| AppRole Secret ID | -- shown on startup -- |

[Back To The Scenario](../../README.md)