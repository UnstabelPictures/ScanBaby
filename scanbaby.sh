#!/bin/bash
# this is a program designed to SCAN & UPLOAD a long series of files
echo welcome to SCANBABY
echo
year=$(date +"%Y")
thedate=$(date +"%m-%d-%Y__%H%M")
filepath="/media/pi/scanbaby/files/"$year
numbercount=1
filename=$thedate"__"$numbercount".jpg"
echo "Which location would you like to scan shit to?"
select scanbabe in "mail" "receipt" "maddy" "other" "quit"
do

case $scanbabe in

mail)
echo "MAIL scanning"
cd $filepath/mail
scanimage > $filename
echo "all scanned now let me upload dat"
rclone copy ./$filename remote:003\ Parental/Scanned\ items/$year/mail
((numbercount++))
echo
echo "awesome dude, what else should we scan!"
;;

receipt)
echo "alright lets scan that capitalist trash"
cd $filepath/receipt
scanimage > $filename
echo "ookay lets post that capitalist trash to the interwebs"
echo
rclone copy ./$filename remote:003\ Parental/Scanned\ items/$year/receipt
((numbercount++))
echo "awesome dude, what else should we scan!"

;;

maddy)
echo "oh shit helping maddy"
echo
echo "SCANNING"
cd $filepath/maddy
scanimage > $filename
echo
echo "ok i will upload it now"
rclone copy ./$filename remote:003\ Parental/Scanned\ items/$year/maddy
((numbercount++))
echo
echo "awesome dude, what else should we scan!"

;;

other)
echo "what even is this crap"
echo "okay ill scanning it but if i get an std ill be so pissed"
cd $filepath/other
scanimage > $filename
echo
echo "not too bad"
echo "uploading now"
echo
rclone copy ./$filename remote:003\ Parental/Scanned\ items/$year/other
((numbercount++))
echo "awesome dude, what else should we scan!"

;;
quit)
echo "eat shit"
break
;;

*)
break
;;


esac
done
return
