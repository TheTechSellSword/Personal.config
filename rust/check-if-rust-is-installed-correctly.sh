#!/bin/bash

if rustc --version; then
    echo "Rust installed correctly."
else
    echo "Configuring current shell."
    # To configure your current shell, run:
    source "$HOME/.cargo/env"
fi