filename=c1p18.txt

log_traceroute() {
    h0stn4me=$1
    date >> ${filename} 
    traceroute ${h0stn4me} >> ${filename} 2>&1
}

log_traceroute cliffsofmoher.ie
log_traceroute gw.umass.edu