{
  "Comment": "List Templates.",
  "StartAt": "ListTemplates",
  "States": {
    "ListTemplates": {
      "Type": "Task",
      "Resource": "docker://docker.io/manageiq/workflows-examples-provision-vm-service-list-templates:latest",
      "Credentials": {
        "api_user.$": "$.api_user",
        "api_password.$": "$.api_password",
        "api_token.$": "$.api_token",
        "api_bearer_token.$": "$.api_bearer_token"
      }
    }
  }
}