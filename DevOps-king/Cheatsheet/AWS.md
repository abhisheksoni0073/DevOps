__s3 IAM Policy get put__

    {
    "Id": "Policy1566535820890",
    "Version": "2012-10-17",
    "Statement": [
        {
        "Sid": "Stmt1566535820083",
        "Action":   ["s3:PutObject","s3:PutObject"],
        "Effect": "Allow",
        "Resource": "arn:aws:s3:::meetmusically/*"
        } 
    ]
    }


__s3 public bucket Policy__
    
    {
        "Version": "2012-10-17",
        "Id": "Policy1539680357266",
        "Statement": [
            {
                "Sid": "Stmt1539680321919",
                "Effect": "Allow",
                "Principal": "*",
                "Action": "s3:GetObject",
                "Resource": "arn:aws:s3:::clickmall-live/*"
            }
        ]
    }


__s3 cors__

    <?xml version="1.0" encoding="UTF-8"?>
    <CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
    <CORSRule>
        <AllowedOrigin>*</AllowedOrigin>
        <AllowedMethod>GET</AllowedMethod>
        <AllowedMethod>PUT</AllowedMethod>
        <AllowedMethod>POST</AllowedMethod>
        <AllowedMethod>HEAD</AllowedMethod>
        <MaxAgeSeconds>3000</MaxAgeSeconds>
        <AllowedHeader>*</AllowedHeader>
    </CORSRule>
    </CORSConfiguration>


__ECR login__

    aws ecr get-login  --no-include-email --region us-east-2 | sh

__Increase Storage Space__
1. df -h #check file system

    Filesystem Size Used Avail Use% Mounted on
    udev 77G 0 77G 0% /dev
    tmpfs 16G 9.1M 16G 1% /run
    /dev/sda1 970G 552G 418G 57% /
    tmpfs 77G 228K 77G 1% /dev/shm
    tmpfs 5.0M 0 5.0M 0% /run/lock
    tmpfs 77G 0 77G 0% /sys/fs/cgroup

2. sudo lsblk #check partition

    NAME MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
    sda 8:0 0 1000G 0 disk
    └─sda1 8:1 0 1000G 0 part /

3. Increase disk size (from aws)

4. `sudo growpart /dev/sda 1` #Grow the partition

    CHANGED: partition=1 start=2048 old: size=419428319 end=419430367 new: size=2097149919
    ,end=2097151967

5. `sudo resize2fs /dev/sda1` #Resize file system

    resize2fs 1.42.13 (17-May-2015)
    Filesystem at /dev/sda1 is mounted on /; on-line resizing required
    old_desc_blocks = 13, new_desc_blocks = 63
    The filesystem on /dev/sda1 is now 262143739 (4k) blocks long.

__s3 sync__

    aws s3 sync s3://test /root/test
    aws s3 cp /root/test s3://test --recursive