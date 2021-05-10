# replace with your credentials
aws_region=us-west-1
aws_account_id=123454567789
lambda_function_name=myMLFunction

aws ecr get-login-password \
    --region $aws_region \
| docker login \
    --username AWS \
    --password-stdin $aws_account_id.dkr.ecr.$aws_region.amazonaws.com

docker build -t $aws_account_id.dkr.ecr.$aws_region.amazonaws.com/$lambda_function_name .

docker push $aws_account_id.dkr.ecr.$aws_region.amazonaws.com/$lambda_function_name

sam deploy --guided
