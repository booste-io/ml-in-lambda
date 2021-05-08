#!/bin/bash
curl -XPOST "http://localhost:8080/2015-03-31/functions/function/invocations" -d '{"a":"this is A", "b":"this is B"}'