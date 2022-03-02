include .env

create-new-application:
	aws elasticbeanstalk create-application-version \
	--application-name ${APP_NAME} --source-bundle  \
	S3Bucket=${BUCKET_NAME},S3Key=${BUCKET_KEY}     \
	--region ${REGION} --profile ${AWS_USER} --version-label ${VERSION}

deploy-environment:
	aws elasticbeanstalk update-environment \
	--environment-name ${ENV_NAME} --version-label ${VERSION} \
	--region ${REGION} --profile ${AWS_USER}