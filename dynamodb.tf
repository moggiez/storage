resource "aws_dynamodb_table" "playbooks" {
  name           = "playbooks"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "CustomerId"
  range_key      = "PlaybookId"

  attribute {
    name = "CustomerId"
    type = "S"
  }

  attribute {
    name = "PlaybookId"
    type = "S"
  }

  // Playbook
}

resource "aws_dynamodb_table" "loadtests" {
  name           = "loadtests"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "CustomerId"
  range_key      = "LoadtestId"

  attribute {
    name = "CustomerId"
    type = "S"
  }

  attribute {
    name = "LoadtestId"
    type = "S"
  }

  attribute {
    name = "PlaybookId"
    type = "S"
  }

  global_secondary_index {
    name            = "PlaybookLoadtestIndex"
    hash_key        = "PlaybookId"
    range_key       = "LoadtestId"
    write_capacity  = 5
    read_capacity   = 5
    projection_type = "KEYS_ONLY"
  }
}

resource "aws_dynamodb_table" "organisations" {
  name           = "organisations"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "OrganisationId"
  range_key      = "UserId"

  attribute {
    name = "OrganisationId"
    type = "S"
  }

  attribute {
    name = "UserId"
    type = "S"
  }

  // Name, IsOwner, IsInvitation, InvittationExpiryDate

  global_secondary_index {
    name            = "UserOrganisations"
    hash_key        = "UserId"
    range_key       = "OrganisationId"
    write_capacity  = 5
    read_capacity   = 5
    projection_type = "KEYS_ONLY"
  }
}

resource "aws_dynamodb_table" "domains" {
  name           = "domains"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "DomainName"
  range_key      = "OrganisationId"

  attribute {
    name = "DomainName"
    type = "S"
  }

  attribute {
    name = "OrganisationId"
    type = "S"
  }

  // IsVerified, VerificationLocation, VerificationCode, VerificationExpirationDate, LastVerifiedDate

  global_secondary_index {
    name            = "OrganisationDomains"
    hash_key        = "OrganisationId"
    range_key       = "DomainName"
    write_capacity  = 5
    read_capacity   = 5
    projection_type = "KEYS_ONLY"
  }
}