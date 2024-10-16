Class {
	#name : 'MyLibrary',
	#superclass : 'BundleOfBooks',
	#instVars : [
		'name'
	],
	#category : 'BooksContainer',
	#package : 'BooksContainer'
}

{ #category : 'accessing' }
MyLibrary >> name [

	^ name
]

{ #category : 'accessing' }
MyLibrary >> name: isByteString [

	name := isByteString
]

{ #category : 'removing' }
MyLibrary >> remove: aBook [

	(memory includes: aBook)
		ifTrue: [ memory remove: aBook ]
		ifFalse: [
			Transcript
				show: 'Book not found in library: ';
				show: aBook;
				cr ]
]

{ #category : 'removing' }
MyLibrary >> removeOldBooks: anYear [

	^ memory do: [ :each |
		  (each isKindOf: MyBook) ifTrue: [
			  each yearOfPublication < anYear ifTrue: [ memory remove: each ] ] ]
]

{ #category : 'selection-methods' }
MyLibrary >> selectByAuthor: anAuthor [

	^ memory select: [ :b | b author == anAuthor ]
]

{ #category : 'selection-methods' }
MyLibrary >> selectByPublishingHouse: aPublishingHouse [

	^ memory select: [ :p | p publishingHouse == aPublishingHouse ]
]

{ #category : 'selection-methods' }
MyLibrary >> selectByYearOfPublication: aYearOfPublication [

	^ memory select: [ :y | y yearOfPublication == aYearOfPublication ]
]

{ #category : 'selection-methods' }
MyLibrary >> uniqueBooks [

	^ (memory collect: [ :each | each title ]) asSet asArray
]
