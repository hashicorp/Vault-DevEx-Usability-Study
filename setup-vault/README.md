# Setting Up The Vault Server
We've provided a few ways to launch a configured Vault server to provide the
resources needed to accomplish the scenario outlined in the parent directory.

[Back To The Scenario](../README.md)

## HCP Vault
A preconfigured HCP Vault instance is available and only requires access to the internet.  
_Note:_ HCP Vault makes use of namespaces

|                   | Value                                                                                     |
|-------------------|-------------------------------------------------------------------------------------------|
| Vault Address     | https://explore-vault.vault.dd896d30-f154-41fc-9463-8800f9a3f685.aws.hashicorp.cloud:8200 |
| Namespace         | admin                                                                                     |
| Secret Path       | secret/firstsecret                                                                        |
| Secret Key        | sample_secret                                                                             |
| Read-Only Token   | s.Cftxka41ca8LGUYDMRmaL9WR.eGZyo                                                          |
| AppRole ID        | approle-demo-readonly                                                                     |
| AppRole Secret ID | 1b51828e-a501-d7a3-e43c-132604dd1931                                                      |

## Vault On Docker
A dockerfile is provided in `./setup-vault/docker` and can be executed using some basic
Docker commands.  
This option requires Docker to be installed: [more info](https://docs.docker.com/get-docker/)  
_This is a **development server** and does not reflect how to operate Vault in a production setting!_

Creating the bootstrapped Vault image and running it:
```shell
cd setup-vault/docker
docker build -t explore-vault . # build the image and tag it "explore-vault"
docker run --rm -p 8200:8200 explore-vault # expose port 8200 and run container in background
```
|                   | Value                  |
|-------------------|------------------------|
| Vault Address     | http://localhost:8200  |
| Secret Path       | secret/firstsecret     |
| Secret Key        | sample_secret          |
| Read-Only Token   | demo-read-only         |
| AppRole ID        | approle-demo-readonly  |
| AppRole Secret ID | -- shown on startup -- |


## Vault Binary
A Vault server can be provisioned locally by downloading the [binary](https://www.vaultproject.io/downloads)
and using the resources in `./setup-vault/local` to bootstrap a developer instance.  
[More info](local/README.md) is available if you choose this option.  
_This is a **development server** and does not reflect how to operate Vault in a production setting!_

|                   | Value                  |
|-------------------|------------------------|
| Vault Address     | http://localhost:8200  |
| Secret Path       | secret/firstsecret     |
| Secret Key        | sample_secret          |
| Read-Only Token   | demo-read-only         |
| AppRole ID        | approle-demo-readonly  |
| AppRole Secret ID | -- shown on startup -- |