#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

# The private key and address of the Alice.
# Swap these into program.json, when running transactions as the first bidder.
# "private_key": "APrivateKey1zkp1w8PTxrRgGfAtfKUSq43iQyVbdQHfhGbiNPEg2LVSEXR",
# "address": "aleo13ssze66adjjkt795z9u5wpq8h6kn0y2657726h4h3e3wfnez4vqsm3008q"

# The private key and address of the Bob.
# Swap these into program.json, when running transactions as the second bidder.
# "private_key": "APrivateKey1zkpFo72g7N9iFt3JzzeG8CqsS5doAiXyFvNCgk2oHvjRCzF"
# "address": "aleo17vy26rpdhqx4598y5gp7nvaa9rk7tnvl6ufhvvf4calsrrqdaqyshdsf5z"

# Swap in the private key and address of the Alice to program.json.
echo "{
  \"program\": \"token.aleo\",
  \"version\": \"0.0.0\",
  \"description\": \"\",
  \"development\": {
      \"private_key\": \"APrivateKey1zkp1w8PTxrRgGfAtfKUSq43iQyVbdQHfhGbiNPEg2LVSEXR\",
      \"address\": \"aleo13ssze66adjjkt795z9u5wpq8h6kn0y2657726h4h3e3wfnez4vqsm3008q\"
  },
  \"license\": \"MIT\"
}" > program.json

# Publicly mint 100 tokens for Alice.
echo "
###############################################################################
########                                                               ########
########     STEP 1: Publicly mint 100 tokens for Alice                ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PUBLIC BALANCES            |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |         100         |           ########
########           -----------------------------------------           ########
########           |        Bob      |          0          |           ########
########           -----------------------------------------           ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PRIVATE BALANCES           |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |          0          |           ########
########           -----------------------------------------           ########
########           |        Bob      |          0          |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run mint_public aleo13ssze66adjjkt795z9u5wpq8h6kn0y2657726h4h3e3wfnez4vqsm3008q 100u64

# Swap in the private key and address of Bob to program.json.
echo "{
  \"program\": \"token.aleo\",
  \"version\": \"0.0.0\",
  \"description\": \"\",
  \"development\": {
      \"private_key\": \"APrivateKey1zkpFo72g7N9iFt3JzzeG8CqsS5doAiXyFvNCgk2oHvjRCzF\",
      \"address\": \"aleo17vy26rpdhqx4598y5gp7nvaa9rk7tnvl6ufhvvf4calsrrqdaqyshdsf5z\"
  },
  \"license\": \"MIT\"
}" > program.json

# Privately mint 100 tokens for Bob.
echo "
###############################################################################
########                                                               ########
########     STEP 2: Privately mint 100 tokens for Bob                 ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PUBLIC BALANCES            |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |         100         |           ########
########           -----------------------------------------           ########
########           |        Bob      |          0          |           ########
########           -----------------------------------------           ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PRIVATE BALANCES           |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |          0          |           ########
########           -----------------------------------------           ########
########           |        Bob      |         100         |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run mint_private aleo17vy26rpdhqx4598y5gp7nvaa9rk7tnvl6ufhvvf4calsrrqdaqyshdsf5z 100u64

# Swap in the private key and address of the Alice to program.json.
echo "{
  \"program\": \"token.aleo\",
  \"version\": \"0.0.0\",
  \"description\": \"\",
  \"development\": {
      \"private_key\": \"APrivateKey1zkp1w8PTxrRgGfAtfKUSq43iQyVbdQHfhGbiNPEg2LVSEXR\",
      \"address\": \"aleo13ssze66adjjkt795z9u5wpq8h6kn0y2657726h4h3e3wfnez4vqsm3008q\"
  },
  \"license\": \"MIT\"
}" > program.json

# Publicly transfer 10 tokens from Alice to Bob.
echo "
###############################################################################
########                                                               ########
########     STEP 3: Publicly transfer 10 tokens from Alice to Bob     ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PUBLIC BALANCES            |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |          90         |           ########
########           -----------------------------------------           ########
########           |        Bob      |          10         |           ########
########           -----------------------------------------           ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PRIVATE BALANCES           |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |          0          |           ########
########           -----------------------------------------           ########
########           |        Bob      |         100         |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run transfer_public aleo17vy26rpdhqx4598y5gp7nvaa9rk7tnvl6ufhvvf4calsrrqdaqyshdsf5z 10u64

# Swap in the private key and address of Bob to program.json.
echo "{
  \"program\": \"token.aleo\",
  \"version\": \"0.0.0\",
  \"description\": \"\",
  \"development\": {
      \"private_key\": \"APrivateKey1zkpFo72g7N9iFt3JzzeG8CqsS5doAiXyFvNCgk2oHvjRCzF\",
      \"address\": \"aleo17vy26rpdhqx4598y5gp7nvaa9rk7tnvl6ufhvvf4calsrrqdaqyshdsf5z\"
  },
  \"license\": \"MIT\"
}" > program.json

