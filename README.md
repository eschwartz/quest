# Rearc Quest

![rearc](https://www.rearc.io/wp-content/uploads/2018/11/Logo.png)

![the force](https://www.rearc.io/wp-content/uploads/2019/07/quest.gif)

https://rearc.livepoll.link/

A code challenge to assess cloud skills.

Completed by Edan Schwartz for Rearc, Aug 5, 2022.

See [INSTRUCTIONS.md](./INSTRUCTIONS.md)

## notes

Sections
- ## Background context
  My Approach, goals, and context 
  how do I understand the problem I'm trying to solve, and why?
    I assume the prompt is X. IRL, would ask
  (eg. imaging a PoC client, and also wanting to learn)

  My goal was to spend more time in the write-up vs. the tech implementation. In the end this wasn't really the case, AWS took longer than expected network stuff, changes to system, etc. But goal is to build as little as possible before getting feedback, pivoting and/or continuing

  in summary, what's included, what's not
  I will discuss later int his document....
- ## Solution
  - Describe what I built
  - ### Overview: container, ECS, etc
    - screenshots, explain why their "failing"
    - diagram?
  - ### Tech details
    - Code changes
    - each piece/service
    - notes on key tech config things (eg. health check)
- ## Evaluation
  - pros/cons of this approach
    - of cloud in general
    - of AWS
    - pain points of ECS (weird networking, non standard, etc)
  - Other options:
    - lambda/serverless: pros/cons
    - EKS
    - Other container orchestrators
    - vanilla docker, sysd init
    - no container, AMI, etc
- ## Next steps
  (What's _not_ included, but should be)
  for each include:
    - What it is, and why?
    - Alternatives
    - How to implement
    - Considerations (tech choices, how does it match your org/needs, etc)
  - Terraform
    - partial, as PoC
    - where to see full examples, etc.
    - deployment "layers" (eg. network, data, app layers)
      - Multiple states, pulling outputs from other states (show example w/vpc + LB or something)
    - verifying/approving deployments (don't drop your DB!)
  - CI/CD
    - PR environments
    - multiple pipelines (infra vs. app)
    - version tagging on images
    - rollback
  - Monitoring
    - CW, synthetics
      - Consider returning 500 for errors
    - Log aggregation w/CW
    - Cloudwatch dashboard, log queries
      - Stream to ES, others: 
        https://medium.com/@KTree_Blog/cloudwatch-logs-stream-to-elastic-search-kibana-c7352b5f9c2b
        https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Subscriptions.html
  - IAM lockdown
    - for the deploy user
    - Options for managing IAM (federated, keys, cognito, cross-account assume role)
  - Networking
    - ECS in private subnet, LB in public subnet
  - Cloud security controls (config, others?)
    - "I've seen this used in the past, there may be other matters"
    - multi account stuff?
  - TLS options: ACM, Lets Encrypt, manage your own certs, etc
    - how you would BYO certs w/LB

## Final thoughts

....? something nice

## References
links for various tech, etc.
