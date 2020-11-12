# tf-example-module

Used to portray issues with Terraform inheriting parent provider configuration.

## Steps to reproduce

* Comment out the `providers` definition in `example_module.tf` and the contents of the `providers.tf` file
* Run terraform apply
* Comment out the entirety of the `example_module.tf` file to destroy the resource
* You should see some error like:

```
Error: Provider configuration not present

To work with module.example_module.aws_s3_bucket.bucket its original provider
configuration at module.example_module.provider.aws is required, but it has
been removed. This occurs when a provider configuration is removed while
objects created by that provider still exist in the state. Re-add the provider
configuration to destroy module.example_module.aws_s3_bucket.bucket, after
which you can remove the provider configuration again.
```

* Uncomment all of `example_module.tf` including the `providers` definition
* Uncomment out the content of `providers.tf`
* Run terraform apply
* Comment out the entirety of the `example_module.tf` file to destroy the resource
* The S3 bucket should be deleted successfully