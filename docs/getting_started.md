# Getting Started Guide

## Prerequisites

Before starting development on the AI OS Kernel, ensure the following tools are installed on your system:

### 1. **Rust**
   - Install Rust and its build system **Cargo**.
   - You can install Rust with the following command:
     ```bash
     curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
     ```
   - Check the Rust version:
     ```bash
     rustc --version
     ```
   - Required version: `>= 1.50`

### 2. **Git**
   - Ensure Git is installed for version control.
   - Check the version:
     ```bash
     git --version
     ```
   - Required version: `>= 2.25`

### 3. **Pre-commit Hooks**
   - We use **pre-commit** for ensuring code quality checks.
   - Install pre-commit via pip:
     ```bash
     pip install pre-commit
     ```
   - Set up the pre-commit hook:
     ```bash
     pre-commit install
     ```

### 4. **ShellCheck**
   - Install **ShellCheck** to lint shell scripts.
   - Installation instructions can be found [here](https://www.shellcheck.net/).
   - Required version: `>= 0.7.0`

### 5. **Python (for pre-commit)**
   - Ensure **Python 3.12** is installed for running pre-commit hooks.
   - Check the version:
     ```bash
     python3 --version
     ```
   - Required version: `>= 3.12`

## Development Workflow

1. **Clone the repository:**
   ```bash
   git clone https://github.com/tkarcheski/ai-os-kernel.git
   cd ai-os-kernel
   ```

2. **Run the setup script** to ensure your environment is configured correctly:
   ```bash
   ./check_dev.sh
   ```

3. **Pre-commit Hooks**: The pre-commit hook is automatically set up on clone. Run it manually to ensure your code passes the checks:
   ```bash
   pre-commit run --all-files
   ```

4. **Build the project**:
   ```bash
   cargo build
   ```

5. **Run tests**:
   ```bash
   cargo test
   ```
```
