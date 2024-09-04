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
        "Next": "CreateFolder"
      },
      "CreateFolder": {
        "Type": "Task",
        "Resource": "manageiq://embedded_ansible",
        "Credentials": {
          "wf_username.$": "$.username",
          "wf_password.$": "$.password",
        },
        "Parameters": {
          "RepositoryUrl": "https://github.com/borazem/CloudForms-summit-fy19/tree/master/playbooks/bosamples",
          "RepositoryBranch": "master",
          "PlaybookName": "createFolder.yml",
          "Hosts.$": "$dialog_hostname",
          "ExtraVars.$": {
            "folder_name": "$.folder_name",
            "ansible_user": "$.wf_username",
            "ansible_become_user": "$.wf_username",
            "ansible_ssh_password": "$.wf_password",
          },
        },
        "Next": "Finished"
      },
      "Finished": {
        "Type": "Succeed"
      }
    }
  }
