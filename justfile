#!/usr/bin/env just --justfile

set shell := ["bash", "-c"]

serve:
    zola serve
