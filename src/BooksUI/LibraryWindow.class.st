Class {
	#name : 'LibraryWindow',
	#superclass : 'Object',
	#instVars : [
		'mainWindow',
		'library',
		'bookList',
		'addButton'
	],
	#category : 'BooksUI',
	#package : 'BooksUI'
}

{ #category : 'initialization' }
LibraryWindow >> initialize [ [
        library := BundleOfBooks new.
        self initializeWindow
    ]
]

{ #category : 'initialization' }
LibraryWindow >> initializeWindow [ [
    mainWindow := SpWindow new.
    mainWindow title: 'Library Manager'.
    
    "Створюємо таблицю для відображення книг"
     
    bookList := SpListPresenter new.
    bookList items: library memory asArray.
    bookList displayBlock: [ :book | book title ].
    
    "Кнопка для додавання нової книги"
    
    addButton := SpButtonPresenter new.
    addButton label: 'Add Book'.
    addButton action: [ self openAddBookDialog ].

    "Додаємо елементи до вікна"
    mainWindow add: bookList.
    mainWindow add: addButton.
    
    "Відображаємо головне вікно"
    mainWindow open
]
]

{ #category : 'instance creation' }
LibraryWindow >> open [ [
        
        ^ self new open
    ]
]

{ #category : 'dialog' }
LibraryWindow >> openAddBookDialog [ [
    | dialog typeChoice author title publishingHouse year pagesOrVolumes pagesOrIllustrations |
    
    dialog := AboutDialogWindow new.
    dialog title: 'Add a New Book'.

    "Вибір типу книги"
    typeChoice := SpComponentListPresenter new.
    typeChoice items: #('Monograph' 'Multivolume Edition').
    typeChoice selection: 'Monograph'.

    "Поле для введення автора, назви, видавництва, року"
    author := SpTextPresenter new.
    title := SpTextPresenter new.
    publishingHouse := SpTextPresenter new.
    year := SpTextPresenter new.

    "Залежні поля для кількості сторінок або ілюстрацій, томів"
    pagesOrVolumes := SpTextPresenter new.
    pagesOrIllustrations := SpTextPresenter new.

    "Зміна вмісту діалогу залежно від вибраного типу книги"
    typeChoice whenSelectionChangedDo: [
        typeChoice selection = 'Monograph'
            ifTrue: [
                dialog label: 'Pages'.
                pagesOrVolumes label: 'Number of Pages'.
                pagesOrIllustrations label: 'Number of Illustrations'.
            ]
            ifFalse: [
                dialog label: 'Volumes'.
                pagesOrVolumes label: 'Number of Volumes'.
                pagesOrIllustrations label: 'Pages per Volume (comma-separated)'.
            ].
    ].

    "Додаємо елементи до діалогу"
    dialog addAll: { typeChoice. author. title. publishingHouse. year. pagesOrVolumes. pagesOrIllustrations }.

    "Кнопка підтвердження"
    dialog okAction: [
        | newBook |
        
        typeChoice selection = 'Monograph'
            ifTrue: [
                newBook := Monograph new: author text title: title text publishingHouse: publishingHouse text yearOfPublication: year text asInteger.
                newBook numberOfPages: pagesOrVolumes text asInteger.
                newBook numberOfIllustrations: pagesOrIllustrations text asInteger.
            ]
            ifFalse: [
                newBook := MultivolumeEdition new: author text title: title text publishingHouse: publishingHouse text yearOfPublication: year text asInteger.
                newBook numberOfVolumes: pagesOrVolumes text asInteger.
                newBook numberOfPages: (pagesOrIllustrations text findTokens: ',') collect: [ :each | each asInteger ].
            ].
        
        library add: newBook.
    ].

    dialog open.
]
]
