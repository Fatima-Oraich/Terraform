resource "aws_instance" "MACHINE-ADMIN" {
    key_name = "test_keypair"
    ami = "ami-021d41cbdefc0c994"
    security_groups = ["${aws_security_group.FORAICH-SG-ADMIN.id}"]
    subnet_id = "${aws_subnet.foraich-pub.id}"   
    instance_type = "t2.micro"
    #user_data = "${file("NULL.sh")}"
    user_data = <<-EOF
                #!/bin/bash

                ## Je suis un script qui ne fait rien ##

                exit
                EOF


    tags = {
      "Name" = "MACHINE-ADMIN"
    }
}

resource "aws_instance" "MACHINE-RPROXY" {
    key_name = "test_keypair"
    ami = "ami-021d41cbdefc0c994"
    security_groups = ["${aws_security_group.FORAICH-SG-RPROXY.id}"]
    subnet_id = "${aws_subnet.foraich-pub.id}"      
    instance_type = "t2.micro"
    #user_data = "${file("install_rproxy.sh")}"
    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y haproxy
                systemctl enable --now haproxy
                EOF


    tags = {
      "Name" = "MACHINE-RPROXY"
    }
}

resource "aws_instance" "of-inst-web-1" {
    key_name = "test_keypair"
    ami = "ami-021d41cbdefc0c994"
    security_groups = ["${aws_security_group.FORAICH-SG-WEB.id}"]
    subnet_id = "${aws_subnet.foraich-priv1.id}"  
    availability_zone = "eu-west-3a"
    instance_type = "t2.micro"
    #user_data = "${file("install_web.sh")}"
    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl enable --now httpd
                echo "<h1>Hello World !</h1>" > /var/www/html/index.html
                EOF

    tags = {
      "Name" = "of-inst-web-1"
    }
}


resource "aws_instance" "of-inst-web-2" {
    key_name = "test_keypair"
    ami = "ami-021d41cbdefc0c994"
    security_groups = ["${aws_security_group.FORAICH-SG-WEB.id}"]
    subnet_id = "${aws_subnet.foraich-priv2.id}"
    availability_zone = "eu-west-3b"   
    instance_type = "t2.micro"
    #user_data = "${file("install_web.sh")}"
    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl enable --now httpd
                echo "<h1>Hello World !</h1>" > /var/www/html/index.html
                EOF
    

    tags = {
      "Name" = "of-inst-web-2"
    }
}

resource "aws_instance" "of-inst-web-3" {
    key_name = "test_keypair"
    ami = "ami-021d41cbdefc0c994"
    security_groups = ["${aws_security_group.FORAICH-SG-WEB.id}"]
    subnet_id = "${aws_subnet.foraich-priv3.id}" 
    availability_zone = "eu-west-3c"    
    instance_type = "t2.micro"
    #user_data = "${file("install_web.sh")}"
    user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl enable --now httpd
                echo "<h1>Hello World !</h1>" > /var/www/html/index.html
                EOF

    tags = {
      "Name" = "of-inst-web-3"
    }
}