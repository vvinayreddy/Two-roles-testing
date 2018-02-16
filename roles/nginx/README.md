nginx
========

Ansible role which installs nginx.

Requirements
------------

Tested on Anbsible 1.6

Role Variables
--------------
    nginx_online_install: true          # Whether or not to perform an online installation by downloading the installer
    nginx_installer_path: /var/red      # Where to find the installer for an offline installation
    nginx_version: 1.2.6                # The version of nginx to install
    nginx_base_install_dir: /apps       # Where nginx will be installed
    nginx_base_logs_dir: /logs          # Where the nginx log directory will be created
    nginx_base_data_dir: /data          # Where the nginx data directory will be created

Dependencies
------------

None

Example Playbook
-------------------------

    - hosts: all
      sudo: yes
      roles:
         - nginx



Author Information
------------------

Mantri Goutam @gautam.mantri@gmail.com
