# Input Jira issue JSON file
JIRA_FILE="issue-repsonse.json"

# Check if file exists
if [[ ! -f "$JIRA_FILE" ]]; then
  echo "Error: $JIRA_FILE not found."
  exit 1
fi

# Extract subtask issue keys as a JSON array
subtasks=$(./jq.exe '[.fields.subtasks[]?.key]' "$JIRA_FILE")

# Output result
echo "Subtask Issue Keys: $subtasks"
