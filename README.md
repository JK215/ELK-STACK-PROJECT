# Jonathan_Kennedy_Elk_Stack_Project

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Red-Team Network Diagram](https://drive.google.com/file/d/17NKLqswz-N8fdtfTnh6H2EY_xaa1ciMb/view?usp=sharing)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the **Filebeat_Playbook.txt** file may be used to install only certain pieces of it, such as Filebeat.

[Playbook & Configuration Files](https://github.com/JK215/Jonathan_Kennedy_Elk_Stack_Project/tree/master/Ansible)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly **available**, in addition to **restricting** access to the network.
What aspect of security do load balancers protect?

**Load balancers help to eliminate single points of failure, reduce the attack surface by protecting applications from emerging threats via a Web Application Firewall (WAF), and make it harder to exhaust resources, as used in DDos attacks.**  

What is the advantage of a jump box? 

**A jumpbox is a secure computer or vm that admins can first connect to before launching any adminstrative task.  It can also be used as an origination point to connect to other servers or untrusted environments.**

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the **files and system logs.**

What does Filebeat watch for?

**Filebeat monitors the log files or locations that a user specifies, collects log events, and forwards them either to Elasticsearch or Logstash for indexing**

What does Metricbeat record?

**Metricbeat records metrics from the system and services running on the machine being monitored**

The configuration details of each machine may be found below.


| Name       | Function   | IP Address | Operating System |
|------------|------------|------------|------------------|
| Jumpbox    | Gateway    | 10.0.0.4   | Linux            |
| DVWA-VM1   | Pentesting | 10.0.0.5   | Linux            |
| Elk-Server | Monitoring | 10.0.0.6   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the **Host(JumpBox)** machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
**100.11.74.65**

Machines within the network can only be accessed by **SSH.**

Which machine did you allow to access your ELK VM? 
**Jumpbox (IP=10.0.0.4)**

A summary of the access policies in place can be found in the table below.

| Name       | Publicly Accessible | Allowed IP Address    |
|------------|---------------------|-----------------------|
| Jumpbox    | Yes                 | 100.11.74.65          |
| DVWA-VM1   | No                  | 10.0.0.4              |
| Elk-Server | Yes                 | 10.0.0.4/100.11.74.65 |


Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...  
What is the main advantage of automating configuration with Ansible?

**Ansible is free and easy to use and by automating configuration thru ansible one saves valuable time and resources.**

The playbook implements the following tasks:

- **Add Elk Server to Ansible Configuration file**
- **Install elk_playbook.yml file**
- **Run newly created playbook file**
- **Run the "sudo docker ps" to ensure Elk is loaded and enabled**

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

[Elk Server Data](https://github.com/JK215/Jonathan_Kennedy_Elk_Stack_Project/blob/master/Images/Elk_Server_Data.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
**DVWA-VM1 (IP=10.0.0.5)**

We have installed the following Beats on these machines:
**Filebeat & Metricbeat**

These Beats allow us to collect the following information from each machine:
- **Filebeat monitors the log files or locations that you specify, collects log events, and forwards them to either Elasticsearch or Logstash for indexing. Filebeat can be used to monitor user login successes or failures or changes that have been made to the system.**

- **Metricbeat collects metrics from the operating system and other services running on the server. Metricbeat can show statistics on CPU usage, memory, and networks.**

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the **source file to destination.**
- Update the **configuration file to include the IP of the Elk-server**
- Run the playbook, and navigate to **Elk-server** to check that the installation worked as expected.

Which file is the playbook? Where do you copy it?

**The playbook is metricbeat.yml.  This file is copied to /etc/metricbeat/metricbeat.yml on the ELK server**

Which file do you update to make Ansible run the playbook on a specific machine?

**The ansible-configuration file is updated to make Ansible run the playbook on a specific machine.**

How do I specify which machine to install the ELK server on versus which to install Filebeat on?

**In the configuration file you specify [elkservers] and the ELK server IP address. Filebeat points to the [webservers] IP address.**

Which URL do you navigate to in order to check that the ELK server is running?

**http://(public IP of ELK server):5601**


