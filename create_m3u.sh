#!/usr/bin/env bash

cat data/channel.csv | sed -e "s/,/\x09/; s/^/#EXTINF:0,/; s/\x09/\\n/" > koditv-udp.m3u
cat data/channel.csv | sed -e "s/,/\x09/; s/^/#EXTINF:0,/; s/\x09/\\n/; s/rtp:\//http:\/\/iptv.lan:4022\/rtp/" > koditv-tcp.m3u

