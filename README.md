# Subfind
## Domain Asset Discovery Script

This Bash script facilitates domain asset discovery by leveraging the `assetfinder` and `httprobe` tools. It takes domain and file path as command line arguments and performs the following steps:

1. Checks if the domain argument is provided; otherwise, it displays an error message and usage instructions.
2. Executes the `assetfinder` command with the specified domain to find subdomains.
3. Sorts and removes duplicate subdomains.
4. Appends the results to the `output.txt` file using `tee`.
5. Uses `httprobe` to check the validity of the subdomains obtained.
6. Saves the working subdomains to the file provided as the 2nd argument using `grep`.

## INSTALLATION

```bash
git clone https://github.com/ChuckNorr1s/subfind.git
```
```bash
chmod +x subfind/setup.sh && subfind/setup.sh
```

## USAGE

To use this script, simply provide the domain and the file patht to save results to as command line arguments when executing the script. For example:

```bash
subfind example.com sub-domains.txt
```
