#!/bin/sh
set -x

while true; do sleep 300; date; done &
timer_pid=$!

$@
result=$?

kill $timer_pid
wait

exit $result
