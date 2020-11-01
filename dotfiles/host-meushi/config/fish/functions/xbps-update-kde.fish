complete -c xbps-update-kde -f
function xbps-update-kde
    sudo xbps-query -Rx kde5 | cut -d'>' -f1 | xargs xbps-install -yu
    sudo xbps-query -Rx plasma-desktop | cut -d'>' -f1 | xargs xbps-install -yu
end
