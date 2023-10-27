variable bucket_name {
    description = "The name of the s3 bucket"
    type = string
}

variable terratowns_access_token {
    description = "terratowns access token"
    type = string
}

variable teacherseat_user_uuid {
    description = "teacherseat_uuid of exampro account"
    type = string
}

variable "terratowns_endpoint" {
    description = "terratowns_endpoint"
    type = string    
}

variable content_version {
    description = "The version value of the s3 objects"
    type = number
}