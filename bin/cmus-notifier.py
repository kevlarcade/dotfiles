#! /usr/bin/env python3

import sys
from pathlib import Path
from gi.repository import Notify

def status_data(item):
    cmus_data = sys.argv[1]
    cmus_data = cmus_data.split()
    collector = []
    cmus_info = {'status': "",
                 'file': "",
                 'artist': "",
                 'album': "",
                 'discnumber': "",
                 'tracknumber': "",
                 'title': "",
                 'date': "",
                 'duration': ""}

    last_found = "status"
    for value in cmus_data:
        collector.append(value)
        for key in cmus_info:
            if key == value:
                collector.pop()
                cmus_info[last_found] = " ".join(collector)
                collector = []
                last_found = key

    return cmus_info[item]


if status_data("status") == "playing":

    filePath = Path(status_data("file"))
    artPath = '/usr/share/icons/Paper/512x512/apps/multimedia-audio-player.png'

    if filePath.with_name('cover.jpg').exists():
        artPath = filePath.with_name('cover.jpg').as_posix()
    elif filePath.with_name('cover.png').exists():
        artPath = filePath.with_name('cover.png').as_posix()

    if status_data("title") != "":
        notify_summary = status_data("title")
    else:
        notify_summary = "Unknown"

    if status_data("album") != "":
        notify_body = status_data("artist") + '\n<i>' + \
                     status_data("album") + '</i>'
    else:
        notify_body = '<b>' + status_data("artist") + '</b>'

    Notify.init('cmus status display')
    this_popup = Notify.Notification.new(notify_summary,
                                         notify_body,
                                         artPath)
    this_popup.set_urgency(0)
    this_popup.set_timeout(600)
    this_popup.show()
