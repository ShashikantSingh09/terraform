variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "app_count" {
  type    = number
  default = 1
}

variable "ecs_task_role_arn" {
  description = "ARN of the ECS Task Role"
  type        = string
  default     = "arn:aws:iam::851725311521:role/ecsTaskExecutionRole"
}

variable "ecs_execution_role_arn" {
  description = "ARN of the ECS Execution Role"
  type        = string
  default     = "arn:aws:iam::851725311521:role/ecsTaskExecutionRole"
}

variable "ecs_log_driver_options" {
  description = "Options for the AWS Logs driver in ECS task"
  type        = map(string)
  default = {
    "awslogs-region"        = "us-east-1"
    "awslogs-group"         = "web-app"
    "awslogs-stream-prefix" = "ecs"
  }
}

variable "ecs_log_group_name" {
  description = "Name of the CloudWatch Logs group for ECS"
  type        = string
  default     = "web-app"
}