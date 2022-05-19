# Setting Up Vault On Docker

A dockerfile is provided in `./setup-vault/docker` and can be executed using some basic
Docker commands.  
This option requires Docker to be installed: [more info](https://docs.docker.com/get-docker/)  
_This is a **development server** and does not reflect how to operate Vault in a production setting!_

Creating the bootstrapped Vault image and running it:
```shell
cd setup-vault
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

[Back To The Scenario](../README.md)
