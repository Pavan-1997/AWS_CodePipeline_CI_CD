# AWS CodePipeline CI/CD

# Please go to Repo - AWS_CodePipeline_CI (https://github.com/Pavan-1997/AWS_CodePipeline_CI) and implement the CI and then follow this repo for CI/CD

![image](https://github.com/Pavan-1997/AWS_CodePipeline_CI_CD/assets/32020205/942175aa-ec47-4d81-b12e-1bef26f3a270)

---

# Implementing AWS CodeDeploy followed by CI/CD using AWS CodePipeline

1. Goto Code Deploy from AWS Console


2. Goto Applications tab on the left


3. Click on Create applications and Give a Application name and Compute platform - EC2/On-premises later click on Create application


4. Now goto EC2 from AWS Console -> Click on Launch instance

    Give a name 
    
    Use Ubuntu as an image
    
    Instance type as t2.micro
    
    Create a key pair if already present use existing one
    
    Click on Launch instance
    
   ** Using tags helps in the management and isolation of the AWS resources


5. Login to the EC2 instance using terminal


6. Installing the CodeDeploy agent for Ubuntu Server follow the below commands
```
sudo apt update
```
```
sudo apt install ruby-full
```
```
sudo apt install wget
```

7. Getting the resources for installing the Agent(runner)

    wget https://bucket-name.s3.region-identifier.amazonaws.com/latest/install
    
    bucket-name is the name of the Amazon S3 bucket that contains the CodeDeploy Resource Kit files for your region, and region-identifier is the identifier for your region. (This is for low latency download of resources)

     Updated command ->
```
wget https://aws-codedeploy-us-east-2.s3.us-east-2.amazonaws.com/latest/install
```

8. Give permission to install script 
```
chmod +x ./install
```

9. Install the runner
```
sudo ./install auto
```

10. Start the service for the agent
```
sudo service codedeploy-agent start
```

11. Check the status of the service 
```
sudo service codedeploy-agent status
```

12. Giving permission to EC2 to communicate to AWS CodeDeploy

    Goto IAM -> Goto Role -> Create Role -> Use case - EC2 -> Select CodeDeploy and Check CodeDeploy below -> Click on Next -> Click on Next -> Provide Role name -> Click on Create role


13. Now goto EC2 -> Actions -> Security -> Moodify IAM role -> Select the newly created IAM role 


14. Goto EC2 terminal and restart the agent service and verify
```
sudo service codedeploy-agent restart
```
```
sudo service codedeploy-agent status
```

15. Now goto back to CodeDeploy -> Expand Deploy on the left pane -> Select Applications -> Select the created application that we did in Step 3. -> Goto Deployment groups -> Click on Create deployment group -> Give Deployment group name -> For service role modify the role that we have created in Step 12. and add AmazonEC2FullAccess or create a new role and attach it ->  In Environment configuration select Amazon EC2 instances and select the Instance created from Key and Value -> Unselect the Load Balancer -> Click on Create deployment group 


16. Now goto back to CodeDeploy -> Expand Deploy on the left pane -> Select Applications -> Select the created application that we did in Step 3. -> Goto Deployments -> Click on Create deployment -> Select Deployment group created in Step 15. -> Select Revision type as My application is stored in GitHub -> Give github account name in GitHub token name and click on Connect to GitHub -> Authorize it -> Now give Repository name - <GithubUserName>/<RepoName> -> Commit ID - Provide latest commit ID from the GitHub Repo -> Click on create deployment


17. The deployment will fail since docker ins not installed

    Goto EC2 -> Run the below command
    
    sudo apt install docker.io -y


18. Now goto Step 16. you already have failed deployment just click on Retry deployment


19. Now goto CodePipeline -> Click on the pipleline that was created earlier (GOTO REPO AWS_CodePipeline_CI) -> Click on Edit -> Click on Add stage -> Give Stage name -> Click on Add stage -> Click on Add action group -> Give name to Action name -> Action Provide -AWS CodeDeploy -> Input Artifacts - BuildArtifact -> Select the created Application name -> Select the created deployment group -> Click on Done -> Click on save


20. Now go to the source repository which has the CodePipeline starting stage -> Create a commit -> Now the pipeline has to be triggered




