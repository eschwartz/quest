# Build a new docker image
npm run docker:build

# Push the image to ECR
npm run docker:push

# Redeploy ECS service
aws ecs update-service \
    --cluster quest \
    --service quest-api \
    --force-new-deployment > /dev/null