# lambda-rust-builder

This image provides one-stop environment to deploy Rust AWS Lambda functions managed by serverless.

## serverless.yaml

Include following elements to your serverless.yaml.
See documents of serverless and serverless-rust for details.

```
# In order to avoid error from `runtime: rust`
configValidationMode: warn
provider:
  name: aws
  # required by serverless-rust
  runtime: rust

plugins:
  # required to build rust function
  - serverless-rust

custom:
  rust:
    # in order not to use obsolete build image
    dockerless: true
```

## Usage

Run this command at the directly with serverless.yaml.

```
docker run -v $PWD:/src/:z tomykaira/lambda-rust-builder:latest serverless deploy
```

## References:

- https://github.com/awslabs/aws-lambda-rust-runtime
- https://github.com/softprops/serverless-rust
