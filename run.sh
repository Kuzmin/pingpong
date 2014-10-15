#!/bin/bash

# Run the experiment against

URL=http://my.host.com/ping

# Starts the experiment with following amount of users.
for USER in 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000
do

  # each requesting messages of length (in bytes)
  for LEN in 128, 256, 512, 768, 1024, 2048, 4096, 8192
  do

    # run each benchmark 10 times
    for round in 1..10
    do
      siege -c $USER -b -t 10s -l siege-$USER-$LEN.log $URL/$LEN
    done

  done

done
