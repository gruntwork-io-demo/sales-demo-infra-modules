catalog {
  display_name = "Stateful EC2 Service with Database"
  description  = "Deploy an Auto Scaling Group-based EC2 service fronted by an ALB, backed by an RDS database."
  
  example_inputs = {
    name              = "example-ec2-db-service"
    version           = "v0.1.0"
    instance_type     = "t3.medium"
    min_size          = 2
    max_size          = 5
    server_port       = 8080
    alb_port          = 80
    instance_class    = "db.t3.small"
    allocated_storage = 20
    storage_type      = "gp2"
    db_username       = "admin"
    db_password       = "supersecretpassword"
  }
}
