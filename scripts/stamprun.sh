#!/usr/bin/env bash
set -m

while true; do sleep 300; date; done >&2 &
timer_pid=$!

$@
result=$?

kill $timer_pid
wait

exit $result
