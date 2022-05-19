#!/bin/sh

###############################################################################################
##               *** WARNING - INSECURE - DO NOT USE IN PRODUCTION ***                       ##
## This script is to simulate operations a Vault operator would perform and, as such,        ##
## is not a representation of best practices in production environments.                     ##
## https://learn.hashicorp.com/tutorials/vault/pattern-approle?in=vault/recommended-patterns ##
###############################################################################################

set -e

export VAULT_ADDR='http://127.0.0.1:8200'

# Spawn a new process for the development Vault server and wait for it to come online
# ref: https://www.vaultproject.io/docs/concepts/dev-server
vault server -dev -dev-listen-address="0.0.0.0:8200" -dev-root-token-id="root" &
sleep 5s

# Authenticate container's local Vault CLI
# ref: https://www.vaultproject.io/docs/commands/login
vault login -no-print root

#####################################
########## ACCESS POLICIES ##########
#####################################

# Add policies
# ref: https://www.vaultproject.io/docs/concepts/policies
echo "path \"secret/*\" { capabilities = [\"read\"] }" | vault policy write readonly -

##########################
########## AUTH ##########
##########################

# Add token
vault token create -id=demo-read-only -policy=readonly

# Enable AppRole auth method
# ref: https://www.vaultproject.io/docs/auth/approle
vault auth enable approle
vault write auth/approle/role/demo token_policies=readonly
# Overwrite our role id with a known value to simplify our demo
vault write auth/approle/role/demo/role-id role_id="approle-demo-readonly"

#####################################
########## STATIC SECRETS ###########
#####################################
# Seed the kv-v2 store with an entry
vault kv put "secret/firstsecret" "sample_secret=🔐 Vault Is The Way"

echo
echo "*********************************"
echo "***** SECRET ID FOR APPROLE *****"
vault write -force auth/approle/role/demo/secret-id
echo "*********************************"
echo "** Vault is ready for the demo **"
echo "*********************************"

# Keep container alive
tail -f /dev/null & trap 'kill %1' TERM ; wait