complete -c drivesync -f
function drivesync
    cd $HOME/GDrive
    drive pull -no-prompt -quiet
    if [ $status -ne 0 ]
        cd -
        return 1
    end
    drive push -no-prompt -quiet
    cd -
end