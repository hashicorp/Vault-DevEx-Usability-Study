#!/bin/bash

set -e

echo "Starting Vault for demo..."
if pgrep -x "vault" > /dev/null
then
    echo "** Vault is already running. Aborting. **"
    echo "To continue, please properly shutdown any Vault servers"
    echo "currently running on this host and rerun this script."
    exit 1
fi

vault server -dev -dev-root-token-id=root &
sleep 2

export VAULT_ADDR='http://127.0.0.1:8200'

#####################################
########## ACCESS POLICIES ##########
#####################################

# Add policies
# ref: https://www.vaultproject.io/docs/concepts/policies
echo -n "path \"secret/*\" { capabilities = [\"read\"] }" | vault policy write readonly -

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