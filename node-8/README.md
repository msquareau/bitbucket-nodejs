## bitbucket-nodejs
A streamlined nodejs ci image for bitbucket pipelines

## Includes
* Latest Nodejs 8 LTS
* Latest AWS CLI
* Puppeteer for test in chromium
 
## Usage

Example **bitbucket-pipelines.yml**

```yml
# This is a sample build configuration for JavaScript.
# Check our guides at https://confluence.atlassian.com/x/14UWN for more examples.
# Only use spaces to indent your .yml configuration.
# -----
# You can specify a custom docker image from Docker Hub as your build environment.
image: msquare/bitbucket-nodejs

pipelines:

  custom: # Pipelines that are triggered manually
    deployment-to-dev:
      - step:
          caches:
            - node
          script: # Modify the commands below to build your repository.
             - yarn install --non-interactive
             - yarn test
             - yarn build
             - aws s3 sync --delete --region ap-XXXXXXX-X ./XXXXXXX/ s3://$S3_BUCKET_NAME

  default:
    - step:
        caches:
          - node
        script: # Modify the commands below to build your repository.
          - yarn install --non-interactive
          - yarn test
          - yarn build
          - aws s3 sync --delete --region ap-XXXXXXX-X ./XXXXXXX/ s3://$S3_BUCKET_NAME


#definitions:
#  caches:
#    yarn: /usr/local/share/.cache/yarn/v1
#    npm: ~/.npm
#    apt: /var/cache/apt/archives
#    pip: ~/.cache/pip

```






