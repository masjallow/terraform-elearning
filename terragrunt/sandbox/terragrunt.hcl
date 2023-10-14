terraform {
    source = "${get_parent_terragrunt_dir()}/../sandbox"
}

include {
    path = find_in_parent_folders()
}

inputs = {
    account_number = "290668402712"
    instance_type = "t2.micro"
    purpose = "test"
}