#BarC

This repo holds the result of a test i was asked to do as part of a recruitment 

#prerequisites
installed: 
	- Recent Java version (gatling requires it)

#Test setup
The test runs through the following steps
- installing prerequisites : Terraform, Packer and gatling
- Packer: create image in amazon aws with tomcat installed ready to go. 
- Terraform: Setup a security-group, key-pair and instance (the one created by packer)
- Upload JSPWiki (just a random app) to the tomcat instance by means of http (simple curl command does the trick)
- kicks a gatling test in gear to see if the applcation actually works . 

# useage
create a credentials.txt file : 
```
AWS_ACCESS_KEY="AKIAIIJPYRBAHXKVIJSA"
WS_SECRET_KEY="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"
```

execute run.sh
```
/>./run.sh
```

and presto. 

sit back .. relax and enjoy the show. 

the results of the test are going to be in ./gatling/output



