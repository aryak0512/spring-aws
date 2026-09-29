
provider "github" {
  token = "xx"
}

resource "github_repository" "example" {
  name        = "terraform-generated"
  description = "My awesome codebase"
  visibility  = "public"
}
