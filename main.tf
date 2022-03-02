module "s3" {
    source = "./modules/s3"
    namespace  = var.namespace
    bucket_key = var.bucket_key
    region     = var.region
}

module "eb" {
    source = "./modules/eb"
    namespace  = var.namespace
}