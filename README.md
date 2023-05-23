## Domain Asset Discovery Script

This Bash script facilitates domain asset discovery by leveraging the `assetfinder` and `httprobe` tools. It takes a domain as a command line argument and performs the following steps:

1. Checks if the domain argument is provided; otherwise, it displays an error message and usage instructions.
2. Executes the `assetfinder` command with the specified domain to find subdomains.
3. Sorts and removes duplicate subdomains.
4. Appends the results to the `output.txt` file using `tee`.
5. Uses `httprobe` to check the validity of the subdomains obtained.
6. Appends the working subdomains to the `works.txt` file using `tee`.

To use this script, simply provide the domain as a command line argument when executing the script. For example:

```bash
./subfinder.sh example.com
