"
Клас монографія має кількість ілюстрацій та кількість сторінок
"
Class {
	#name : 'Monograph',
	#superclass : 'MyBook',
	#instVars : [
		'NumberOfPages',
		'NumberOfIllustrations'
	],
	#category : 'Books',
	#package : 'Books'
}

{ #category : 'comparing' }
Monograph >> < aMonograph [

	^ self numberOfPages < aMonograph numberOfPages
]

{ #category : 'comparing' }
Monograph >> > aMonograph [

	^ self numberOfPages > aMonograph numberOfPages
]

{ #category : 'initialization' }
Monograph >> initialize [ [
    super initialize.
    
    "Set default values for instance variables"
    author := 'Unknown Author'.
    title := 'Untitled'.
    publishingHouse := 'Unknown Publisher'.
    yearOfPublication := 2000.
    NumberOfPages := 0.
    NumberOfIllustrations := 0.
]
]

{ #category : 'comparing' }
Monograph >> max: aMonograph [

	^ self numberOfPages > aMonograph numberOfPages
		  ifTrue: [ self ]
		  ifFalse: [ aMonograph ]
]

{ #category : 'initialization' }
Monograph >> new: author title: title publishingHouse: publishingHouse yearOfPublication: year numberOfPages: pages numberOfIllustrations: illustrations [ [
    | newInstance |
    
    "Create a new instance of Monograph"
    newInstance := self new.

    "Initialize the instance variables with given parameters"
    newInstance author: author.
    newInstance title: title.
    newInstance publishingHouse: publishingHouse.
    newInstance yearOfPublication: year.
    newInstance numberOfPages: pages.
    newInstance numberOfIllustrations: illustrations.
    
    "Return the initialized instance"
    ^ newInstance
]
]

{ #category : 'accessing' }
Monograph >> numberOfIllustrations [

	^ NumberOfIllustrations
]

{ #category : 'accessing' }
Monograph >> numberOfIllustrations: aNumber [

	NumberOfIllustrations := aNumber
]

{ #category : 'accessing' }
Monograph >> numberOfPages [

	^ NumberOfPages
]

{ #category : 'accessing' }
Monograph >> numberOfPages: aNumber [

	NumberOfPages := aNumber
]

{ #category : 'printing' }
Monograph >> printOn: aStream [

	aStream nextPutAll: 'Author['.
	author printOn: aStream.
	aStream nextPutAll: ']title['.
	title printOn: aStream.
	aStream nextPutAll: ']Publishing house['.
	publishingHouse printOn: aStream.
	aStream nextPutAll: ']Year of publication['.
	yearOfPublication printOn: aStream.
	aStream nextPutAll: ']Number of pages['.
	NumberOfPages printOn: aStream.
	aStream nextPutAll: ']Number of illustrations['.
	NumberOfIllustrations printOn: aStream.
	aStream nextPut: $]
]

{ #category : 'calculating' }
Monograph >> printedSheets [

	^ (self numberOfPages / 32) asInteger
]
