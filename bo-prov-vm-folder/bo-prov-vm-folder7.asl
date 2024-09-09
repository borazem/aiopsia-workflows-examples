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
      "Next": "Provision"
    },
    "Provision": {
      "Type": "Task",
      "Resource": "manageiq://provision_execute",
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
