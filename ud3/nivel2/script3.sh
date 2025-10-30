#!/bin/env bash

num=10
while [ "$num" -gt 0 ]; do
  echo "$num"
  ((num--))
done
