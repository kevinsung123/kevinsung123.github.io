#!/bin/bash
git log --pretty=format:"%h -%an,  %cd (%ar) : %s" --graph
