# replace with your credentials
aws_region=us-west-1
aws_account_id=123454567789

aws ecr get-login-password \
    --region $aws_region \
| docker login \
    --username AWS \
    --password-stdin $aws_account_id.dkr.ecr.$aws_region.amazonaws.com

docker build -t $aws_account_id.dkr.ecr.$aws_region.amazonaws.com/clip_serverless .

docker push $aws_account_id.dkr.ecr.$aws_region.amazonaws.com/clip_serverless

sam deploy --guided
