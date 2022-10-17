# 📜 Sim8log(심플로그)
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
 
</br>
 
## 4. 주요 기능
> [사용자 매뉴얼](https://www.notion.so/877fff312e2a4438905768bcc796e263)  
> [관리자 매뉴얼](https://www.notion.so/9e795512a37a4d1aa31317e9e0d9394c)
  
- 사용자
  - 회원가입 및 로그인
  - 비밀번호 찾기 및 재설정
  - 카테고리별 검색
  - 게시글 작성, 수정, 삭제, 검색
  - 게시글 댓글(답댓글) 작성, 수정, 삭제
  - 게시글 카테고리 추가, 수정, 삭제
  - 회원 간 즐겨찾기
  - 알림 목록 출력
  
- 관리자
  - 회원 정보 조회 및 검색
  - 회원 게시글 조회
  - 회원 강제 탈퇴 및 게시글 강제 삭제
  - 공지사항 작성, 수정, 삭제
  
</br>

## 5. 이슈 목록
* MySQL timezone 설정 에러  
  
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
  - 프리티어 계정 사용으로 낮은 성능 원인(메모리 부족)
    
    1. 인스턴스 중지 및 시작
       - 재시작 후 PuTTY에서 포트 포워딩 작업 필수  
       ``` $ sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080 ```
      
    2. SWAP 메모리 할당  
       - 프리티어 권장 SWAP 공간은 2G  
       ``` $ sudo dd if=/dev/zero of=/swapfile bs=128M count=16 ```  
       - [참고 블로그](https://velog.io/@chosj1526/%EC%84%9C%EB%B2%84-%EB%81%8A%EA%B9%80)
  
</br>

## 6. 느낀 점
> 조금 창의적이고 싶었지만 기본에 충실하자는 마음으로 한 첫 프로젝트 경험이었고 뿌듯한 경험을 한 것 같다. 스프링 프로젝트가 백엔드 개발의 시야를 조금 더 넓힐 수 있었던 계기가 될 수 있었고, 개인 프로젝트로 진행하면서 문제 해결 실력도 많이 향상된 것 같다.  
> 아쉬운 점이 있다면 프로젝트 진행하면서 진행 상황이나 이슈들을 블로그 같은 곳에 기록하고 활용했다면 좋았을걸 싶다. 코드가 길어질수록 어딘가에 찾기 쉽게 기록하는 습관을 들이면 좋을 듯하다. 그리고 API를 더 활용해 보고 싶다. 스프링 기반 이메일 인증 API를 사용했었는데 작은 부분이지만 신기하기도 하고 찾으면 찾을수록 다양한 API가 있구나 느꼈다.
> 그리고 좋았던 점은 다양하게 언어를 경험해 볼 수 있었다는 것이다. 얕지만 유용하게 자주 쓰였던 자바스크립트나 JSP도 재미있게 느껴졌다.
> 나름 어려움도 많이 있었지만 그만큼 몰입할 수 있었고 성취감을 느낄 수 있었던 프로젝트이다.
