#!/usr/bin/env bash

cat data/channel.csv | sed -e "s/rtp:\//http:\/\/iptv.lan:4022\/rtp/" > hdp.txt

