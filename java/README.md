# Java Details
_Note: This Java app was created using Maven_

## Getting Started
- Install [Java JDK](https://www.oracle.com/java/technologies/downloads/) (if not already installed)
- Install [Maven](https://maven.apache.org/install.html) (if not already installed)
- Run script
```
mvn clean package -DskipTests
```
```
mvn exec:java -Dexec.mainClass=com.example.vaultpoc.VaultPOC
```
_Expected Output_
```shell
 ❌ Never Hardcode Secrets 
```

## Next Steps
- Add a Vault client library
- Use the provided token to authenticate [More Info](../setup-vault/README.md)
- Fetch the secret

_Expected Output_
```shell
 🔐 Vault Is The Way 
```

## Extra Credit
- Use the provided AppRole information to authenticate with Vault

[Back To The Scenario](../README.md)