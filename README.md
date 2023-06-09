# Lightsail-WordPress-Deployment
This project provides a shell script to automate the installation and configuration of WordPress on an Amazon Lightsail instance. It is designed to be easy to use and customize, allowing you to quickly deploy a fully-functional WordPress site on the AWS cloud.

## Prerequisites

Before deploying this project, you should have:

- An AWS account with access to the Lightsail service
- Basic knowledge of the AWS Management Console and command line interface
- Basic knowledge of WordPress and PHP

## Deployment

To deploy this project, follow these steps:

1. Log in to the AWS Management Console and navigate to Lightsail.

2. Click the "Create Instance" button and select the "OS only" and "Ubuntu" blueprint.

3. Choose your preferred instance plan, location, and launch script, and then click "Create Instance". If you are using the free tier, be sure to select an instance plan that is eligible for the free tier, such as the "WordPress" plan with 512 MB RAM. The instance will be created and launched.

4. Once the instance is running, click the "Connect" button next to your instance, and then click "Connect using SSH". A browser-based terminal window will open.

## SSH access

#Local Computer
Open Command Prompt or Terminal on your local computer.

Enter the following command to create a key pair.

```
ssh-keygen -t rsa
```

Specify a directory location on your computer where the key pair should be saved.

For example:

On Windows: C:\Users\<UserName>\.ssh\<KeyPairName>

On macOS, Linux or Unix: /home/<UserName>/.ssh/<KeyPairName>

Replace <UserName> with the name of the user you are currently signed in as, and replace <KeyPairName> with the name of your new key pair.

Then copy the public key in Windows

```
type C:\Users\Lucia> type C:\Users\<UserName>/.ssh/<KeyPairName>.pub
```

# Lightsail

Sign in to the Lightsail console.

Choose the Instances tab on the Lightsail home page.

Choose the browser-based SSH client icon for the instance that you want to connect to.

Choose the browser based SSH client
After you're connected, enter the following command to edit the authorized_keys file using the text editor of your choice.

```
sudo nano ~/.ssh/authorized_keys
```

Then copy your public key into your file at the end. 

Now ssh from local terminal to you instance using username and public IP address
   
```
ssh <user>@<IPAdress>
```
   
## Create new user
   
Once you are connected to the server. Run the command adduser to create your new user. Please note you can also use the natively binary compiled useradd command but it is less user-friendly than the Perl script adduser command.

So, on a terminal window, type the following:

   ```
   sudo adduser <username>
   ```
 
 Remember to replace username with the preferred name of your new user. For instance, if you want to add a new user called ‘wordpress’ the syntax should be:
 
   ```
   sudo adduser wordpress
   ```
 You will be prompted to enter a password for the new user, Full Name, Room number and phone details. You can press Enter if you don’t want to enter a value. 
   
Add the new user to the sudo group
Your new user above is created with regular privileges and if you try to run any sudo task, you will get an error like, “wordpress is not in the sudoers file.  This incident will be reported.” In order to allow the user to do administrative tasks e.g. rebooting the server, creating new users or installing applications, we need to run the command below:

   ```
   sudo usermod -aG sudo wordpress
   ```
   
Remember to replace “wordpress” with the username that you created above.Your new user should be successfully added to the sudo program.

TestSwitch to the new user
We can use the su command on our Ubuntu 18.04 server to switch to the new user that we created above; su is an acronym for substitute user. It allows the currently logged in user to change the session without having to logout first.

To do this, we run the command below:
   ```
   su - wordpress
   ```
   
5. Clone the repository to your instance using the following command:

   ```
   git clone https://github.com/cloudcompassconsulting/lightsail-wordpress-deployment.git
   ```

6. Navigate to the project directory using the following command:

   ```
   cd lightsail-wordpress-deployment
   ```

7. Run the init.sh script to install and configure WordPress:

   ```
   bash init.sh
   ```

8. Follow the prompts to enter your database credentials and configure your WordPress site.

9. Once the script has finished running, you can access your WordPress site by entering the instance's public IP address or domain name in your web browser.

## Customization

This project is designed to be easily customizable, allowing you to modify the WordPress installation to meet your specific needs. Some ways you can customize this project include:

- Modifying the init.sh script to install additional software or plugins
- Modifying the wp-config.php file to change the WordPress database configuration or other settings
- Adding custom themes or plugins to the WordPress installation

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Contributions

Contributions are welcome! If you find a bug or have a suggestion for improvement, please create an issue or submit a pull request.
