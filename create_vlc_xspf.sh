#!/usr/bin/env bash

cat data/channel.csv | awk -F ',' '
BEGIN {
	OFS=""
	i=0
	print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
	print "<playlist xmlns=\"http://xspf.org/ns/0/\" xmlns:vlc=\"http://www.videolan.org/vlc/playlist/ns/0/\" version=\"1\">"
	print "\t<title>Playlist</title>"
	print "\t<trackList>"
} 

{
	gsub("rtp:/", "http://iptv.lan:4022/rtp", $2)
	print "\t\t<track>"
	print "\t\t\t<title>", $1, "</title>"
	print "\t\t\t<location>", $2, "</location>"
	print "\t\t\t<extension application=\"http://www.videolan.org/vlc/playlist/0\">"
	print "\t\t\t\t<vlc:id>", i, "</vlc:id>"
	print "\t\t\t</extension>"
	print "\t\t</track>";
	i=i+1;
}

END {
	print "\t</trackList>\n";
	print "\t<extension application=\"http://www.videolan.org/vlc/playlist/0\">";
	for (j=0; j<=i; j++) {
		print "\t\t<vlc:item tid=\"", j, "\"/>";
	}
	print "\t</extension>";
	print "</playlist>";
}
' > vlc-tcp.xspf

