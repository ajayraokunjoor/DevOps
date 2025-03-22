https://roadmap.sh/projects/server-stats

# System Monitoring Script

This Bash script provides a quick overview of system resource usage on a Linux machine. It displays CPU, memory, and disk usage, as well as the top 5 processes consuming the most CPU and memory. It also includes optional information about the OS version, uptime, load average, and logged-in users.

## Usage

1.  **Save the script:** Save the provided code to a file, for example, `system_monitor.sh`.
2.  **Make the script executable:** Open a terminal and run the following command to make the script executable:

    ```bash
    chmod +x system_monitor.sh
    ```

3.  **Run the script:** Execute the script from your terminal:

    ```bash
    ./system_monitor.sh
    ```

## Output

The script will output the following information:

* **CPU Usage:** The total CPU usage percentage.
* **Memory Usage:** The used and free memory in human-readable format, along with the percentage of used memory.
* **Disk Usage:** The used and free disk space for the root partition (`/`), along with the percentage of disk usage.
* **Top 5 Processes by CPU Usage:** A list of the top 5 processes sorted by CPU usage, including their PID, user, CPU percentage, and command.
* **Top 5 Processes by Memory Usage:** A list of the top 5 processes sorted by memory usage, including their PID, user, memory percentage, and command.
* **OS Version (Optional):** The operating system version information.
* **Uptime (Optional):** The system uptime.
* **Load Average (Optional):** The system load average.
* **Logged-in Users (Optional):** A list of currently logged-in users.

## Dependencies

This script relies on the following standard Linux utilities:

* `bash`
* `top`
* `free`
* `df`
* `ps`
* `head`
* `grep`
* `awk`
* `lsb_release` (optional - for OS version)
* `uptime` (optional - for uptime and load average)
* `who` (optional - for logged-in users)

These utilities are typically pre-installed on most Linux distributions.

## Example Output
