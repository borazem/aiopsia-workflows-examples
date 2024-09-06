{
  "Comment": "Provision then get a folder name from container then run ansible playbook to create folder",
  "StartAt": "Provision",
  "States": {
    "Provision": {
      "Type": "Task",
      "Resource": "manageiq://provision_execute",
      "Next": "HelloWorld"
    },
    "HelloWorld": {
      "Type": "Pass",
      "Result": "Hello World!",
      "Next": "Finished"
    },
    "Finished": {
      "Type": "Succeed"
    }
  }
}
