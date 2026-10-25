# Built a Mini AWS Hosting Lab and Reverse-Engineered It into Terraform

This is my imported AWS lab, built for learning by doing. I played with ALB, Auto Scaling, AMIs, user data, target groups, and hosting a static site on S3 manually. After completing lab, I thought to import it to terraform and here it is.

Import block can be removed once you import all resources. (I am keeping then intentionally)

## Two ways to host

- ALB + EC2 + Auto Scaling: More control for apps that need servers. Great for learning compute, scaling, and load balancing. More to manage, too.

- S3 static hosting: Simple and lightweight for sites made of static files. No servers to manage—but no server-side app code either.


## Added jenkins and webhook to trigger - Test
