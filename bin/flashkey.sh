#! /bin/bash
DELAY=.1
for i in $(seq $1 -1 1); do
	for i in $(seq 0 3); do
		sudo asus-kbd-backlight $i
		sleep $DELAY
	done
	for i in $(seq 3 -1 0); do
		sudo asus-kbd-backlight $i
		sleep $DELAY
	done
done
