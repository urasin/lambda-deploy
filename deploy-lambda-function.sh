#!/bin/bash

# aws lambda deploy script
# python version = 2.7.X
# pip install aws-cli が必要です。
# 実行前にAWSのクレデンシャルを環境変数にセットする必要が有ります。
# direnvを使うと良いかもしれません。

export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""

RESION=""p-northeast-1"  # 東京リージョン
FUNCTION_NAME="lambda-rds"
ZIP_PATH="fileb://$FUNCTION_NAME.zip"

# python library
pip install PyMySQL -t src

cd src;zip -r ../$FUNCTION_NAME.zip *; cd ../

# update lamdafunction
aws lambda update-function-code --region $RESION --function-name $FUNCTION_NAME --zip-file $ZIP_PATH

rm -fr $FUNCTION_NAME.zip

