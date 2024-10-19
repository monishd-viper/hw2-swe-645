Process to create a S3 bucket with your code

1. Login to the AWS console and go to the AWS Management Console
2. Navigate to the S3 dashboard.
3. Click on the "Create bucket" button and do the further actions.
4. Provide a name for the bucket in this case named it as myclasshomepages
5. Select the region closest to you (either use ohio or northern virginia)
6. ACL's disabled is the recommended option and can choose that.
7. Block all public access is turned on you should turn it off and make it public in order to host a static website.
8. Now click on "Create bucket" button and create it.
9. Now the bucket would be created and click on the bucket name you created and open it.
10. Bucket versioning is enabled and MFA is disabled by default.
11. Now we need to Enable Static website hosting and then click on edit.
12. Select "Host a static Website"
13. Give the name of the index.html and error.html files respectively and save it.
14. Now upload files in the "Objects" tab and click the upload button.
15. After that select "Add files" to choose your html,css and javascript local files and click on "upload"
16. Now you can see that the files are uploaded and you can access the website by checking the website endpoint and it must look something like this.
 
17. You can use this link in order to access the website 

http://myclasshomepages.s3.us-east-2.amazonaws.com/index.html - AWS S3

18. It must be live and accessible 

http://ec2-54-198-23-255.compute-1.amazonaws.com/ - AWS EC2

Process to create an EC2 instance and upload the survey files to the instance.

1. Create an EC2 instance on AWS using Ubuntu with Key pair for SSH port 22 and HTTP access with port 80.
2. Connect the instance using Putty with the private key with the .pem file.
3. Upload the survey.html to the instance using  by connecting the IP from the instance.
4. Upload survey.html file to the /var/www/html directory using FileZilla after connecting to the instance via IP address with port 22.
5. Get the private IPv4 DNS of the instance and connect to the internet gateway.
6. Start Apache (I have used the following commands)
	- sudo yum install httpd -y && sudo systemctl start httpd
7. Access survey.html using the public IP via http://ec2-54-198-23-255.compute-1.amazonaws.com/

Now you can access the survey page through the S3 homepage website through the link at the last.     
