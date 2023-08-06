variable "s3-bucket-name"{
    type = string
}

variable "tags" {
    type = object({

      CreatedBy = string
      Environment = string
      Department = string
    })
  
}

variable "remote-backend-bucket"{
    type = string
}

variable "remote-backend-key"{ type = string}

variable "region" {
  type = string
}