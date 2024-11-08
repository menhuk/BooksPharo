Class {
	#name : #AddBookDialog,
	#superclass : #Object,
	#instVars : [
		'bookType',
		'title',
		'author',
		'yearOfPublication',
		'bookToAdd'
	],
	#category : #BooksUI
}

{ #category : #accessing }
AddBookDialog >> bookType [
    "Return the current book type."
    "scope: instance-variables"
    ^ bookType

]

{ #category : #accessing }
AddBookDialog >> bookType: aString [
    "Set the book type and update the dialog UI accordingly."
    "scope: instance-variables"
    bookType := aString.
    self updateDialogForBookType.
]

{ #category : #'as yet unclassified' }
AddBookDialog >> bookTypes [
    "Return the available book types."
    "scope: instance-variables"
    ^ OrderedCollection with: 'Monograph' with: 'MultivolumeEdition'.
]

{ #category : #'as yet unclassified' }
AddBookDialog >> buildDialogUI: builder [
    "Build the user interface elements for adding a new book."
    "scope: instance-variables"
    builder 
        verticalGroup: [
            builder label: 'Add New Book'.
            builder dropdownList: #bookType items: #bookTypes.
            builder inputField: #title label: 'Title'.
            builder inputField: #author label: 'Author'.
            builder inputField: #yearOfPublication label: 'Year'.
            builder button: 'Add' action: #addBook.
            builder button: 'Cancel' action: #cancel.
        ].
]

{ #category : #actions }
AddBookDialog >> cancel [
    "Close the add book dialog."
    "scope: instance-variables"
    self close.
]

{ #category : #initialization }
AddBookDialog >> initialize [
    "Initialize the AddBookDialog instance with default values."
    "scope: instance-variables"
    super initialize.
    bookType := 'Monograph'.
    title := ''.
    author := ''.
    yearOfPublication := 2024.

]

{ #category : #accessing }
AddBookDialog >> window [
    "Create and return the dialog window for adding a new book."
    "scope: instance-variables"
    ^ (SpWindow  new)
        title: 'Add New Book';
        content: [ :builder | self buildDialogUI: builder ];
        yourself.
]
