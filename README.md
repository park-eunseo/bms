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
* Mysql timezone 설정 문제  
  - AWS RDS에서 파라미터 그룹을 새로 생성(AWS RDS의 기본 시간은 UTC, 기본 파라미터는 수정 불가)
  - 새 파라미터 그룹의 time_zone 값을 'Asia/Seoul'로 변경 <br>
  - 사용 중인 DB의 파라미터 그룹 변경 후 인스턴스 재부팅 <br>
</div>
</details>
</br>

## 6. 회고 / 느낀점
> 
