import UIKit

var str = "Hello, playground"


//2의 10승을 구하시오

var first = 2

for _ in 0..<9{
    first *= 2
}


//사과 고구마 감자 피자 치즈 닭 의 데이터를 이용해서 "내가 좋아하는 "을 붙여서 모두 표현하시오
//내가좋아하는 사과, 내가 좋아하는 고구마~
var food = ["사과", "고구마", "감자", "피자", "치즈", "닭"]

for likeFood in food {
    print("내가 좋아하는 "+likeFood)
}


//1,3,5,7,9를 포문을 사용해서 출력하시오

var start = 1

for i in stride(from: 0, to: 10, by: 2 ){
    print(start + i)
}

// ["빵", "0", "빵","0", "빵"] 0과 빵이 있다. 빵만 출력해보자, var game = ["빵", "0", "빵","0", "빵"]
// 빵 빵 빵


var game = ["빵", "0", "빵","0", "빵"]
for bang in stride(from: 0, to: 5, by: 2){
    print(game[bang])
}


//19단을 출력하시오 a * b = c

for i in 2..<20{
    for j in 1..<20{
        print("\(i) * \(j) = \(i*j)")
    }
}

