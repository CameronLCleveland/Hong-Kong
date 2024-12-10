README: Multi-Availability Zone Deployment with Data Transfer to Japan
This Terraform configuration deploys a secure and scalable environment on AWS that adheres to specific regional data compliance and operational requirements. The setup supports automatic scaling, restricted public access, and secure data transfer, while preparing for future stages involving databases and SIEM systems.

Project Description
This project sets up a highly available infrastructure in the Hong Kong region, with peering connections to Japan for syslog data transfer. The configuration ensures compliance with strict data locality requirements, allowing syslog data to remain within Japan while facilitating scalable deployments across multiple availability zones (AZs).

The architecture minimizes public exposure, supports future-stage database and SIEM deployments, and ensures fault tolerance and scalability.

Key Components
1. VPCs and Subnets
Hong Kong VPC: Contains both public and private subnets for resource isolation and secure networking.
Public subnets: Enable internet-facing access for load balancers and other public resources.
Private subnets: Host secure resources, including instances for syslog data transfer.
Subnet Configuration:
Each subnet spans an availability zone (AZ) within the Hong Kong region.
CIDR blocks are segmented for scalability and isolation.
2. Auto Scaling Group (ASG)
Configuration:
Minimum instances: 3
Maximum instances: 9
Desired instances: 6
Purpose: Ensures fault-tolerant and scalable deployments across at least two AZs.
Security:
Instances are attached to private subnets for sensitive workloads.
Only port 80 is open to the public.
3. Security Groups
Configured to allow:
Ingress: Port 80 for public-facing services.
Egress: Open for all outbound traffic to facilitate internal communications.
Ensure restrictions for syslog data compliance:
Syslog traffic (UDP 514) limited to private subnets and routed securely to Japan.
4. VPC Peering
Establishes connectivity between the Hong Kong VPC and a private subnet in Japan.
Ensures secure transfer of syslog data, meeting compliance requirements.
Compliance Checklist
ASG Requirements:
Minimum of 2 AZs.
At least 1 EC2 instance deployed during initial testing.
Data Compliance:
Syslog data stored exclusively in Japan.
No personal information stored outside Japan’s borders.
Data transfer is not routed via VPN, ensuring transparency and traceability.
Security Constraints:
Public access limited to port 80 only.
Syslog data restricted to private subnets.
Future Stages:
SIEM/Syslog server setup in Japan (Stage 2).
Database deployment planned for Stage 2.
Files and Configuration Details
1. File Overview
File	Description
0-Auth.tf	Handles authentication and provider configuration.
1-VPC.tf	Defines the VPC for Hong Kong, including CIDR block and basic configuration.
2-Subnets.tf	Configures public and private subnets for the Hong Kong VPC.
3-IGW.tf	Sets up an Internet Gateway for public subnets.
4-NAT.tf	Configures a NAT Gateway for private subnet internet access.
5-Route.tf	Establishes routing between subnets and gateways.
6-SG01-All.tf	Configures security groups for all resources.
7-launchtemplate.tf	Defines the launch template for EC2 instances within the ASG.
8-TargetGroup.tf	Creates a target group for load balancer integration.
9-LoadBalancer.tf	Configures a load balancer for public-facing applications.
10-AutoScalingGroup.tf	Deploys an ASG with the specified capacity and AZs.
14-Peering.tf	Establishes VPC peering between Hong Kong and Japan regions.
