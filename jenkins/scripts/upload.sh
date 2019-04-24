#!/usr/bin/env sh

  dir('/var/lib/jenkins/workspace/simple-node-js-react-npm-app11'){

        pwd(); //Log current directory

            withAWS(region:'us-east-1',credentials:'MBJDG7W2TGY7NMFIDEA, mja8D0KB15yGljoktC8Yuluxd2NMM0madu94nbzi') {

                 def identity=awsIdentity();//Log AWS credentials

                // Upload files from working directory 'dist' in your project workspace
                s3Upload(bucket:"kishore-jenkinsnpm", workingDir:'dist', includePathPattern:'**/*');
            }

         };
       
	  
