#!/bin/sh
set -e

if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi

op_tmp_folder="/tmp/op"
mkdir "$op_tmp_folder"
curl -o "$op_tmp_folder/op.zip" https://cache.agilebits.com/dist/1P/op/pkg/v0.1.1/op_darwin_amd64_v0.1.1.zip
unzip -d "$op_tmp_folder" "$op_tmp_folder/op.zip"
cp "$op_tmp_folder/op" /usr/local/bin/

rm -rf /tmp/op
