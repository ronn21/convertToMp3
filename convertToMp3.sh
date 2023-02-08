#!/bin/bash
type=".mkv .avi flv mp4"
clear

echo -e "  Convert all files $type to flac or mp3 ";
echo -e "  Chose existension for audio ";
echo -e "  press  1  for  flac;"
echo -e "  press  2  for  mp3;"
read text
if [ $text == "1" ]; then
echo " convert to flac"
echo
for ext in mkv avi mp3 flv mp4; do
    for file in *.$ext; do
         ffmpeg -vn -i "$file" "${file%.*}.flac"
             done
done
elif [ $text == "2" ]; then 
echo                                                            mp3
echo
for ext in mkv avi webm flv mp4; do
    for file in *.$ext; do
        ffmpeg -i "$file" -map 0:1 -vcodec copy -acodec libmp3lame -ab 192k -ar 48000 -ac 2 "${file%.*}.mp3"
    done
done

else exit
fi

