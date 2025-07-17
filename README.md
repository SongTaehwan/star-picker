# 스타픽스

**스타픽스**는 매일 바뀌는 NASA의 Astronomy Picture of the Day(APOD)를 가져와 그리드로 보여주고, 기기에 사진 저장까지 할 수 있는 SwiftUI 기반 iOS 앱입니다.
아래의 기능들을 모두 담고 있습니다.
- Clean Architecture + MVI
- Swift Concurrency
- Core PhotoLibrary 연동
- API 캐싱
- Navigation Coordinator
- 다국어 지원
- 다크 모드

---

## 🚀 주요 기능

- **사진 그리드 화면**  
  - NASA APOD API에서 하루치 사진 20장을 받아와 `LazyVGrid`로 썸네일, 제목, 날짜 표시  
  - Pull-to-Refresh로 언제든지 새로고침 가능

- **사진 상세 모달**  
  - 셀 탭 시 고해상도 이미지, 제목, 날짜, 설명 표시  
  - “Save to Photos” 버튼으로 Photo Library 권한 요청 후 사진 저장  
  - 저장 성공·실패에 따른 Alert

- **오프라인 캐싱**  
  - 세션 내 인메모리 또는 `URLCache` 기반 캐싱으로 중복 네트워크 요청 방지

- **다국어 지원 & 다크 모드**  
  - 영어(en)·한국어(ko) `Localizable.strings`  
  - 시스템 Light/Dark 모드 자동 대응

---
