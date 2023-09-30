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