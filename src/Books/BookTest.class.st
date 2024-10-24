Class {
	#name : 'BookTest',
	#superclass : 'TestCase',
	#category : 'Books',
	#package : 'Books'
}

{ #category : 'running' }
BookTest >> setUp [
	|myBook|
	myBook := MyBook new.

	"Put here a common initialization logic for tests"
]

{ #category : 'tests' }
BookTest >> testMaxMethod [ [
    | book1 book2 result |

    "Створення двох книг для тестування"
    book1 := MyBook new: 'Author A' title: 'Book A' publishingHouse: 'Publisher A' yearOfPublication: 2000.
    book1 numberOfPages: 300.

    book2 := MyBook new: 'Author B' title: 'Book B' publishingHouse: 'Publisher B' yearOfPublication: 2005.
    book2 numberOfPages: 500.

    "Тестування методу max:"
    result := book1 max: book2.

    "Очікуємо, що book2 буде з більшою кількістю сторінок"
    self assert: result = book2.
]
]
