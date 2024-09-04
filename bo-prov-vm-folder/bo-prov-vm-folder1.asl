{
  "Comment": "Provision then get a folder name from container then run ansible playbook to create folder",
  "StartAt": "ListProviders",
  "States": {
    "ListProviders": {
      "Type": "Task",
      "Resource": "docker://docker.io/manageiq/workflows-examples-provision-vm-service-list-providers:latest",
      "Next": "Finished",
      "Credentials": {
        "api_user.$": "$.api_user",
        "api_password.$": "$.api_password",
        "api_token.$": "$.api_token",
        "api_bearer_token.$": "$.api_bearer_token"
      },
    "Finished": {
      "Type": "Succeed"
    }
  }
}
