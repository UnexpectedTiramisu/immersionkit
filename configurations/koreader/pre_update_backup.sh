#!/bin/bash

# I am always scared of updating KOReader without having a backup of my working version.
# This script creates a tar archive of koreader/ and downloads it.
# This is written for a jailbroken Kindle.

ssh root@your-device -p 2222 'tar -czf /mnt/us/backup-$(date +%Y-%m-%d).tar.gz -C /mnt/us koreader'
scp -P 2222 root@your-device:/mnt/us/backup-$(date +%Y-%m-%d).tar.gz ~/Documents/Code/kindle/backup_from_kindle/