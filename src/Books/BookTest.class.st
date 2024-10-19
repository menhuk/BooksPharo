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
