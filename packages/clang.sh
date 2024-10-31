#!/usr/bin/env bash
bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
sudo apt install -y clang-format-18 clang-tidy-18 clang-tools-18
