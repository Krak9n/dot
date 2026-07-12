#!/usr/bin/env fish

set srcDir $argv[1]
set dstDir $argv[2]

if test (count $argv) -lt 2
    echo "has to be longer than two dude"
    exit 1
end

for i in (ls $srcDir);
    for j in (find $srcDir$i -type f)
        echo "$j"
        set ext (string split -r -m1 '.' $j)[-1]
        mkdir -p $dstDir/$ext
        sudo mv $j $dstDir/$ext/
        echo "yes" | sudo rm -rf $i
    end
end
