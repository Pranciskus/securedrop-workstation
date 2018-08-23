# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

##
# sd-journalist-files
# ========
#
# Moves files in to place
#
##

mkfifo /home/user/sdfifo:
  cmd.run

chmod 666 /home/user/sdfifo:
  cmd.run

/usr/local/bin/move-to-svs:
  file.managed:
    - source: salt://sd/sd-journalist/move-to-svs
    - user: root
    - group: root
    - mode: 755

/usr/local/bin/sd-process-download:
  file.managed:
    - source: salt://sd/sd-journalist/sd-process-download
    - user: root
    - group: root
    - mode: 755

/usr/local/bin/do-not-open-here:
  file.managed:
    - source: salt://sd/sd-journalist/do-not-open-here
    - user: root
    - group: root
    - mode: 755

/usr/local/bin/sd-process-feedback:
  file.managed:
    - source: salt://sd/sd-journalist/sd-process-feedback
    - user: root
    - group: root
    - mode: 755

/usr/local/bin/sd-process-display:
  file.managed:
    - source: salt://sd/sd-journalist/sd-process-display
    - user: root
    - group: root
    - mode: 644
    
/usr/local/bin/pipereader.py:
  file.managed:
    - source: salt://sd/sd-journalist/pipereader.py
    - user: root
    - group: root
    - mode: 755

/rw/config/rc.local:
  file.managed:
    - source: salt://sd/sd-journalist/rc.local
    - user: root
    - group: root
    - mode: 755

/rw/config/etc/qubes-rpc/sd-process.Feedback:
  file.managed:
    - source: salt://sd/sd-journalist/sd-process.Feedback
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/usr/local/share/applications/sd-process-download.desktop:
  file.managed:
    - source: salt://sd/sd-journalist/sd-process-download.desktop
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

/usr/local/share/applications/do-not-open.desktop:
  file.managed:
    - source: salt://sd/sd-journalist/do-not-open.desktop
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

/usr/local/share/sd/logo-small.png:
  file.managed:
    - source: salt://sd/sd-journalist/logo-small.png   
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

/home/user/.config/mimeapps.list:
  file.managed:
    - source: salt://sd/sd-journalist/mimeapps.list
    - user: user
    - group: user
    - mode: 644
    - makedirs: True

sudo update-desktop-database /usr/local/share/applications:
  cmd.run

# Required for sd-process-feedback GUI integration
python-qt4:
  pkg.installed
