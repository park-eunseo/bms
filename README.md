# 📃 Sim8log(심플로그)
> 일상 웹 블로그 사이트  
> http://sim8log.com/ 

</br>

## 1. 제작 기간 & 참여 인원
- 2022년 08월 06일 ~ 09월 04일
- 개인 프로젝트

</br>

## 2. 사용 기술
#### `Back-end`
  - Java (JDK 11)
#### `Front-end`
  - JavaScript
#### `Framework`
  - spring framework 5.0.2
  - Mybatis-3.5.3
#### `Server`
  - Apache Tomcat 9.0
#### `Database`
  - MySQL 8.0.15
</br>

## 3. ERD 설계
 - [테이블 정의서](https://freckle-web-d61.notion.site/b774b1cf286d4bccb6b444394332f968)

![bms_erd](https://user-images.githubusercontent.com/98097222/195607307-2de232bc-3903-47b3-b143-3e039f296808.png)

## 4. 주요 기능

- [사용자 매뉴얼](https://www.notion.so/877fff312e2a4438905768bcc796e263)
- [관리자 매뉴얼](https://www.notion.so/9e795512a37a4d1aa31317e9e0d9394c)
</br>

## 5. 트러블 슈팅
* Mysql timezone 설정 에러  
  
  - AWS RDS에서 파라미터 그룹을 새로 생성(AWS RDS의 기본 시간은 UTC, 기본 파라미터는 수정 불가)
  - 새 파라미터 그룹의 time_zone 값을 'Asia/Seoul'로 변경
  - 사용 중인 DB의 파라미터 그룹 변경 후 인스턴스 재부팅
  
* 이미지 파일 출력 경로 에러
  
  - 이미지 파일 URL = /imgUpload/ + 파일명
  - URL상의 폴더 경로를 다시 서버 폴더 경로로 변환
  - PuTTY에서 tomcat9의 server.xml 접속 후  
  ``` <Context docBase="서버의 업로드 폴더 경로" path="URL의 업로드 폴더 경로"/> ``` 작성  
    
  ![image](https://user-images.githubusercontent.com/98097222/196160138-1ba5c8b6-465a-4dda-92ab-24be04f49a32.png)
  - [참고 블로그](https://kimfk567.tistory.com/m/85?category=1020109)
    
* AWS EC2 배포 후 서버 끊김 에러
  - 프리티어 사용으로 낮은 성능(메모리 부족)
    
    1. 인스턴스 중지 및 시작
       - 재시작 후 PuTTY에서 포트 포워딩 작업 필수  
       ``` $ sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080 ```
      
    2. SWAP 메모리 할당  
       - 프리티어 권장 SWAP 공간은 2G  
       ``` $ sudo dd if=/dev/zero of=/swapfile bs=128M count=16 ```  
       - [참고 블로그](https://velog.io/@chosj1526/%EC%84%9C%EB%B2%84-%EB%81%8A%EA%B9%80)

  
## 6. 회고 / 느낀점
> 
