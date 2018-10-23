# 解析文本中的电子邮件地址和URL

## 匹配电子邮件地址的正则表达式
```
[A-Za-z0-9._]+@[A-Za-z0-9.]+\.[a-zA-Z]{2,4}
```

```shell
$ egrep -o '[A-Za-z0-9._]+@[A-Za-z0-9.]+\.[a-zA-Z]{2,4}' url_email.txt
slynux@slynux.com
test@yahoo.com
cool.hacks@gmail.com
```

## 匹配URL的正则表达式
```
http://[a-zA-Z0-9.]+\.[a-zA-Z]{2,3}
```

```shell
$ egrep -o "http://[a-zA-Z0-9.]+\.[a-zA-Z]{2,3}" url_email.txt
http://www.google.com
http://code.google.com
```