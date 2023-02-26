# -- Input -- #
REGION="${1}"

# -- Constants -- #
CF_STACK_NAME="AhmtMeCdkStack"
BUCKET_NAME_CF_KEY="SiteBucketName"
HUGO_CONFIG_FILE="config/_default/deployment.yaml"

# -- Read Cloudformation -- #
STACK_OUTPUT_MAP=$(aws cloudformation describe-stacks --stack-name ${CF_STACK_NAME} --region ${REGION} \
        --query 'Stacks[0].Outputs[*].{key:OutputKey,val:OutputValue}' | jq 'map( {(.key): .val} ) | add')

BUCKET_NAME=$(echo ${STACK_OUTPUT_MAP} | jq -r .${BUCKET_NAME_CF_KEY})

# -- Write to Hugo config -- #
S3_URL="s3://${BUCKET_NAME}?region=${REGION}"

echo "targets:" > ${HUGO_CONFIG_FILE}
echo "  URL: ${S3_URL}" >> ${HUGO_CONFIG_FILE}
