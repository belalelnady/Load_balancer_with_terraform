
```markdown
# AWS Infrastructure with Terraform
![Terraform project](https://github.com/user-attachments/assets/145c7a33-9951-466b-9f50-de80b9bd8a79)
This Terraform project sets up a complete AWS infrastructure including a VPC, public and private subnets, an application load balancer, NAT gateway, and EC2 instances configured as a bastion host and private servers running Nginx. The load balancer is configured to balance traffic between the private instances.

## **Infrastructure Components**

1. **VPC**: Creates a custom VPC for the infrastructure.
2. **Subnets**: 
   - Two public subnets for the load balancer and bastion host.
   - Two private subnets for the Nginx instances.
3. **Internet Gateway**: Provides internet access to the public subnets.
4. **NAT Gateway**: Allows private instances to access the internet for updates without exposing them to incoming traffic.
5. **Security Groups**:
   - Security groups for the bastion host, load balancer, and private instances.
6. **Application Load Balancer**:
   - Balances traffic between the private instances running Nginx.
7. **EC2 Instances**:
   - Bastion Host: Acts as a jump server to access the private instances.
   - Private Instances: Runs Nginx and serves as the backend servers behind the load balancer.

## **Project Structure**

```plaintext
.
├── instances
│   ├── main.tf
│   ├── output.tf
│   └── variables.tf
├── key-pair
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── load_balancer
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── main.tf
├── network
│   ├── internet_GW
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── NAT_GW
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── route_table
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── route_t_association
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── security_group
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── subnets
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── vpc
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── scripts
│   └── install-nginx.sh
├── provider.tf
├── terraform.tfstate
├── terraform.tfstate.backup
├── terraform.tfvars
└── vairiables.tf

```

## **Getting Started**

### **Prerequisites**

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- AWS CLI configured with appropriate credentials and permissions to create the resources.

### **Usage**

1. **Clone the repository:**

   ```bash
   git clone https://github.com/belalelnady/Load_balancer_with_terraform
   cd Load_balancer_with_terraform
   ```

2. **Initialize Terraform:**

   Initialize the project and download the required providers.

   ```bash
   terraform init
   ```

3. **Modify Variables:**

   Update `variables.tf` files with your specific configuration like VPC CIDR blocks, subnets, instance types, AMI IDs, and key names.

4. **Plan the Infrastructure:**

   Review the changes that Terraform will make.

   ```bash
   terraform plan
   ```

5. **Apply the Configuration:**

   Create the resources on AWS.

   ```bash
   terraform apply
   ```

6. **Accessing the Instances:**

   - SSH into the bastion host using your key pair.
   - From the bastion host, you can SSH into the private instances.

### **Troubleshooting**

- **Bad Gateway Errors**: Ensure the health check path in the load balancer configuration matches an endpoint served by the private instances.
- **Unhealthy Instances**: Check security group rules, Nginx status, and ensure that health checks are configured correctly.
- **Security Group Rules**: Ensure the security group rules allow traffic between the load balancer and instances as expected.

### **Cleanup**

To delete all resources created by this Terraform configuration:

```bash
terraform destroy
```

## **Customization**

- Modify the instance configurations in the `instances` module to add more instances or change instance types.
- Update the `load_balancer` module to adjust load balancing behavior or health check settings.

## **Important Notes**

- Ensure your AWS account has the appropriate permissions to create VPCs, EC2 instances, load balancers, and other resources used in this project.
- Review and adjust costs associated with the AWS resources before applying the configuration.

