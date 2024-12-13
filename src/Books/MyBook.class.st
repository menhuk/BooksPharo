"
Вміє створювати книжку з автором, видатництвом, назвою, роком публікації.
Вміє виводити себе в поток.
"
Class {
	#name : 'MyBook',
	#superclass : 'Object',
	#instVars : [
		'author',
		'title',
		'publishingHouse',
		'yearOfPublication',
		'NumberOfPage'
	],
	#category : 'Books',
	#package : 'Books'
}

{ #category : 'comparing' }
MyBook >> < aMyBook [

	^ self numberOfPages < aMyBook numberOfPages
]

{ #category : 'comparing' }
MyBook >> > aMyBook [

	^ self numberOfPages > aMyBook numberOfPages
]

{ #category : 'accessing' }
MyBook >> author [

	^ author
]

{ #category : 'accessing' }
MyBook >> author: isByteString [

	author := isByteString 
]

{ #category : 'initialization' }
MyBook >> initialize [ 
	super initialize.
	author := ''.
   title := 'LNU book'.
   publishingHouse := 'LNU'.
   yearOfPublication := 1900.
   NumberOfPage := 100.
	
]

{ #category : 'comparing' }
MyBook >> max: aMyBook [

	^ self numberOfPages > aMyBook numberOfPages
		  ifTrue: [ self ]
		  ifFalse: [ aMyBook ]
]

{ #category : 'instance creation' }
MyBook >> new: author title: title publishingHouse: publishingHouse yearOfPublication: yearOfPublication [ [
    | newInstance |
    
    "Створення нового екземпляра класу"
    newInstance := self new.
    
    "Ініціалізація атрибутів"
    newInstance author: author.
    newInstance title: title.
    newInstance publishingHouse: publishingHouse.
    newInstance yearOfPublication: yearOfPublication.
    
    "Повертаємо ініціалізований об'єкт"
    ^ newInstance
]
]

{ #category : 'accessing' }
MyBook >> numberOfPages [

	^ NumberOfPage
]

{ #category : 'accessing' }
MyBook >> numberOfPages: aNumber [

	NumberOfPage := aNumber
]

{ #category : 'printing' }
MyBook >> printOn: aStream [

	aStream nextPutAll: 'Author[';
	print: author.
	aStream nextPutAll: ']title['.
	title printOn: aStream.
	aStream nextPutAll: ']Publishing house['.
	publishingHouse printOn: aStream.
	aStream nextPutAll: ']Year of publication['.
	yearOfPublication printOn: aStream.
	aStream nextPut: $]
]

{ #category : 'accessing' }
MyBook >> publishingHouse [

	^ publishingHouse
]

{ #category : 'accessing' }
MyBook >> publishingHouse: isByteString [

	publishingHouse := isByteString 
]

{ #category : 'accessing' }
MyBook >> title [

	^ title
]

{ #category : 'accessing' }
MyBook >> title: isByteString [

	title := isByteString 
]

{ #category : 'accessing' }
MyBook >> yearOfPublication [

	^ yearOfPublication
]

{ #category : 'accessing' }
MyBook >> yearOfPublication: anInteger [

	yearOfPublication := anInteger max: 1800
]
