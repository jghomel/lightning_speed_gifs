#Dependcies: 
#youtube-dl
#ffmpeg 
#drop to gif 

open /Applications/Drop\ to\ GIF.app
echo Enter youtube link:
read yt_link
echo Enter start time HH:MM:SS[.xxx]:
read start_time
echo Enter desired duration HH:MM:SS[.xxx]:
read end_time
echo enter desired quality among following:
youtube-dl -F $yt_link
read quality

final_link="$(youtube-dl -f "$quality" -g "$yt_link")"
file_name="$(youtube-dl --get-filename -o "%(title)s.%(ext)s" "$yt_link")"
ffmpeg -ss "$start_time" -i "$final_link" -to "$end_time" -c copy ~/Documents/automatic_gif_repo/"$file_name"
