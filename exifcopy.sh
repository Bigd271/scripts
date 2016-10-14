#!/bin/bash

#title           :exifcopy
#description     :This script will move photos and movies (.mov) to dated folders.
#author		 :dThiessen
#date            :2014-07-14
#version         :1.0   
#usage		 :bash exifcopy.sh 
#notes           :provide the source of the files, and the destination.
#==============================================================================

imgsource=""
dest=""

echo "Enter the root source directory with Photos and Video (.mov):"
read imgsource
echo "Enter the root destination directory where the dated folders will be created:"
read destination

exiftool '-Directory<CreateDate' -d ${destination}/%Y/%m/%d -r ${imgsource}
exiftool '-Directory<CreateDate' -ext MOV -d ${destination}/%Y/%m/%d -r ${imgsource}
exiftool '-Directory<CreateDate' -ext MP4 -d ${destination}/%Y/%m/%d -r ${imgsource}

# add "EHT" or "DCT" to the filenames to distinguish the photos and videos
#exiftool -d %%f_EHT.%%e -r "-filename<CreateDate" ${imgsource}
