# Getting Started
It is assumed you already have an AWS profile setup globally on your machine. When running any script, replace any value in [] with your corresponding value.

Assign execution permission to cf-fetch.sh, cf-create.sh, cf-update.sh and cf.delete.sh. Run the following code to assign the permissions.

```
$ chmod +x cf-*.sh
```

## List all CloudFormation Stacks

To list all your existing CloudFormation Stacks, run the following script

```
$ ./cf-fetch.sh [ProfileName]
```

The log will be saved as ``[ProfileName]_fetch.log`` under the ``logs`` folder

## Create CloudFormation Stack

To create a CloudFormation Stack, run the following script

```
$ ./cf-create.sh [StackName] [TemplateFileLocation] [ParameterFileLocation] [ProfileName]
```

The log will be saved as ``[ProfileName]_create.log`` under the ``logs`` folder