# Privately transfer 20 tokens from Bob to Alice.
echo "
###############################################################################
########                                                               ########
########     STEP 4: Privately transfer 20 tokens from Bob to Alice    ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PUBLIC BALANCES            |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |          90         |           ########
########           -----------------------------------------           ########
########           |        Bob      |          10         |           ########
########           -----------------------------------------           ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PRIVATE BALANCES           |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |          20         |           ########
########           -----------------------------------------           ########
########           |        Bob      |          80         |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run transfer_private "{
        owner: aleo17vy26rpdhqx4598y5gp7nvaa9rk7tnvl6ufhvvf4calsrrqdaqyshdsf5z.private,
        amount: 100u64.private,
        _nonce: 6586771265379155927089644749305420610382723873232320906747954786091923851913group.public
    }" aleo13ssze66adjjkt795z9u5wpq8h6kn0y2657726h4h3e3wfnez4vqsm3008q 20u64

# Swap in the private key and address of the Alice to program.json.
echo "{
  \"program\": \"token.aleo\",
  \"version\": \"0.0.0\",
  \"description\": \"\",
  \"development\": {
      \"private_key\": \"APrivateKey1zkp1w8PTxrRgGfAtfKUSq43iQyVbdQHfhGbiNPEg2LVSEXR\",
      \"address\": \"aleo13ssze66adjjkt795z9u5wpq8h6kn0y2657726h4h3e3wfnez4vqsm3008q\"
  },
  \"license\": \"MIT\"
}" > program.json

# Convert 30 public tokens from Alice into 30 private tokens for Bob.
echo "
###############################################################################
########                                                               ########
########     STEP 5: Convert 30 public tokens from Alice into 30       ########
########             private tokens for Bob.                           ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PUBLIC BALANCES            |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |          60         |           ########
########           -----------------------------------------           ########
########           |        Bob      |          10         |           ########
########           -----------------------------------------           ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PRIVATE BALANCES           |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |          20         |           ########
########           -----------------------------------------           ########
########           |        Bob      |         110         |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run transfer_public_to_private aleo17vy26rpdhqx4598y5gp7nvaa9rk7tnvl6ufhvvf4calsrrqdaqyshdsf5z 30u64

# Swap in the private key and address of Bob to program.json.
echo "{
  \"program\": \"token.aleo\",
  \"version\": \"0.0.0\",
  \"description\": \"\",
  \"development\": {
      \"private_key\": \"APrivateKey1zkpFo72g7N9iFt3JzzeG8CqsS5doAiXyFvNCgk2oHvjRCzF\",
      \"address\": \"aleo17vy26rpdhqx4598y5gp7nvaa9rk7tnvl6ufhvvf4calsrrqdaqyshdsf5z\"
  },
  \"license\": \"MIT\"
}" > program.json

# Convert 40 private tokens from Bob into 40 public tokens for Alice.
echo "
###############################################################################
########                                                               ########
########     STEP 6: Convert 40 private tokens from Bob into 40        ########
########             public tokens for Alice.                          ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PUBLIC BALANCES            |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |         100         |           ########
########           -----------------------------------------           ########
########           |        Bob      |          10         |           ########
########           -----------------------------------------           ########
########                                                               ########
########           -----------------------------------------           ########
########           |            PRIVATE BALANCES           |           ########
########           -----------------------------------------           ########
########           -----------------------------------------           ########
########           |        Alice    |          20         |           ########
########           -----------------------------------------           ########
########           |        Bob      |          70         |           ########
########           -----------------------------------------           ########
########                                                               ########
###############################################################################
"
leo run transfer_private_to_public "{
        owner: aleo17vy26rpdhqx4598y5gp7nvaa9rk7tnvl6ufhvvf4calsrrqdaqyshdsf5z.private,
        amount: 80u64.private,
        _nonce: 1852830456042139988098466781381363679605019151318121788109768539956661608520group.public
    }" aleo13ssze66adjjkt795z9u5wpq8h6kn0y2657726h4h3e3wfnez4vqsm3008q 40u64


# Swap in the private key and address of the Alice to program.json.
# This is done to ensure that program.json is the same after every execution of ./run.sh.
echo "{
  \"program\": \"token.aleo\",
  \"version\": \"0.0.0\",
  \"description\": \"\",
  \"development\": {
      \"private_key\": \"APrivateKey1zkp1w8PTxrRgGfAtfKUSq43iQyVbdQHfhGbiNPEg2LVSEXR\",
      \"address\": \"aleo13ssze66adjjkt795z9u5wpq8h6kn0y2657726h4h3e3wfnez4vqsm3008q\"
  },
  \"license\": \"MIT\"
}" > program.json