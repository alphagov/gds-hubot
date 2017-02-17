((error_count=0))
on_error() {
  ((error_count++))
}

output=""
check_repo() {
  trap on_error ERR
  repo_name=$1
  shift
  results=$(bundle exec govuk_security_audit github alphagov "${repo_name}" $@)
  if [ $? -ne 0 ]; then
    output=$(printf "%s\n%s\n%s" "${output}" "------ Auditing ${repo_name} -------" "${results}")
  fi
}

repos=(
  business-support-finder
  collections
  collections-publisher
  content-tagger
  email-alert-api
  email-alert-service
  finder-frontend
  policy-publisher
  rummager
  search-admin
)

for repo_name in "${repos[@]}"; do
  check_repo "${repo_name}"
done

if [ $error_count == 0 ]; then
  output="No vulnerabilities found!"
fi

printf "Found %s repos with issues:\n%s\n" "${error_count}" "${output}"
exit $error_count
