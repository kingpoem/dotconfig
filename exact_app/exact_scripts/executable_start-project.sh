#!/usr/bin/zsh
function s() {
  if [[ -f "Cargo.toml" ]]; then
    echo "Detected Rust project 🦀"
    cargo run
  elif [[ -f "CMakeLists.txt" ]]; then
    echo "Detected C++ project 💻"
    cmake -Bbuild && cmake --build build && ./build/main
  else
    echo "Unknown project type 🙀"
  fi
}

