#!/bin/bash
awk -F\" {'print $4'} $1
