module "lambda" {
  source = "./modules/lambda"
}

module "api_gateway" {
  source               = "./modules/api_gateway"
  lambda_invoke_arn    = module.lambda.invoke_arn
  lambda_function_name = module.lambda.function_name
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "iam" {
  source           = "./modules/iam"
  lambda_role_name = module.lambda.role_name
}
