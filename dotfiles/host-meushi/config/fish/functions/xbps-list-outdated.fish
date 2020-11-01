complete -c xbps-list-outdated -f
function xbps-list-outdated
    xbps-install -Sun | cut -d' ' -f1
end
