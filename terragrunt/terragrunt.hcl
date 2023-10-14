locals {
    dirs = split("/",path_relative_to_include())
    env = local.dirs[0]
    org = "davidyurman"
    channel = "infrastructure"
    account_number = "1234567"
    region = "us-east-1"
    purpose = "default"
}

remote_state {
    backend = "s3"

    config = {
        encrypt = true
        bucket = join("-",[local.account_number,
                        local.region,
                        local.purpose,
                        local.env
                        ])
        key = "${path_relative_to_include()}/terraform.tfstate"
        region = local.region
    }
    //<account_number>-<us-east-1>-<tfstate>-<env>
}

inputs = {
    account = local.account_number
    purpose = local.purpose
}