#!/bin/bash

while true
do

# Logo
#!/bin/bash
echo -e "\033[35m"
echo " ░█████╗ ░███╗░░░███╗ ██████╗░ ";
echo " ██╔══██╗ ████╗░████║ ██╔══██╗ ";
echo " ███████║ ██╔████╔██║ ██████╦╝ ";
echo " ██╔══██║ ██║╚██╔╝██║ ██╔══██╗ ";
echo " ██║░░██║ ██║░╚═╝░██║ ██████╦╝ ";
echo " ╚═╝░░╚═╝ ╚═╝░░░░░╚═╝ ╚═════╝░ ";
echo -e "\033[35m"
echo -e "\033[35m"
echo "=================================================="
echo -e "https://amb.place"
echo -e "https://bundlr.network"
echo "=================================================="
echo -e "\033[0m"

# Menu

PS3='Select an action: '
options=(
"Install Node"
"Environment Variables"
"Run validator"
"Request tokens"
"Exit")
select opt in "${options[@]}"
do
case $opt in

"Install Node")
echo "============================================================"
echo "1. Install start"
echo "============================================================"

#UPDATE APT
sudo apt update
sudo apt install zip -y

#INSTALL
git clone --recurse-submodules https://github.com/Bundlr-Network/validator-rust.git

cargo run --bin wallet-tool create > wallet.json
break
;;

"Environment Variables")
DATABASE_URL="<postgres-database-url>"
VALIDATOR_KEY="<path-to-wallet>"
BUNDLER_URL="<bundler-url>" 

GW_CONTRACT="<validator contract address>"  
GW_WALLET="<path-to-wallet>"
GW_ARWEAVE="<gateway-url>"

cp example.env .env
docker-compose up
git pull origin master
docker-compose build
break
;;

"Run validator")
docker-compose up
break
;;

"Request tokens")
echo "========================================================================================================================"
echo "In order to receive tokens, you need to go to website
and request tokens https://bundlr.network/faucet"
echo "========================================================================================================================"

break
;;

"Register validator")
npm i -g @bundlr-network/testnet-cli
@bundlr-network/testnet-cli join <validator-contract> -w <path-to-wallet> -u <validator-url> -s <stake-tokens>
break
;;

"Exit")
exit
;;
*) echo "invalid option $REPLY";;
esac
done
done
