{
  "Comment": "Provision then get a folder name from container then run ansible playbook to create folder",
  "StartAt": "PreProvision1",
  "States": {
    "PreProvision1": {
      "Type": "Pass",
      "Next": "PreProvision2"
    },
    "PreProvision2": {
      "Type": "Pass",
      "Next": "GetFolderName"
    },
    "GetFolderName":{
      "Type": "Task",
      "Resource": "docker://docker.io/borazem/bofnames2:latest",
      "Parameters": {
        "FOLDER_ALIAS_NAME.$": "$.dialog_name"
      },
      "Next": "PostProvision1"
    },
    "PostProvision1": {
      "Type": "Pass",
      "Next": "PostProvision2"
    },
    "PostProvision2": {
      "Type": "Pass",
      "Next": "Finished"
    },
    "Finished": {
      "Type": "Succeed"
    }
  }
}
