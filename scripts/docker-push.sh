#!/usr/bin/env bash
set -euo pipefail
# Push the docker image up to ECR (AWS container registry)
# See
# https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html

# Must supply a docker image tag as an argument
image_tag=${1};

# Make sure AWS CLI is installed
no_aws_err="
Unable to push docker image: AWS CLI must be installed
See https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
";
which aws || echo "${no_aws_err}";


# Get user's account number and default region
# Alternatively, if using terraform
# this is a great use-case for outputs:
# See https://www.terraform.io/language/values/outputs
account_number=$(aws sts get-caller-identity --query Account --output text);
aws_region=$(aws configure get region);
ecr_url="${account_number}.dkr.ecr.${aws_region}.amazonaws.com";

# login to ecr, with docker
aws ecr get-login-password --region ${aws_region} | \
    docker login \
        --username AWS \
        --password-stdin \
        ${ecr_url};

# Tag the image, for upload
docker tag ${image_tag} "${ecr_url}/${image_tag}";

# Push the image
docker push "${ecr_url}/${image_tag}";

