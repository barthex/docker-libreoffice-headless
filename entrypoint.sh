#!/bin/sh

/usr/bin/libreoffice --nologo --norestore --invisible --nolockcheck --nodefault --headless --nofirststartwizard --accept="socket,host=0.0.0.0,port=8100;urp"
if [ -d "/tmp/hsperfdata_root" ]; then
	rm -rf /tmp/hsperfdata_root
fi
