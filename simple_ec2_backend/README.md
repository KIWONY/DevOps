# Don't worry. The AWS access key and secret key have been deactivated.

# 놓쳐서 해맸던 부분 
### 1. api_route를 지정 하지않아서  네트워크 트래픽이 라우팅 되지 않고 있었다. 

### 2. file provisioner에서 connection 블럭으로 ssh 연결을 시도하면, script.sh를 업로드할 권한이 없다. 
> file provisioner에서 아래와 같이 ssh connection 연결 시 user가 "ubuntu" 이기 때문에 script.sh를 실행할 권한이 없다.  <br/> 
그래서 file provisioner에서 script를 복사해서 원격서버에 보낸 후, remote-exec provisioner로 
해당파일의 권한을 변경하고 실행하는 명령어를 실행한다.

- 리소스(aws_instance 등) 블럭에서 connection을 선언하면 해당 리소스의 모든 프로비저너가 선언한 커넥션을 사용한다고 한다.
- 그래서 나는 provisioner에서 선언하는 것으로 했다.

### 3. script.sh에 실행하고자 하는 명령어에 -y를 붙여줘야한다. 

### 4. aws key들은 깃허브에 올리지않도록 한다. 

### 5. aws accesskey에 준 iam 권한은  "vpc full access"와 "ec2 full access" 이다. 
 
