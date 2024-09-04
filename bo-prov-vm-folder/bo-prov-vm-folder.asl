{
  "Comment": "Provision then get a folder name from container then run ansible playbook to create folder",
  "StartAt": "ListProviders",
  "States": {
    "ListProviders": {
      "Type": "Task",
      "Resource": "docker://docker.io/manageiq/workflows-examples-provision-vm-service-list-providers:latest",
      "Next": "Provision",
      "Credentials": {
        "wf_username.$": "$.username",
        "wf_password.$": "$.password"
      }
    }
  }
}
