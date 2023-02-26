# -- Input -- #
REGION="${1}"

# -- Constants -- #
CF_STACK_NAME="AhmtMeCdkStack"
declare -a DISTRIBUTION_CF_KEYS=("SiteDistributionId" "SiteDistributionIdEn" "SiteDistributionIdTr")

# -- Read Cloudformation -- #
STACK_OUTPUT_MAP=$(aws cloudformation describe-stacks --stack-name ${CF_STACK_NAME} --region ${REGION} \
        --query 'Stacks[0].Outputs[*].{key:OutputKey,val:OutputValue}' | jq 'map( {(.key): .val} ) | add')

for cf_key in "${DISTRIBUTION_CF_KEYS[@]}"
do
   dist_id=$(echo ${STACK_OUTPUT_MAP} | jq -r .${cf_key})

   echo "invalidating ${dist_id} (${cf_key})"
   AWS_PAGER="" aws cloudfront create-invalidation --distribution-id ${dist_id} --paths "/*" --output text
done
