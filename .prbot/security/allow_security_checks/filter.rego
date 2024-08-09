package security.allow_security_checks

import future.keywords

# version of pr bot schema version the policies are authored in
schema := "v1"

default track := false

track if {
	input.event == "pull_request"
}