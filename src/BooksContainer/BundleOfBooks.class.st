Class {
	#name : 'BundleOfBooks',
	#superclass : 'Object',
	#instVars : [
		'memory'
	],
	#category : 'BooksContainer',
	#package : 'BooksContainer'
}

{ #category : 'loading' }
BundleOfBooks class >> example_1 [

	<script>
	self new
		addAll: {
				((((MultivolumeEdition new author: 'Conan Doil') )
					  numberOfVolumes: 3) numberOfPagesInVolume: { 100. 200. 500 }).
				((((MultivolumeEdition new author: 'Joan Rolling') )
					  numberOfVolumes: 3) numberOfPagesInVolume: { 100. 200. 1000 }).
				((((MultivolumeEdition new author: 'Jack London') )
					  numberOfVolumes: 3) numberOfPagesInVolume: { 400. 200. 500 }).
				(((Monograph new author: 'Shevchenko')) numberOfPages:
						 600).
				(((Monograph new author: 'Lesya Ukrainka'))
					 numberOfPages: 200) };
		saveToFile: 'example_1.ston'.
	UIManager default inform: 'Books are added to the file'
]

{ #category : 'loading' }
BundleOfBooks class >> example_2 [

	<script>
	^ self pickFileAndLoad: '*.ston'
]

{ #category : 'loading' }
BundleOfBooks class >> example_3 [

	<script>
	| bundleOfBooks book1 book2 book3 book4 book5 greatestBook authorBooks selectedAuthor |
	"1. Створення п’яти різних книг і додавання їх у контейнер:"
	bundleOfBooks := self new.
	book1 := MyBook new
		         author: 'Author One';
		         title: 'First Book';
		         publishingHouse: 'Publisher A';
		         yearOfPublication: 1995.
	book2 := MultivolumeEdition new
		         author: 'Author Two';
		         title: 'Multi Book 1';
		         publishingHouse: 'Publisher B';
		         yearOfPublication: 2001;
		         numberOfVolumes: 3;
		         numberOfPagesInVolume: #( 150 200 250 ).
	book3 := MultivolumeEdition new
		         author: 'Author Three';
		         title: 'Multi Book 2';
		         publishingHouse: 'Publisher C';
		         yearOfPublication: 2010;
		         numberOfVolumes: 2;
		         numberOfPagesInVolume: #( 300 500 ).
	book4 := Monograph new
		         author: 'Author Four';
		         title: 'Monograph 1';
		         publishingHouse: 'Publisher D';
		         yearOfPublication: 2005;
		         numberOfPages: 350;
		         numberOfIllustrations: 15.
	book5 := Monograph new
		         author: 'Author Five';
		         title: 'Monograph 2';
		         publishingHouse: 'Publisher E';
		         yearOfPublication: 2020;
		         numberOfPages: 500;
		         numberOfIllustrations: 25.
	bundleOfBooks addAll: {
			book1.
			book2.
			book3.
			book4.
			book5 }.
	"3. Друк усіх елементів контейнера:"
	bundleOfBooks printOn: Transcript.
	"4. Знайти найбільшу за обсягом книгу і перевірити, чи це багатотомник:"
	greatestBook := bundleOfBooks greatestBook.
	Transcript
		show: 'The largest book is: ';
		print: greatestBook;
		cr.
	(greatestBook isKindOf: MultivolumeEdition)
		ifTrue: [
			Transcript
				show: 'It is a multivolume edition.';
				cr ]
		ifFalse: [
			Transcript
				show: 'It is not a multivolume edition.';
				cr ].
	"5. Продемонструвати використання арифметичних операторів:"
	book2 > book3
		ifTrue: [
			Transcript
				show: 'book2 has more pages than book3.';
				cr ]
		ifFalse: [
			Transcript
				show: 'book3 has more pages than book2.';
				cr ].
	"6. Створити нову колекцію книг певного автора:"
	selectedAuthor := UIManager default request:
		                  'Enter the author to filter books:'.
	authorBooks := bundleOfBooks ofType: MyBook.
	authorBooks := authorBooks select: [ :book |
		               book author = selectedAuthor ].

	Transcript
		show: 'Books by ' , selectedAuthor , ': ';
		cr.
	authorBooks do: [ :book | book printOn: Transcript ].
	"7. Записує інформацію про об'єкт у файл"
	bundleOfBooks printToFile: 'books.txt'
]

{ #category : 'loading' }
BundleOfBooks class >> example_4 [
	"2. Діалог для введення інформації про нову книгу:"

	<script>
	| author title publishingHouse yearOfPublication book |
	author := UIManager default request: 'Enter the author of the book:'.
	title := UIManager default request: 'Enter the title of the book:'.
	publishingHouse := UIManager default request:
		                   'Enter the publishing house:'.
	yearOfPublication := (UIManager default
		                      request: 'Enter the year of publication:'
		                      initialAnswer: '2024') asInteger.

	book := MyBook new
		        author: author;
		        title: title;
		        publishingHouse: publishingHouse;
		        yearOfPublication: yearOfPublication.
	self new add: book
]

{ #category : 'loading' }
BundleOfBooks class >> loadFromCodeFile: pathString [

	pathString asFileReference readStreamDo: [ :in |
		^ Smalltalk compiler evaluate: in contents ]
]

{ #category : 'loading' }
BundleOfBooks class >> loadFromStonFile: pathString [

	pathString asFileReference readStreamDo: [ :in |
		^ (STON reader on: in) next ]
]

{ #category : 'services' }
BundleOfBooks class >> pickFileAndLoad: pattern [

	| pathString |
	pathString := UIManager default
		              chooseFullFileNameMatching: { pattern }
		              label: 'Choose file to open'.
	pathString ifNil: [ ^ nil ].
	'*.ston' = pattern ifTrue: [ ^ self loadFromStonFile: pathString ].
	'*.stc' = pattern ifTrue: [ ^ self loadFromCodeFile: pathString ].
	^ self error: 'Unknown type of file: ' , pattern
]

{ #category : 'adding' }
BundleOfBooks >> add: aBook [

	^ memory add: aBook
]

{ #category : 'adding' }
BundleOfBooks >> addAll: aBookCollection [

	^ memory addAll:
		  (aBookCollection select: [ :x | x isKindOf: MyBook ])
]

{ #category : 'adding' }
BundleOfBooks >> addFirst: aBook [

	^ memory addFirst: aBook
]

{ #category : 'accessing' }
BundleOfBooks >> at: anIndex [

	^ memory at: anIndex
]

{ #category : 'accessing' }
BundleOfBooks >> at: anIndex put: aBook [

	^ memory at: anIndex put: aBook
]

{ #category : 'enumerating' }
BundleOfBooks >> do: aBlock [

	memory do: aBlock
]

{ #category : 'enumerating' }
BundleOfBooks >> greatestBook [

	^ memory inject: (memory at: 1) into: [ :s :x | s max: x ]
]

{ #category : 'initialization' }
BundleOfBooks >> initialize [

	memory := OrderedCollection new
]

{ #category : 'enumerating' }
BundleOfBooks >> ofType: aType [

	^ self class new
		  addAll: (memory select: [ :x | x isMemberOf: aType ]);
		  yourself
]

{ #category : 'printing' }
BundleOfBooks >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $:;
		nextPut: Character cr.
	memory do: [ :aBook |
		aStream nextPutAll: ' - '.
		aBook printOn: aStream.
		aStream nextPut: Character cr]
]

{ #category : 'saving' }
BundleOfBooks >> printToFile: pathString [

	pathString asFileReference writeStreamDo: [ :out |
		out nextPutAll: self printString ]
]

{ #category : 'saving' }
BundleOfBooks >> saveToFile: pathString [

	pathString asFileReference writeStreamDo: [ :out |
		out nextPutAll: (STON toString: self) ]
]

{ #category : 'accessing' }
BundleOfBooks >> size [

	^ memory size
]

{ #category : 'saving' }
BundleOfBooks >> storeToFile: pathString [

	pathString asFileReference writeStreamDo: [ :out |
		out nextPutAll: self storeString ]
]
