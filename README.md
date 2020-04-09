# Infrastructure

Here we use the template build body and create/delete/update stack 

## create stack

aws cloudformation create-stack --stack-name Mystack --template-body file://path/to/file_location/networking.json

## delete stack

aws cloudformation delete-stack --stack-name Mystack

## update stack

aws cloudformation update-stack --stack-name Mystack --template-body file://path/to/file_location/networking.json

## create/update/delete stack using aws

bash create-app-stack.sh Mystack