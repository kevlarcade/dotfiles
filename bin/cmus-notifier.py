#! /usr/bin/env python2

import sys
import time
import subprocess

def print_usage():
   """Display usage info and exit."""

   print ' ##############################################################################'
   print ' # Usage:                                                                     #'
   print ' #  1. Copy cmus_desktop_notify.py to ~/.cmus/ and make executable.           #'
   print ' #  2. Create ~/.cmus/status_display_program.sh with these contents           #'
   print ' #     and make executable (remove spaces and border):                        #'
   print ' #                                                                            #'
   print ' #     #!/bin/sh                                                              #'
   print ' #     ~/.cmus/cmus_desktop_notify.py "$*" &                                  #'
   print ' #                                                                            #'
   print ' #  3. Set the status_display_program variable in cmus (with YOUR homedir!)   #'
   print ' #                                                                            #'
   print ' #     :set status_display_program=/home/user/.cmus/status_display_program.sh #'
   print ' #                                                                            #'
   print ' #  4. Enjoy desktop notifications from cmus! Be sure to :save.               #'
   print ' ##############################################################################'
   sys.exit(2)

def status_data(item):
   """Return the requested cmus status data."""

   # We loop through cmus status data and use each of its known data
   # types as 'delimiters', collecting data until we reach one,
   # inserting it into the dictionary -- rinse and repeat.

   # cmus helper script provides our data as argv[1].
   cmus_data = sys.argv[1]

   # Split the data into an easily-parsed list.
   cmus_data = cmus_data.split()

   # Our temporary collector list.
   collector = []

   # Dictionary that will contain our parsed-out data.
   cmus_info = {'status':"",
                'file':"",
                'artist':"",
                'album':"",
                'discnumber':"",
                'tracknumber':"",
                'title':"",
                'date':"",
                'duration':""}

   # Loop through cmus data and write it to our dictionary.
   last_found = "status"
   for value in cmus_data:
       collector.append(value)
       # Check to see if cmus value matches dictionary key.
       for key in cmus_info:
           # If a match has been found, record the data.
           if key == value:
               collector.pop()
               cmus_info[last_found] = " ".join(collector)
               collector = []
               last_found = key

   # Return whatever data main() requests.
   return cmus_info[item]

def display_song():
   """Display the song data using notify-send."""

   # We only display a notification if something is playing.
   if status_data("status") == "playing":

       # Generate thumbnail
       subprocess.call('ffmpeg -i "' + status_data("file") + '" -an -y -vcodec copy /tmp/cmus_art.png', shell=True)
       subprocess.call('mogrify -resize 100x100 /tmp/cmus_art.png', shell=True)
       subprocess.call('mogrify /tmp/cmus_art.png -format png', shell=True)
       # Check to see if title data exists before trying to display it.
       # Display "Unknown" otherwise.
       if status_data("title") != "":
           notify_summary = status_data("title")
       else:
           notify_summary = "Unknown"

       # Check to see if album data exists before trying to
       # display it. Prevents "Artist, " if it's blank.
       if status_data("album") != "":
           notify_body = status_data("artist") + '\n<i>' + \
                         status_data("album") + '</i>'
       else:
           notify_body = '<b>' + status_data("artist") + '</b>'

       # Create our temporary file if it doesn't exist yet.
       open("/tmp/cmus_desktop_last_track", "a").write("4")

       # Check to see when we got our last track from cmus.
       last_notice = open("/tmp/cmus_desktop_last_track", "r").read()

       # Write time stamp for current track from cmus.
       last_notice_time = str(time.time())
       open("/tmp/cmus_desktop_last_track", "w").write(last_notice_time)

       # Calculate seconds between track changes.
       track_change_duration = round(time.time() - float(last_notice))

       # Display current track notification only if a second has
       # elapsed since last track was chosen.
       if track_change_duration > 0:
           # Execute notify-send with our default song data.
           subprocess.call('notify-send -i "/tmp/cmus_art.png" -u low -t 1000 "' + \
                           notify_summary + '" "' + \
                           notify_body + ' "', shell=True)

def main():
   try:
       # See if script is being called by cmus before proceeding.
       if sys.argv[1].startswith("status"):
           display_song()
   except:
       print_usage()

if __name__ == "__main__":
   main()
