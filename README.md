# Infrastructure

Here we use the template build body and create/delete/update stack We can even use seperate file to send parametes which helps in saving sensitive data

## create stack

aws cloudformation create-stack --stack-name Mystack --template-body file://path/to/file_location/networking.json

## delete stack

aws cloudformation delete-stack --stack-name MyNetwork

## update stack

aws cloudformation update-stack --stack-name MyNetwork --template-body file://path/to/file_location/networking.json

add --profie while using aws