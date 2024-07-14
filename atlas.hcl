env "dev" {
  src = "file://schema.hcl"
  dev = "docker://postgres/15/dev?search_path=public"

  # Test configuration for local development.
  test {
    schema {
      src = ["schema.test.hcl"]
    }
  }
}
