

**REGEXP_LIKE**
- 일반 like보다 더 복잡한 패턴의 데이터를 검색할 수 있는 함수

 **REGEXP_REPLACE**
- 일반 replace보다 더 복잡한 패턴의 데이터를 다른 데이터로 대체하는 함수

**REGEXP_INSTR**
- 일반 instr보다 더 복잡한 패턴의 철자 또는 단어의 자릿수를 찾는 함수

**REGEXP_SUBSTR**
- 지정된 문자열 내에서 정규식 패턴을 검색하고 일치하는 부분 문자열을 출력하는 함수
- 문법 : REGEXP_SUBSTR(srcstr, pattern, [,position[,occurrence[,match_option]]])
- srcstr : 찾아야 하는 문자로 소스문자열 데이터 타입은 CHAR, VARCHAR2, NCHAR, NVARCHAR2, CLOB, NCLOB임
- pattern : 512바이트까지의 정규표현식으로 데이터타입이 source_char과 다르면 pattern의 데이터타입을 source_char과 같게 변환
- position : Oracle이 문자열에서 특정 문자를 어디에서 찾아야 하는지 위치를 나타냄. 기본으로 1로 설정되어 있으므로, 문자열의 처음부터 검색을 시작.
- occurrence : 검색하고자 하는 문자열에서 특정 문자의 발생 횟수. 기본으로 1로 설정되어 있으며, 이는 Oracle이 문자열에서 첫번째 발생 pattern을 찾는다는 의미.
- match_option : match를 시도할 때의 옵션

**REGEXP_COUNT**
- 문장 내에서 특정 단어가 몇 번 나오는지 출력하는 함수

### 메타문자 
- ^ : 문자열 시작
- $ : 문자열 종료
- .  : 임의의 한 문자
-  \*  : 앞문자가 없을수도 무한정 많을수도
- \+ : 앞문자가 하나 이상
- ? : 앞문자가 없거나 하나 있음
- [] : 문자의 집합이나 범위를 나타내며 두 문자사이는 - 기호로 표시 /. [] 내에서 ^가 선행하여 존재하면 NOT을 의미
- {} : 횟수 또는 범위
- () : 소괄호 안의 문자를 하나의 문자로인식
- | : 패턴 안에서 OR 연산
- \s : 공백문자
- \S : 공백문자가 아닌 문자
- \w : 알파벳이나 숫자
- \W : 알파벳이나 숫자를 제외한 문자

### TRANSLATE
 - TRANSLATE(원본,바꿀문자열,대상문자열)

  

