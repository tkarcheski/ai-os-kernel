#!/bin/bash

# Check Rust version
echo "Checking Rust version..."
if ! command -v rustc &> /dev/null
then
    echo "Rust is not installed. Please install Rust: https://rustup.rs/"
    exit 1
fi
rustc_version=$(rustc --version | cut -d ' ' -f 2)
required_rust_version="1.50"
if [[ "$(printf '%s\n' "$required_rust_version" "$rustc_version" | sort -V | head -n1)" != "$required_rust_version" ]]; then
    echo "Rust version $required_rust_version or higher is required. You have $rustc_version."
    exit 1
else
    echo "Rust version check passed."
fi

# Check Git version
echo "Checking Git version..."
git_version=$(git --version | awk '{print $3}')
required_git_version="2.25"
if [[ "$(printf '%s\n' "$required_git_version" "$git_version" | sort -V | head -n1)" != "$required_git_version" ]]; then
    echo "Git version $required_git_version or higher is required. You have $git_version."
    exit 1
else
    echo "Git version check passed."
fi

# Check Python version
echo "Checking Python 3.12 version..."
python_version=$(python3 --version 2>&1 | awk '{print $2}')
required_python_version="3.12"
if [[ "$(printf '%s\n' "$required_python_version" "$python_version" | sort -V | head -n1)" != "$required_python_version" ]]; then
    echo "Python version $required_python_version or higher is required. You have $python_version."
    exit 1
else
    echo "Python version check passed."
fi

# Check ShellCheck version
echo "Checking ShellCheck version..."
if ! command -v shellcheck &> /dev/null
then
    echo "ShellCheck is not installed. Please install ShellCheck: https://www.shellcheck.net/"
    exit 1
fi
shellcheck_version=$(shellcheck --version | grep version | awk '{print $2}')
required_shellcheck_version="0.7.0"
if [[ "$(printf '%s\n' "$required_shellcheck_version" "$shellcheck_version" | sort -V | head -n1)" != "$required_shellcheck_version" ]]; then
    echo "ShellCheck version $required_shellcheck_version or higher is required. You have $shellcheck_version."
    exit 1
else
    echo "ShellCheck version check passed."
fi

# Set up pre-commit hooks
echo "Setting up pre-commit hooks..."
if ! pre-commit install &> /dev/null
then
    echo "pre-commit is not installed. Installing..."
    pip install pre-commit
    pre-commit install
else
    echo "pre-commit hooks installed."
fi

echo "Development environment check passed!"
