# Vault Developer Experience Usability Study
A collection of resources to complete a scenario based around incorporating Vault into a sample application.

## Resources In This Repository
A starting point has been created in five languages:
 - [C#](./dotnet/README.md) - Found in `dotnet/`
 - [Golang](./go/README.md) - Found in `go/`
 - [Java](./java/README.md) - Found in `java/`
 - [Python](./python/README.md) - Found in `python/`
 - [Ruby](./ruby/README.md) - Found in `ruby/`  

## Scenario
Your company’s engineering team is looking into ways to increase the security of your apps and
infrastructure. You’ve heard Vault is a great solution for secret management and would like to give
it a try to see if it would be a good fit for your needs. To build a POC, you plan to integrate a test
script with Vault. Your simple test aims to replace a hardcoded value with one retrieved from Vault.

### Key Information
Each language will operate off the same key information to access Vault; at minimum you'll need to know
Vault's address, a way to authenticate your application and the path where the secret is stored.

### More Information
[Vault's documentation](https://www.vaultproject.io/docs) is a great place to start!

### Local Docker Vault Details
We've provided a containerized Vault server that includes everything needed to do this exercise.  

Creating the bootstrapped Vault image and running it:
```shell
cd setup-vault
docker build -t explore-vault . # build the image and tag it "explore-vault"
docker run --rm -p 8200:8200 explore-vault # expose port 8200 and run container
```
The above will yeild a Vault server with the following attributes:

|                    | Value                  |
|--------------------|------------------------|
| Vault Address      | http://localhost:8200  |
| Secret Engine      | KV-v2                  |
| Secret Mount Point | secret                 |
| Secret Path        | firstsecret            |
| Secret Key         | sample_secret          |
| Read-Only Token    | demo-read-only         |
| AppRole ID         | approle-demo-readonly  |
| AppRole Secret ID  | -- shown on startup -- |

More information in the [Setting Up Vault](./setup-vault/README.md) readme.

_Enjoy!_ 