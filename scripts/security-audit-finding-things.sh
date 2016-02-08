set -e

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
  echo "------ Auditing $repo_name -------"
  bundle exec govuk_security_audit github alphagov $repo_name
done

# Panopticon runs an old Rails version, which depends on a vulnerable version of
# the `mail` gem. This is not an issue because we don't send email from Panopticon.
echo "------ Auditing panopticon -------"
bundle exec govuk_security_audit github alphagov panopticon --ignore OSVDB-131677
