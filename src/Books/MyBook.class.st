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
		'yearOfPublication'
	],
	#category : 'Books',
	#package : 'Books'
}

{ #category : 'accessing' }
MyBook >> author [

	^ author
]

{ #category : 'accessing' }
MyBook >> author: isByteString [

	author := isByteString 
]

{ #category : 'printing' }
MyBook >> printOn: aStream [

	aStream nextPutAll: 'Author['.
	author printOn: aStream.
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
MyBook >> yearOfPublication: aNumber [

	yearOfPublication := aNumber > 0.1
		                     ifTrue: aNumber
		                     ifFalse: 0.1
]
