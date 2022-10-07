#!/bin/bash

while true
do
	curl http://localhost:8080/sample/hello
	sleep $(( RANDOM % 5 ))
done
