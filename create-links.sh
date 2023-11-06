#!/usr/bin/env bash

set -e

DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

f="oidc-add"
ln -sv "$DIR/result/bin/$f" "/usr/local/bin/$f"

f="oidc-agent"
ln -sv "$DIR/result/bin/$f" "/usr/local/bin/$f"

f="oidc-agent-service"
ln -sv "$DIR/result/bin/$f" "/usr/local/bin/$f"

f="oidc-gen"
ln -sv "$DIR/result/bin/$f" "/usr/local/bin/$f"

f="oidc-keychain"
ln -sv "$DIR/result/bin/$f" "/usr/local/bin/$f"

f="oidc-prompt"
ln -sv "$DIR/result/bin/$f" "/usr/local/bin/$f"

f="oidc-token"
ln -sv "$DIR/result/bin/$f" "/usr/local/bin/$f"
