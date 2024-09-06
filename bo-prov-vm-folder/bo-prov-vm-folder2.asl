
{
  "Comment": "Provision then get a folder name from container then run ansible playbook to create folder",
  "StartAt": "Provision",
  "States": {
    "Provision": {
      "Type": "Task",
      "Resource": "manageiq://provision_execute",
      "Next": "GetFolderName"
    },
    "GetFolderName":{
      "Type": "Task",
      "Resource": "docker://docker.io/borazem/bofnames1:latest",
      "Parameters": {
        "FOLDER_ALIAS_NAME.$": "$.dialog_name"
      },
      "Next": "Finished"
    },
    "Finished": {
      "Type": "Succeed"
    }
  }
}
