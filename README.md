# Graylog Install Scripts

## Introduction
I happen to use [Graylog Open](https://www.graylog.org/products/source-available/) in my homelab and although the setup process is very neatly documented on the website, I thought why not refine the steps and cook couple scripts and thus this repo was born. The idea behind this was to simply run a script and have a setup ready to be configured while saving some manual labour on terminal.

**Note** --> This script installs the latest version of OpenSearch. If you're looking to use ElasticSearch, please refer to the documentation links in [References](https://github.com/wand3rlust/Graylog-Install-Scripts#references) section.

## Installation

### OS Info
1. Lubuntu 22.04.2 LTS --> `wget https://cdimage.ubuntu.com/lubuntu/releases/22.04.2/release/lubuntu-22.04.2-desktop-amd64.iso`
		 
     SHA256 --> `0cc7faebb19949a9e6f754c9f04a86e6900afeabbf5f46574bedced6c98bd70d`
     
     
2. Ubuntu Server 22.04.2 LTS --> `wget https://releases.ubuntu.com/22.04.2/ubuntu-22.04.2-live-server-amd64.iso`
		 
     SHA256 --> `5e38b55d57d94ff029719342357325ed3bda38fa80054f9330dc789cd2d43931`
     
### Data Download 
1. MongoDB --> 145MB
2. Opensearch --> 748 MB
3. Graylog --> 339.6 MB
   
   **Total --> ~ 1232.6 MB**

### Lubuntu 22.04.2 LTS Installation
1. Installation is straightforward, download and add the ISO to your hypervisor of choice and follow the on-screen instructions. 
2. Launch the VM and click Installer on Desktop.
3. Then simply fill relevant information and click install.
4. After installation, reboot the VM and take a snapshot.
5. In the VM, run `wget https://github.com/wand3rlust/Graylog-Install-Scripts/blob/main/build-lubuntu.sh` to download the script. 
6. After script is downloaded, run `sudo chmod 744 build-lubuntu.sh` && `./build-lubuntu.sh`.
7. Sit back and relax, the script is designed to run automatically.
8. Although the script is tested serveral time and doesn't break anything, if something goes wrong, take note of error, restore the snapshot and comment concerned lines in script before running. Also please consider making open an issue/pull request here regarding the issue if cou can.

### Ubuntu Server 22.04.2 LTS Installation
1.  Installation is straightforward, download and add the ISO to your hypervisor of choice and follow the on-screen instructions. 
2.  During installation make sure to configure the networking when asked.
3.  Additionally you can select OpenSSH Server when prompted. This is so you can easily ssh into the server when required.
4.  After installation, reboot the VM and take a snapshot.
5.  If you decided to enable OpenSSH Server in step 3, here's a good article on SSH configurations from [DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-use-ssh-to-connect-to-a-remote-server). Additionally, you can also add the server IP to your local hosts file to further simplify the process.
6.  In the VM, run `wget https://github.com/wand3rlust/Graylog-Install-Scripts/blob/main/build-ubuntu.sh` to download the script.
7.  After script is downloaded, run `sudo chmod 744 build-ubuntu.sh` && `./build-ubuntu.sh`.
8.  The script might prompt serveral times to restart services, please do the needful.
9.  Although the script is tested serveral time and doesn't break anything, if something goes wrong, take note of error, restore the snapshot and comment concerned lines in script before running. Also please consider making open an issue/pull request here regarding the issue if cou can.

## Post Installation
Graylog website has very comprehensive documentation on the installation and setup portion and links are given [below](https://github.com/wand3rlust/Graylog-Install-Scripts#references).
### References
1. https://go2docs.graylog.org/5-1/what_is_graylog/what_is_graylog.htm
2. https://go2docs.graylog.org/5-1/downloading_and_installing_graylog/ubuntu_installation.html

## Contribution
To contribute simply fork this repo, make changes and create a pull request.

## Support
If you like this repo and the scripts proved useful, please consider giving a ⭐
