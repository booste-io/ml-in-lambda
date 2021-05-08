# Dockerfiles build the "image" in which your lambda runs
# It is here where we do our installs of libraries

# Start with lambda's base container
FROM public.ecr.aws/lambda/python:3.8

RUN yum update -y && \
    yum upgrade -y && \
    yum install git -y

WORKDIR ${LAMBDA_TASK_ROOT}

# Install the packages as listed in requirements.txt
# First we copy that requirements.txt into the container
COPY requirements.txt requirements.txt
# Then we install the requirements from within the container
RUN python3 -m pip install -r requirements.txt

# Copy your model files from local into the container image
COPY /path/to/local/model /${LAMBDA_TASK_ROOT}/my_model

# Copy the api handler function into the container
COPY app.py /${LAMBDA_TASK_ROOT}/app.py

# NOTE: app.py and my_model now sit next to each other in the container
# so in app.py we load the model simply from relative import "./my_model"

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "app.handler" ]
