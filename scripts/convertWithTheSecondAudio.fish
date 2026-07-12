#!/usr/bin/env fish

# the structure of the script
# as the arguments take:
# $1 -> directory with the files
# $2 -> where to save to

if test (count $argv) -lt 2
   echo "Usage: .<path to>/convertWithSecondAudioTrack.fish <absolute path to the src> <absolute path to the save>"
end

set path $argv[1]
set nameOfDir $argv[2]

function extractSecondAudio -a videoFile 
	 ffmpeg -i $videoFile -map 0:a:1 -c:a copy (path basename -E $videoFile).ac3
end

function replaceAudio -a audioFile videoFile 
	 ffmpeg -i $videoFile -i $audioFile -c:v copy -c:a aac -b:a 192k -map 0:v:0 -map 1:a:0 (path basename -E $videoFile).mp4
end

cd $path 
for thisFile in (ls)
    echo $PWD/$thisFile
    mkdir $thisFile"+temp" && mv $thisFile $thisFile"+temp" && cd $thisFile"+temp"
    extractSecondAudio $thisFile
    ls
    replaceAudio (path basename -E $thisFile).ac3 $thisFile
    mv (path basename -E $thisFile).mp4 $nameOfDir
    rm $thisFile (path basename -E $thisFile).ac3
    cd ..
    rm -r $thisFile"+temp"
end
