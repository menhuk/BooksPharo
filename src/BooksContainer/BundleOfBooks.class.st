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
		aStream nextPut: Character cr ]
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
