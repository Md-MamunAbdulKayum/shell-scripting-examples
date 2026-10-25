# shell-scripting-examples

Bash/shell examples for everyday scripting: variables, loops, functions, files, HTTP, JSON, databases, and cloud CLIs.

Visit [Note Arena Linux Tutorials](https://notearena.com/course/linux/) for examples with descriptions.

## Basics

| Topic | Script |
|--------|--------|
| Comments | `comment_ex.sh` |
| Variables | `variable_eample.sh` |
| Script parameters | `file_params.sh` |
| if / elif / else | `if_elif_else.sh` |
| for / while | `for_while.sh` |
| Pipes | `pipe_ex.sh` |
| Date | `date_ex.sh` |
| Functions | `function.sh`, `function_sum*.sh` |
| Ternary / defaults | `ternary_operator_ex/test_ternary.sh` |

## Files

| Topic | Script |
|--------|--------|
| Read lines from a file | `file_manipulation/reader.sh` |
| Write lines to a file | `file_manipulation/writer.sh` |
| Java `.properties` | `read-properties-file/read_properties_file.sh` |

## HTTP & APIs

| Topic | Script |
|--------|--------|
| curl recipes | `curl_command/curl_command_examples.sh` |
| curl + jq (auth token) | `curl_command/curl_command_examples_get_token.sh` |

## JSON & jq

| Topic | Script |
|--------|--------|
| jq parse, filter, build JSON | `jq/jq_examples.sh` (+ `jq/sample.json`) |
| Read JSON (jq + Python) | `json/read_json_examples.sh` |
| Heredoc payloads & validation | `json/json_heredoc_and_files.sh` |

Requires [jq](https://jqlang.org/) for jq examples; Python section uses `python3` when available.

## Cloud

| Topic | Script |
|--------|--------|
| AWS CLI | `cloud/aws_cli_examples.sh` |
| Google Cloud (`gcloud` / `gsutil`) | `cloud/gcloud_cli_examples.sh` |
| Azure CLI | `cloud/azure_cli_examples.sh` |
| Instance metadata (AWS / GCP / Azure) | `cloud/cloud_metadata_examples.sh` |

CLI scripts keep commands **commented** so they are safe to open and run locally; uncomment when your credentials and resources are configured.

## Database

| Topic | Script |
|--------|--------|
| MySQL / MariaDB via config | `access-mysql-mariabd/perform_db_operation.sh`, `test.sh` |

## Quick run

```bash
chmod +x jq/jq_examples.sh
./jq/jq_examples.sh
```

On Windows, use Git Bash or WSL; use LF line endings for `.sh` files.
