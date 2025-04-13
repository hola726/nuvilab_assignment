# nuvilab_assignment

Flutter로 구현된 Nuvilab 과제로 공공API인 [LPG 휴게소 현황 API](https://data.ex.co.kr/openapi/basicinfo/openApiInfoM?apiId=0314)를 사용하여 LPG 충전소 정보를 제공하는 앱입니다.
## Prerequisite

|    NAME     | VERSION |
|:-----------:|:-------:|
|   Flutter   | 3.29.0  |

## 📟 Project Stack
- Flutter
- Dio
- Hive
- Firebase messaging
- Firebase Crashlytics
- Flutter riverpod
- Freezed

## 앱 설치 및 실행방법

```` bash
> git clone https://github.com/hola726/nuvilab_assignment.git
> cd nuvilab_assignment 
````

```` bash
> flutter pub get
````
```` bash
> flutter run
````
### Firebase 설정
- Android: google-services.json을 android/app/에 추가.
- iOS: GoogleService-Info.plist를 ios/Runner/에 추가.
- firebase_options.dart를 /lib에  추가

### 공공 API Key 설정
- lib/constants.dart 에 apiKey를 추가.


## 성능 최적화 전략
- infinite_scroll_pagination 패키지 사용으로 페이지 별로 데이터를 조회 및 보여지는 화면만 렌더링하여 성능 최적화
- 지수 백오프 알고리즘으로 시스템 과부하 방지
- Hive를 사용하여 로컬 데이터 캐싱 및 오프라인 상태에서도 데이터 조회 가능

## 구현 기능

- [x] 푸쉬알림을 받아서 딥링크 처리( ios는 push notification을 사용할 수 없어 구현하지 않음 )
- [x] 네트워크 단절시 로컬데이터 활용
- [x] material3사용 및 다크모드 설정
- [x] http status별로 에러처리
- [x] 네트워크 및 서버 오류 구분해서 사용자에게 알림
- [x] 가로 세로 모드 별로 ui 변경
- [x] api 요청 실패시 재시도 로직(지수 백오프 알고리즘, 최대 5회)
- [x] Firbase Crashlytics 연동
## 미구현 기능
- [ ] workmanager 백그라운드 주기적 데이터갱신
- [ ] SSL Pinning
- [ ] 테스트 코드
## 문제 해결
### 네트워크 연결 끊김 시 무한 로딩 발생
- 원인분석: api 요청시 네트워크 연결 상태 체크와 서버 에러 응답시 에러처리를 하지 않아서 발생
- 재현가능 방법: 
  - 모든 인터넷 연결을 끊고(wifi 또는 셀룰러 데이터) api 요청
- 해결방법: 
  - dio interceptor를 사용하여 api 요청시 네트워크 연결 상태 체크 및 status code별 처리 및 지수 백오프 알고리즘 적용한 재시도 로직 추가
### 푸시 알림 클릭시 딥링크 이동 실패
- 원인분석: fcm처리를 foreground와 앱이꺼져있을 때 처리하는 방법을 구현했지만, background상황일때는 처리가 안되어있음
- 재현가능 방법: 
  - 앱 background 상태에서 푸시 알림 클릭 -> 앱이 foreground로 이동하지만 딥링크 이동 실패
- 해결방법: 
  - FirebaseMessaging.onBackgroundMessage()를 사용하여 background상태에서 푸시 알림 클릭시 딥링크 이동 처리
### 서버 데이터 결측치(null)로 인한 앱 강제 종료
- 원인분석: 서버에서 제공하는 데이터에 결측치가 존재하여 앱에서 null처리를 및 예외처리 부재로 인해 앱이 강제 종료됨
- 재현가능 방법: 
  - 서버에서 제공하는 데이터에 결측치가 존재하는 경우
- 해결방법: 
  - 서버에서 제공하는 데이터에 결측치가 존재하는 경우 null처리 및 예외처리 추가
