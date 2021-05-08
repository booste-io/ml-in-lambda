# imports
import json
import torch
# import others...

# Load your model before the handler.
# It runs only once, when the servers start.
device = "cpu"
model = torch.load("./my_model", device=device)

def handler(event, context):
    # Pull in your preloaded model, to be used by this handler
    global model

    # Preprocess your inbound event
    if 'body' in event.keys():
        event = json.loads(event["body"])
    a = event["a"]
    b = event["b"]
    # etc...

    # Run inference
    with torch.no_grad():
        # This line here runs your model using the global "model" variable
        outputs = model(a, b)

    # Structure your API output
    body = {
        "message": "it ran",
        "outputs": outputs
    }

    response = {
        "statusCode": 200,
        "body": json.dumps(body),
    }

    return response
