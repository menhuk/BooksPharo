"
Клас багатотомне видання має кількість томів та сторінок у кожному томі
"
Class {
	#name : 'MultivolumeEdition',
	#superclass : 'MyBook',
	#instVars : [
		'NumberOfVolumes',
		'NumberOfPagesInVolume'
	],
	#category : 'Books',
	#package : 'Books'
}

{ #category : 'comparing' }
MultivolumeEdition >> < aMultivolumeEdition [ 

	^ self numberOfPagesInVolume sum < aMultivolumeEdition numberOfPagesInVolume sum
]

{ #category : 'comparing' }
MultivolumeEdition >> > aMultivolumeEdition [ 

	^ self numberOfPagesInVolume sum > aMultivolumeEdition numberOfPagesInVolume sum
]

{ #category : 'comparing' }
MultivolumeEdition >> max: aMultivolumeEdition [

	^ self numberOfPagesInVolume sum
	  > aMultivolumeEdition numberOfPagesInVolume sum
		  ifTrue: [ self ]
		  ifFalse: [ aMultivolumeEdition ]
]

{ #category : 'accessing' }
MultivolumeEdition >> numberOfPagesInVolume [

	^ NumberOfPagesInVolume
]

{ #category : 'accessing' }
MultivolumeEdition >> numberOfPagesInVolume: anArray [

	NumberOfPagesInVolume := anArray size > self numberOfVolumes ifTrue: 'error' ifFalse: anArray
]

{ #category : 'accessing' }
MultivolumeEdition >> numberOfVolumes [

	^ NumberOfVolumes
]

{ #category : 'accessing' }
MultivolumeEdition >> numberOfVolumes: aNumber [

	NumberOfVolumes := aNumber
]

{ #category : 'printing' }
MultivolumeEdition >> printOn: aStream [

	aStream nextPutAll: 'Author['.
	author printOn: aStream.
	aStream nextPutAll: ']title['.
	title printOn: aStream.
	aStream nextPutAll: ']Publishing house['.
	publishingHouse printOn: aStream.
	aStream nextPutAll: ']Year of publication['.
	yearOfPublication printOn: aStream.
	aStream nextPutAll: ']Number of volumes['.
	NumberOfVolumes printOn: aStream.
	aStream nextPutAll: ']Number of Pages in each volume '.
	NumberOfPagesInVolume printOn: aStream.
]

{ #category : 'calculating' }
MultivolumeEdition >> printedSheets [

	^ (self numberOfPagesInVolume sum / 32) asInteger
]
