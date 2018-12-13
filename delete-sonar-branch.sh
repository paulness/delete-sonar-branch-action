#!/bin/sh

set -e

[ -z "$SONAR_URL" ] && {
	echo >&2 "Environment variable SONAR_URL is unset"
	exit 1
}
[ -z "$SONAR_TOKEN" ] && {
	echo >&2 "Environment variable SONAR_TOKEN is unset"
	exit 1
}
[ -z "$SONAR_PROJECT" ] && {
	echo >&2 "Environment variable SONAR_PROJECT is unset"
	exit 1
}
[ -z "$GITHUB_REF" ] && {
	echo >&2 "Environment variable GITHUB_REF is unset"
	exit 1
}

GITHUB_BRANCH="$(echo "$GITHUB_REF" | cut -c 12-)"
echo "Deleting Sonar branch $GITHUB_BRANCH from project $SONAR_PROJECT"

curl -u "$SONAR_TOKEN": \
	--silent --show-error --fail \
	-X POST --header "Content-Type: application/json" \
	"https://$SONAR_URL/api/project_branches/delete?project=$SONAR_PROJECT&branch=$GITHUB_BRANCH"
