#!/bin/bash

# zipcode_update.py deploy script
# python version = 2.7.X
# pip install aws-cli が必要です。
# 実行前にAWSのクレデンシャルを環境変数にセットする必要が有ります。
# direnvを使うと良いかもしれません。
# export AWS_ACCESS_KEY_ID=""
# export AWS_SECRET_ACCESS_KEY=""

RESION="ap-northeast-1"
FUNCTION_NAME=""
ZIP_PATH="fileb://$FUNCTION_NAME1.zip"

# python library
# pip install {library name} -t src

cd src;zip -r ../FUNCTION_NAME1.zip *; cd ../

# update lamdafunction
aws lambda update-function-code --region $RESION --function-name $FUNCTION_NAME --zip-file $ZIP_PATH

rm -fr $FUNCTION_NAME.zip
