# Run ML models in Lambda

This repo is to help you get up and running quickly with model serving in AWS Lambda

To do development:
- Customize requirements.txt to hold your dependencies
- Customize the Dockerfile
    - Change /path/to/local/model to the path to your ML model
- Run the container using the command `docker-compose up --build`
- Optional: Run basic API calls to the container using `bash post_request.sh`
- Hit it at "http://localhost:8080/2015-03-31/functions/function/invocations"

To deploy:
- Follow the steps here to configure AWS and your SAM deployment tool
https://towardsdatascience.com/aws-lambda-with-custom-docker-images-as-runtime-9645b7baeb6f