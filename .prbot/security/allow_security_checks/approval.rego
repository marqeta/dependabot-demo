package security.allow_security_checks

import data._utils.files.valid_file_change
import future.keywords

lgtm := "LGTM!! :100: :tada:"

default review["type"] := "SKIP"

has_file_changed if {
    input.pull_request.changed_files != 0
}

author_is_depandabot if {
    input.pull_request.user.login == "dependabot"
}

has_required_status_check if {
	count(input.plugins.base_branch_protection.required_status_checks.contexts) > 0
}

review["type"] := "APPROVE" if {
    has_re_run_marker
    has_file_changed
    author_is_depandabot
    has_required_status_check
}

review["body"] := lgtm if {
	review.type == "APPROVE"
}