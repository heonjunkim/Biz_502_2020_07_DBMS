#git-hub 프로젝트에 업로드 하기

### 최초로 git-hub에 프로젝트 업로드하기
1. git init : 현재 폴더를 git-hub에 올리기 위한 local repository로 
생성

#### 생성된 local repository에 git-hub에 접속 정보 추가

#### 공용 또는 여러사람이 사용하는 컴퓨터인 경우 폴더별로 사용자를 변경하고자 할때
2. git config --local user.name and user.id
3. git config --local user.email user@.com


#### 혼자 사용하는 컴퓨터에서는 글로벌로 설정값을 저장
2. git config --global user.name and user.id
3. git config --global user.email user@.com
3. git config 를 gobal로 설정하게 되면, local repository를
생성할때마다 git config를 실행하지 않아도 된다.

### remote repository 정보 추가
1. git-hub 사이트에 접속하여 new repository를 설정
2. git remote add origin git remote add origin https://github.com/heonjunkim/Biz_502_2020_07_DBMS.git : remote repository 추가
3. git hub의 remote repository인 git remote add origin https://github.com/heonjunkim/Biz_502_2020_07_DBMS.git 이 주소를 origin이라는 이름으로 사용하겟다.

### git-hub에 프로젝트 올릴때, 올릴때마다 항상 실행해야 한다.
1. git add. : 현재 폴더, sub폴더의 모든 파일을 local repository(git 폴더)에 압축, 해쉬하여 저장하라
2. git commit -m "Coment" : 지금 시점에 추가된 프로젝트를 Comment라는 설명을 부착하여 remote에 올릴 준비를 하라
3. git push -u origin master : master(local)에 저장된 프로젝트를 origin (remote)에 보내라 