resource "aws_ecr_repository" "quest" {
    name = "quest"
}

output "ecr_url" {
  value = aws_ecr_repository.quest.repository_url
}