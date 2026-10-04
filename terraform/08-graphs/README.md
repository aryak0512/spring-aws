```terraform graph``` command generates:

```bash
digraph G {
rankdir = "RL";
node [shape = rect, fontname = "sans-serif"];
"data.aws_ami.ubuntu" [label="data.aws_ami.ubuntu"];
"aws_iam_instance_profile.ec2" [label="aws_iam_instance_profile.ec2"];
"aws_iam_role.ec2" [label="aws_iam_role.ec2"];
"aws_iam_role_policy.s3" [label="aws_iam_role_policy.s3"];
"aws_instance.web" [label="aws_instance.web"];
"aws_s3_bucket.data" [label="aws_s3_bucket.data"];
"aws_security_group.web" [label="aws_security_group.web"];
"aws_subnet.main" [label="aws_subnet.main"];
"aws_vpc.main" [label="aws_vpc.main"];
"aws_iam_instance_profile.ec2" -> "aws_iam_role.ec2";
"aws_iam_role_policy.s3" -> "aws_iam_role.ec2";
"aws_iam_role_policy.s3" -> "aws_s3_bucket.data";
"aws_instance.web" -> "data.aws_ami.ubuntu";
"aws_instance.web" -> "aws_iam_instance_profile.ec2";
"aws_instance.web" -> "aws_security_group.web";
"aws_instance.web" -> "aws_subnet.main";
"aws_security_group.web" -> "aws_vpc.main";
"aws_subnet.main" -> "aws_vpc.main";
}
```

can be viewed at Grapghviz online tool: https://dreampuf.github.io/GraphvizOnline/

Or locally using Graphviz installed on your machine:

```bash
brew install graphviz
```

then

```bash
terraform graph | dot -Tpng > graph.png
```