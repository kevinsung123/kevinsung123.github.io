---
title: "dictionary sort"  
date: 2021-04-23 12:00:00 +0900
categories: [Python,dictionary,sort]
tags: [python,dictionary,sort]
comments: true
pin: true
math: true
mermaid: true
---  


### Dictionary  
[docs 참고](https://docs.python.org/3/tutorial/datastructures.html)  
- 정렬되지 않은 값들을 넣는다  
- map과같이 값들을 저장  
- key, value 쌍으로 이루어짐  
- key는 unique  

---


#### 생성  
- { } (braces)으로 생성  
- comma로 구분  
- mixed key로 생성가능


#### defualtdict
- from collections import defaultdict
- dict클래스의 subclass이다 
- 차이점은 keyerror를 일으키지 않는다
- defaultvalue를 제공

```
dic_list=default(list)
for src,target in tickets:
    dic_lista[src].append(target)
```

#### sorted vs sort
- sort는 자체적으로 리스트를 정렬
- sorted는 정렬하여 새로운 리스트 생성  

#### dictionary 정렬
1. key 기준 정렬
```
sorted(dic_list.keys())
```
2. key,value 알파벳순 정렬
```
sorted(dic_list)
```
3. key, value 기준으로 정렬 => value,key순서대로
```
sorted(dic_list.items(),key=lambda x : (x[1],x[0]))
```


#### 정렬  
- [정렬문서 참고](https://docs.python.org/3/howto/sorting.html#ascending-and-descending)
- sorted(sorted(count_dict.keys()), key=lambda x: count_dict[x])  
- 내림 차순 정렬 reverse=True 추가  
- sorted(iterable,key,reverse)  
- sorted  

    ```  
    count_dict = {}  
    for num in row:  
    if num == 0:  
    continue  
    if num in count_dict:  
    count_dict[num] += 1  
    else:  
    count_dict[num] = 1  
    next_row = []  
    for key in sorted(sorted(count_dict.keys()), key=lambda x: count_dict[x]):  
    next_row.append(key)  
    next_row.append(count_dict[key])  
    next_arr.append(next_row)  
    max_len = max(max_len, len(next_row)  
    sorted(sorted(count_dict.keys()), key=lambda x: count_dict[x]):  
    ```  

#### 접근  
- key로 접근가능  
- ex) Dict['name']=1  
- get 메소드로 접근가능  
- ex) Dict.get('name')=1  

#### 삭제  
- key로 삭제가능  

    ```  
    # Initial Dictionary  
    Dict = { 5 : 'Welcome', 6 : 'To', 7 : 'Geeks',  
    'A' : {1 : 'Geeks', 2 : 'For', 3 : 'Geeks'},  
    'B' : {1 : 'Geeks', 2 : 'Life'}}  
    print("Initial Dictionary: ")  
    print(Dict)  
    
    # Deleting a Key value  
    del Dict[6]  
    print("\nDeleting a specific key: ")  
    print(Dict)  
    
    # Deleting a Key from  
    # Nested Dictionary  
    del Dict['A'][2]  
    print("\nDeleting a key from Nested Dictionary: ")  
    print(Dict)  
    ```  

- pop 메소드 : 출력 후 그 key에해당하는 값 삭제  
    ```  
    # Creating a Dictionary  
    Dict = {1: 'Geeks', 'name': 'For', 3: 'Geeks'}  
    
    # Deleting a key  
    # using pop() method  
    pop_ele = Dict.pop(1)  
    print('\nDictionary after deletion: ' + str(Dict))  
    print('Value associated to poped key is: ' + str(pop_ele))  
    ```

- popitem 메소드 : 임의의 key에 해당하는 key,value 삭제  

    ```  
    #### Creating Dictionary  
    Dict = {1: 'Geeks', 'name': 'For', 3: 'Geeks'}  
    
    #### Deleting an arbitrary key  
    ##### using popitem() function  
    pop_ele = Dict.popitem()  
    print("\nDictionary after deletion: " + str(Dict))  
    print("The arbitrary pair returned is: " + str(pop_ele))  
    ```  
#### clear () : 모든 값 삭제  
  
#### METHODS DESCRIPTION  
- copy() They copy() method returns a shallow copy of the dictionary.  
- clear() The clear() method removes all items from the dictionary.  
- pop() Removes and returns an element from a dictionary having the given key.  
- popitem() Removes the arbitrary key-value pair from the dictionary and returns it as tuple.  
- get() It is a conventional method to access a value for a key.  
- dictionary_name.values() returns a list of all the values available in a given dictionary.  
- str() Produces a printable string representation of a dictionary.  
- update() Adds dictionary dict2’s key-values pairs to dict  
setdefault() Set dict[key]=default if key is not already in dict  
- keys() Returns list of dictionary dict’s keys  
- items() Returns a list of dict’s (key, value) tuple pairs  
- has_key() Returns true if key in dictionary dict, false otherwise  
- fromkeys() Create a new dictionary with keys from seq and values set to value.  
- type() Returns the type of the passed variable.  
- cmp() Compares elements of both dict.
