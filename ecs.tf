{
    "taskDefinitionArn": "arn:aws:ecs:us-east-1:287350188447:task-definition/prod:7",
    "containerDefinitions": [
        {
            "name": "prod",
            "image": "287350188447.dkr.ecr.us-east-1.amazonaws.com/app_repo",
            "cpu": 256,
            "memory": 512,
            "portMappings": [
                {
                    "containerPort": 443,
                    "hostPort": 443,
                    "protocol": "tcp"
                }
            ],
            "essential": true,
            "environment": [],
            "mountPoints": [],
            "volumesFrom": []
        }
    ],
    "family": "prod",
    "taskRoleArn": "arn:aws:iam::287350188447:role/ecsTaskExecutionRole",
    "executionRoleArn": "arn:aws:iam::287350188447:role/ecsTaskExecutionRole",
    "networkMode": "awsvpc",
    "revision": 7,
    "volumes": [],
    "status": "ACTIVE",
    "requiresAttributes": [
        {
            "name": "com.amazonaws.ecs.capability.ecr-auth"
        },
        {
            "name": "com.amazonaws.ecs.capability.task-iam-role"
        },
        {
            "name": "ecs.capability.execution-role-ecr-pull"
        },
        {
            "name": "com.amazonaws.ecs.capability.docker-remote-api.1.18"
        },
        {
            "name": "ecs.capability.task-eni"
        }
    ],
    "placementConstraints": [],
    "compatibilities": [
        "EC2",
        "FARGATE"
    ],
    "requiresCompatibilities": [
        "FARGATE"
    ],
    "cpu": "256",
    "memory": "512",
    "runtimePlatform": {
        "cpuArchitecture": "X86_64",
        "operatingSystemFamily": "LINUX"
    },
    "registeredAt": "2023-12-14T19:01:48.273Z",
    "registeredBy": "arn:aws:iam::287350188447:user/stbismark",
    "tags": []
}