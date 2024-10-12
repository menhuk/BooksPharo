Class {
	#name : #BookUI,
	#superclass : #Object,
	#category : #BooksUI
}

{ #category : #'ui-requests' }
BookUI class >> addNewBook [
    | author title publishingHouse yearOfPublication formValues newBook |

    "Запит на введення деталей книги"
    formValues := UIManager default request: 'Enter book details separated by commas: Author, Title, Publishing House, Year of Publication' initialAnswer: 'Author,Title,PublishingHouse,Year'.
    
    "Розділення введення на частини"
    formValues := formValues substrings: ','.

    "Перевірка на кількість введених значень"
    (formValues size = 4) ifFalse: [
        UIManager default inform: 'Invalid input format. Please provide exactly 4 values: Author, Title, Publishing House, Year of Publication.'.
        ^ self addNewBook. "Запросити введення знову, якщо формат неправильний"
    ].

    newBook := MyBook new.
    newBook author: (formValues at: 1).
    newBook title: (formValues at: 2).
    newBook publishingHouse: (formValues at: 3).
    newBook yearOfPublication: (formValues at: 4) asInteger.

    UIManager default inform: 'New book added: ', 
        (formValues at: 1), ', ', 
        (formValues at: 2), ', ', 
        (formValues at: 3), ', ', 
        (formValues at: 4).

    ^ newBook.

]

{ #category : #'ui-requests' }
BookUI class >> addNewMonograph [
    | author title publishingHouse yearOfPublication NumberOfPages NumberOfIllustrations formValues newMonograph |
    
    formValues := UIManager default request: 'Enter monograph details separated by commas: Author, Title, Publishing House, Year, Pages, Illustrations' initialAnswer: 'Author,Title,PublishingHouse,Year,Pages,Illustrations'.
    formValues := formValues substrings: ','.

    newMonograph := Monograph new.
    newMonograph author: (formValues at: 1).
    newMonograph title: (formValues at: 2).
    newMonograph publishingHouse: (formValues at: 3).
    newMonograph yearOfPublication: (formValues at: 4) asInteger.
    newMonograph numberOfPages: (formValues at: 5) asInteger .
    newMonograph numberOfIllustrations: (formValues at: 6) asInteger .

    UIManager default inform: 'New monograph added: ', (formValues at: 1), ', ', (formValues at: 2), ', ', (formValues at: 3), ', ', (formValues at: 4), ', Pages: ', (formValues at: 5), ', Illustrations: ', (formValues at: 6).

	^ newMonograph. 
]

{ #category : #'ui-requests' }
BookUI class >> addNewMultivolumeEdition [
    | author title publishingHouse yearOfPublication numberOfVolumes numberOfPagesInVolume formValues newEdition |

    formValues := UIManager default request: 'Enter multivolume edition details separated by commas: Author, Title, Publishing House, Year, Volumes, Pages per Volume' initialAnswer: 'Author,Title,PublishingHouse,Year,Volumes,PagesPerVolume'.
    formValues := formValues substrings: ','.

    "Перевірка, чи введено правильну кількість значень"
    (formValues size = 6) ifFalse: [
        UIManager default inform: 'Invalid input format. Please use the format: Author, Title, Publishing House, Year, Volumes, Pages per Volume'.
        ^ self addNewMultivolumeEdition. "Запросити введення знову, якщо формат неправильний"
    ].

    newEdition := MultivolumeEdition new.
    newEdition author: (formValues at: 1).
    newEdition title: (formValues at: 2).
    newEdition publishingHouse: (formValues at: 3).
    newEdition yearOfPublication: (formValues at: 4).
    newEdition numberOfVolumes: (formValues at: 5) asInteger.
    newEdition numberOfPagesInVolume: (formValues at: 6) asInteger.

    UIManager default inform: 'New multivolume edition added: ', 
        (formValues at: 1), ', ', 
        (formValues at: 2), ', ', 
        (formValues at: 3), ', ', 
        (formValues at: 4), ', Volumes: ', 
        (formValues at: 5), ', Pages per volume: ', 
        (formValues at: 6).

    ^ newEdition.

]

{ #category : #'ui-requests' }
BookUI class >> addNewPublication [
    | type |

    type := UIManager default chooseFrom: #('Book' 'Monograph' 'Multivolume Edition') title: 'Choose type of publication:'.

    type = 'Book' ifTrue: [ self addNewBook ].
    type = 'Monograph' ifTrue: [ self addNewMonograph ].
    type = 'Multivolume Edition' ifTrue: [ self addNewMultivolumeEdition ].

]
