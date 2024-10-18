Class {
	#name : #LibraryMainWindow,
	#superclass : #Object,
	#instVars : [
		'library',
		'booksList'
	],
	#category : #BooksUI
}

{ #category : #'instance creation' }
LibraryMainWindow class >> open [
    "Open a new instance of LibraryMainWindow."
    "scope: class-variables"
    | mainWindow |
    mainWindow := self new.
    mainWindow window open.

]

{ #category : #accessing }
LibraryMainWindow >> bookSelected: aBook [
    "Handle the logic when a book is selected from the list."
    "scope: instance-variables"
    "Logic to be implemented based on application needs."

]

{ #category : #accessing }
LibraryMainWindow >> booksList [
    "Return the list of books in the library."
    "scope: instance-variables"
    ^ booksList

]

{ #category : #accessing }
LibraryMainWindow >> buildMainUI: builder [
    "Build the main user interface elements for the library management system."
    "scope: instance-variables"
    builder 
        verticalGroup: [
            builder label: 'Library Management System'.
            builder list: #booksList selection: #bookSelected:.
            builder button: 'Add Book' action: #openAddBookDialog.
            builder button: 'Remove Book' action: #removeSelectedBook.
        ].

]

{ #category : #initialization }
LibraryMainWindow >> initialize [
    "Initialize the LibraryMainWindow instance with a new library and populate the books list."
    "scope: instance-variables"
    | |
    super initialize.
    library := MyLibrary new.
    booksList := OrderedCollection newFrom: library books.
]

{ #category : #accessing }
LibraryMainWindow >> openAddBookDialog [
    "Open the dialog to add a new book to the library."
    "scope: instance-variables"
    (AddBookDialog new) openWithSpec.

]

{ #category : #accessing }
LibraryMainWindow >> removeSelectedBook [
    "Remove the selected book from the library."
    "scope: instance-variables"
    | selectedBook |
    selectedBook := self bookSelected.
    selectedBook ifNotNil: [ booksList remove: selectedBook ].

]

{ #category : #accessing }
LibraryMainWindow >> title [
    "Return the title for the main window."
    "scope: instance-variables"
    ^ 'Library Management System'

]

{ #category : #accessing }
LibraryMainWindow >> window [
    "Create and return the main window for the library management system."
    "scope: instance-variables"
    ^ (SpecWindow new)
        title: self title;
        content: [ :builder | self buildMainUI: builder ];
        yourself.

]
