# nginx

## 注意

部署本项目需要配置nginx.conf和setup.sh来绑定tomcat。

## 说明

端口映射: 30080:80, 30443:443

规格: 1

目录结构：

``` bash
ego-nginx
├── conf
│   └── nginx.conf
├── docker-compose.yml
├── README.md
└── setup.sh
```

## 部署

``` bash
git clone https://github.com/docker-cluster/nginx.git
cd nginx
chmod +x setup.sh
./setup.sh
```
