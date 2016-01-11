---
layout: post
title:  "Docker on Mac OS X: 'No space left on device' error"
date:   2015-11-08 21:03:00
categories: ['docker']
---
After using Docker with boot2docker or Docker Machine for some time, you may find yourself facing an error "No space left on device" appearing in your output from commands like `docker-compose build`. When you check how much space you have currently available on your Mac, you may notice that you've got plenty of disk capacity. So where is this error coming from?

boot2docker and Docker Machine both utilise a Linux VM image that runs on your Mac operating system. Because Docker only runs on Linux, this enables you to use Docker commands in a terminal as if you were running on a Linux machine. The Docker commands you type are sent to a Docker process running inside the Linux VM.

When you receive error messages in your output from your Docker commands, they are usually errors related to the local Linux VM environment that your Docker commands have been sent to. The 'no space left on device' error is one such example. It means that the VM image used by Docker has run out of disk space.

Everytime you perform a change to your application that uses Docker, you will collect old Docker images. Docker creates a new image that contains your changes, and then untags the existing image. These untagged images hang around on the Linux VM image and over time, the images consume all of the disk space on the VM image.

Docker usage that can increase the speed at which your disk capacity gets eaten up include:

* Running `docker-compose build` several times per day as a part of your regular development workflow.
* Developing on multiple projects simultaneously, or switching between projects regularly within a week of development.
* Having multiple software projects that use many different variations of "FROM" images. Examples may include many Ruby projects with "FROM" images that include "FROM ruby", "FROM ruby:2.1", "FROM ruby:2.2", etc.
* When you're working on a platform that utilises microservices, you will likely be seeing or doing every one of the above points. This makes the disk space problem more prevalent than usual.

## The Fix

An easy fix to get you back up and running again is to run the following command:

    docker rmi -f $( docker images | grep '<none>' | tr -s ' ' | cut -d ' ' -f 3)

This will obtain a list of images that are currently tagged as "<none>" (effectively untagged) and pass them to `docker rmi -f` which will delete the image. One of the advantages of using Docker is that images can generally be deleted with minimal risk. If you accidently delete something you needed, just run a `docker-compose build` again from your project directory and you'll be up and running again.