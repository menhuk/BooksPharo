Class {
	#name : #BookUI,
	#superclass : #Object,
	#category : #BooksUI
}

{ #category : #'ui-requests' }
BookUI class >> addNewBook [
    | author title publishingHouse yearOfPublication |

    author := UIManager default request: 'Enter the author name:'.
    title := UIManager default request: 'Enter the book title:'.
    publishingHouse := UIManager default request: 'Enter the publishing house:'.
    yearOfPublication := UIManager default request: 'Enter the year of publication:'.

    UIManager default inform: 'New book added: ', author, ', ', title, ', ', publishingHouse, ', ', yearOfPublication.

]
