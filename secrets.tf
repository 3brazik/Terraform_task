resource "aws_secretsmanager_secret" "secretsmanager1" {
  name                    = "private-secret-manger1"
  recovery_window_in_days = 0

}

resource "aws_secretsmanager_secret_version" "secretsmanagerversion1" {
  secret_id     = aws_secretsmanager_secret.secretsmanager1.id
  secret_string = tls_private_key.key.private_key_pem

}
output "instance_id" {
  value = aws_instance.public_ec2.id
}

output "secretsmanager_secret" {
  value = aws_secretsmanager_secret.secretsmanager1.id
}

output "secretsmanager_secret_version" {
  value = aws_secretsmanager_secret_version.secretsmanagerversion1.id
}