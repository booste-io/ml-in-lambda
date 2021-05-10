# Run ML models in Lambda

This repo is to help you get up and running quickly with model serving in AWS Lambda

To do development:
- Customize requirements.txt to hold your dependencies
- Customize the Dockerfile
    - Change /path/to/local/model to the path to your ML model
- Edit app.py (the main python file) to run your inference
- Run the container using the command `docker-compose up --build`
- Optional: Run basic API calls to the container using `bash post_request.sh`
- Hit it at "http://localhost:8080/2015-03-31/functions/function/invocations"

To deploy:
- Follow the steps here to configure AWS and your SAM deployment tool
https://towardsdatascience.com/aws-lambda-with-custom-docker-images-as-runtime-9645b7baeb6f
- IMPORTANT: Edit the template.yaml file created by SAM to have a larger MemorySize 
```
Globals:
  Function:
    Timeout: 180
    MemorySize: 5000 # Very important - ML models and frameworks (TF, Torch) take up more than lambda's default memory, so make sure to adjust memory
