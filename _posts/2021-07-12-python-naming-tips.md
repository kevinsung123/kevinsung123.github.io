---
title: "Naming Tips"  
date: 2021-07-12 12:00:00 +0900
categories: [Python,naming]
tags: [python,naming]
comments: true
pin: true
math: true
mermaid: true
---  



### 1. Don't use save/load without to/from
- `save_user_to_mongo` (O)
- `save_user`(X)
- `load_categories_from_cache` (O)
- `load_categories`(x)


### 2. Use test_<entity>_<behavior> template for test names
- `validate_user_from`이라 불리는 func을 위한 unit test를 작성한다고 가정하자
- bad example
    - `test_validation_ok`
    - `test_user_can_submit_profile_data`
    - `test_test_test`
    - `test_asfqerfjeghmnsa`
- good example
    - `test_validate_user_from_raises_no_errors_on_correct_data`
    - `test_validate_user_from_raises_an_error_on_empty_eamil`
- `behaviour part`가 중요함(우리가 무엇을 테스트하는지 정확히 명시해야함)
- 예를들어 `works_fine`그리고 `is_ok`라는 behaviour part를 사용한다고 할때, 실패시 다시 한번 무엇을 테스트 하는지 확인이 필요하다
- 위와 같은 이름은 테스트에 오랜 시간이 필요하다 

### 3. Beware of using and
- bad example
    - `processes_and_save_profile_info` 는 읽기에는 좋지만 여전히 나쁨
- 그러나 성격에 의해 위의 example은  아래와 같이 되어야함
    - `clean_profile_info`
    - `save_profile_info_to_db`
- 위의 규칙은 `single-reponsibility principle(단일 책임 원칙)`과 `command-query separation pattern(명령 쿼리 분리 패턴)`에 관련이 있음

### 4. Make a function name readable with its argumnets 
-  bad example
    - `list_item_to_marketplace(marketplace,item)`
- good example
    - `list_item_to(marketplace, item)`
- 위의 rule은 function name을 좀더 간략하고 이해하기 쉽게 만들어줌 
- 이러한 예들은 가끔 preposition(전치사)로 끝남 `_at`, `_to`, `_in` 등등

### 5. Think of repeating entity type in a function name
- `parsers=[integer, string]`

### 6. Keep function names as short as possible (without hurt to a context)
- bad example
    - `save_full_user_profile_to_postgresql_storage_sync` 
- goode example
    - `save_full_profile_data_to_postgresql_sync` 
    - postgrelsql은 storage알고 있으므로 생략
- 프로젝트에서 모든 func이 synchronous하다면 `_sync`부분을 제거히야함  `save_user_profile_to_postgresql`
- 마지막으로 `postgresql`을 `db`로 치환
- 마지막 결과는 `save_user_profile_to_db`
- func의 이름은 의미있는 context와 length 최적화를 생갹해야함

### 7. Use subject area vocabulary
- 프로젝트에서  찾을 수 있는 모든 영역별 의미와 함께 어휘를 기록하는 것이 좋음

### 8. Forbid typos
- automation을 설정하여 code 내부에서 이름 오류 체크를 설정
- 만약 발견되면, build에 오류를 내뱉음
- `scspell` (python library)를 사용
    - 여러 특정 단어를 한 공간에 모는 장점이 있음
    - 이전 article의 단어를 체크함

### 9. Don't forget about grammar
- bad 
    - `are_user_active`
- good
    - `is_user_active`
- 보통 func이름은 기본 문법을 사용 
    - is/are, have/has, present/ast, simple/perfact 

### 10. Check if a function call is readable
- func을 작서할때 어떻게 그리고 어디서 func이 호출되는지 생각
- 거기에 적합한지 읽을만한지 생각
- good name은 2군데에서 읽을만해야함
    - where the function is defined and called
- all you need is to thinks aboud a second case : will the nmae look readbale when fucntion is called

### 참고
- [medium - Python functions naming: 10 tips](https://melevir.medium.com/python-functions-naming-tips-376f12549f9)