terraform{
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>3.0"
        }
    }
}

provider "aws" {
    region  =   "us-east-1"
    access_key = ${{ secrets.AWS_ACESS_KEY_ID }}
    secret_key = ${{ secrets.AWS_SECRET_ACCESS_KEY }}
}