resource "aws_kms_key" "_" {
  description = "code artifact domain key"
}

resource "aws_kms_alias" "kms_alias" {
  name          = "alias/moggies_io_code_artifact_key"
  target_key_id = aws_kms_key._.key_id
}

resource "aws_codeartifact_domain" "_" {
  domain         = var.domain
  encryption_key = aws_kms_key._.arn
}

resource "aws_codeartifact_repository" "team_npm_repo" {
  repository  = "team-npm"
  domain      = aws_codeartifact_domain._.domain
  description = "Team NPM repository"

  upstream {
    repository_name = aws_codeartifact_repository.npm_store.repository
  }
}

resource "aws_codeartifact_repository" "npm_store" {
  repository  = "npm-store"
  domain      = aws_codeartifact_domain._.domain
  description = "External connection to npmjs.com"

  external_connections {
    external_connection_name = "public:npmjs"
  }
}