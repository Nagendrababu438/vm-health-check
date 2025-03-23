This repository is empty. Any task executed on it should be considered a new capability and needs to be created.

# Health Check Script

This repository contains a shell script named `health_check.sh` that analyzes the health of a virtual machine based on CPU, memory, and disk space usage. The script declares the state of the VM as "healthy" if all three parameters are below 60%. If any one of the parameters is 60% or higher, the script declares the VM as "not healthy".

## Usage

To use the `health_check.sh` script, follow these steps:

1. Clone the repository:
   ```
   git clone https://github.com/githubnext/workspace-blank.git
   ```
2. Navigate to the repository directory:
   ```
   cd workspace-blank
   ```
3. Make the script executable:
   ```
   chmod +x health_check.sh
   ```
4. Run the script:
   ```
   ./health_check.sh
   ```

## Command Line Argument

The script supports a command line argument named "explain". When passed, the script explains the reason for the health status along with printing the health status.

### Example

Running the script without the "explain" argument:
```
./health_check.sh
```

Output:
```
Health status: healthy
```

Running the script with the "explain" argument:
```
./health_check.sh explain
```

Output:
```
CPU usage: 45.5%
Memory usage: 50.2%
Disk usage: 55%
Health status: healthy
```

## Step-by-Step Documentation

1. **Clone the Repository**: First, you need to clone the repository to your local machine using the following command:
   ```
   git clone https://github.com/githubnext/workspace-blank.git
   ```

2. **Navigate to the Repository Directory**: Change your current directory to the repository directory:
   ```
   cd workspace-blank
   ```

3. **Make the Script Executable**: Before running the script, you need to make it executable:
   ```
   chmod +x health_check.sh
   ```

4. **Run the Script**: You can run the script without any arguments to check the health status of the VM:
   ```
   ./health_check.sh
   ```

5. **Run the Script with "explain" Argument**: If you want to know the reason for the health status, you can run the script with the "explain" argument:
   ```
   ./health_check.sh explain
   ```

6. **Check the Log File**: The script logs the health status and reasons to a file named `health_check.log`. You can check the log file to see the history of health checks:
   ```
   cat health_check.log
   ```
