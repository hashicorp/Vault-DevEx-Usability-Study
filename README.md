# Vault Developer Experience Usability Study
A collection of resources to complete a scenario based around incorporating Vault into a sample application.

## Resources In This Repository
A starting point has been created in five languages:
 - [C#](./dotnet/README.md) - Found in `dotnet/`
 - [Golang](./go/README.md) - Found in `go/`
 - [Java](./java/README.md) - Found in `java/`
 - [Python](./python/README.md) - Found in `python/`
 - [Ruby](./ruby/README.md) - Found in `ruby/`  

A few options exist for creating a Vault instance suitable for this exercise
 - [Setting Up Vault](./setup-vault/README.md) - Found in `setup-vault/`

## Scenario
Your company’s engineering team is looking into ways to increase the security of your apps and
infrastructure. You’ve heard Vault is a great solution for secret management and would like to give
it a try to see if it would be a good fit for your needs. To build a POC, you plan to integrate a test
script with Vault. Your simple test aims to replace a hardcoded value with one retrieved from Vault.

### Key Information
Each language will operate off the same key information to access Vault; at minimum you'll need to know
Vault's address, a way to authenticate your application and the path where the secret is stored. We've provided all
of this information in the [Setting Up Vault](./setup-vault/README.md) readme.

### Stumped?
[Vault's documentation](https://www.vaultproject.io/docs) is a great place to start and we're here to help!  
Email our team with any questions (design, engineering, product, and research) at [vault-diary-study@hashicorp.com](mailto:vault-diary-study@hashicorp.com)

_Enjoy!_ 