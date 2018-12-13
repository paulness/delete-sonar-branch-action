FROM alpine:3.8

RUN apk add --no-cache curl

LABEL "com.github.actions.name"="Delete SonarCloud branch"
LABEL "com.github.actions.description"="Delete SonarCloud branch when the branch is deleted in Github."
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="blue"

COPY delete-sonar-branch.sh /usr/bin/delete-sonar-branch.sh

ENTRYPOINT ["delete-sonar-branch.sh"]
