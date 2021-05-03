// resource "aws_s3_bucket" "api_bucket" {
//   bucket = "moggiez-api-lambdas"
//   acl    = "private"

//   tags = {
//     Project = var.application
//   }
// }

// resource "aws_s3_bucket" "moggiez_lambdas" {
//   bucket = "moggiez-lambdas"
//   acl    = "private"

//   tags = {
//     Project = var.application
//   }
// }

// resource "aws_s3_bucket" "moggiez_call_responses_success" {
//   bucket = "moggiez-call-responses-success"
//   acl    = "private"

//   tags = {
//     Project = var.application
//   }
// }

// ## Failure

// resource "aws_s3_bucket" "moggiez_call_responses_failure" {
//   bucket = "moggiez-call-responses-failure"
//   acl    = "private"

//   tags = {
//     Project = var.application
//   }
// }