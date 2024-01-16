# RSpec using CloudFormation to provision infrastructure on AWS ☁️

------

## ✅ Requirements

- [aws-cli] - v 2.15.4
- [ruby] - v 2.5.1
- [rspec] - v 3.12.0

## 📑 Resources Template for CloudFormation

```
pipeline.yaml
  |-- S3BucketBuilds
  |-- CodePipeline
  |-- CodeBuild
  |-- CodePipelineRole
  |-- CodeBuildRole
  |-- EventsRule
  |-- EventRole
  |-- EventManagedPolicy
```

## 📑 Test Project Structure

```
rspec_tests
  |-- spec
  |   |-- *_spec.rb
  |   |-- *_helper.rb
  |-- Gemfile
  |-- Rakefile
  |-- scripts
  |   |-- rspec.sh
```
## 📑 Init Stack

*Configure ${variables} for the CLI before running the command*

Command to start the stack: `aws cloudformation create-stack --stack-name rspec-server-test --template-body file://pipeline.yaml --parameters ParameterKey=RepositoryName,ParameterValue=cloudformation-with-rspec-server-test ParameterKey=ApplicationName,ParameterValue=cloudformation-with-rspec ParameterKey=SecurityGroupId,ParameterValue=${sg-example} ParameterKey=VpcId,ParameterValue=${vpc-example} ParameterKey=SubnetId,ParameterValue=${subnet-example} ParameterKey=Region,ParameterValue=us-east-2 ParameterKey=Keypair,ParameterValue=${ec2-example} ParameterKey=AccountId,ParameterValue=${162*} ParameterKey=GitHubToken,ParameterValue=${ghp_1*example} --capabilities CAPABILITY_NAMED_IAM`

Command to destroy the stack: `aws cloudformation delete-stack --stack-name rspec-server-test`

## 🔮 Support this project  

If you want to support this project, leave a ⭐.  

---  

Made with 💙 &nbsp;by Marco Antonio 👋 &nbsp; [Meu LinkedIn](https://www.linkedin.com/in/mrk-silva/)  