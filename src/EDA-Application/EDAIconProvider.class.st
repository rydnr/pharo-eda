Class {
	#name : #EDAIconProvider,
	#superclass : #Object,
	#instVars : [
		'icons',
		'locations'
	],
	#classVars : [
		'DefaultLocations',
		'IconsFolder'
	],
	#category : #'EDA-Application-Icons'
}

{ #category : #defaults }
EDAIconProvider class >> addDefaultLocation: aFolder [

	DefaultLocations add: aFolder
]

{ #category : #defaults }
EDAIconProvider class >> defaultLocations [

	^ DefaultLocations ifNil: [ DefaultLocations := OrderedCollection with: FileSystem workingDirectory / 'resources' / 'icons'
		  with: self iconsFolder ]
]

{ #category : #defaults }
EDAIconProvider class >> iconsFolder [

	^ IconsFolder
]

{ #category : #defaults }
EDAIconProvider class >> iconsFolder: aFolder [

	IconsFolder ifNil: [ IconsFolder := aFolder ]
]

{ #category : #initialization }
EDAIconProvider >> addLocation: aFileReference [

	self locations add: aFileReference
]

{ #category : #accessing }
EDAIconProvider >> iconNamed: aName ifAbsent: aBlock [

    | icon |
    icon := icons at: aName ifAbsent: [ nil ].
    icon ifNil: [ 
        icon := self loadIconNamed: aName.
        icon ifNil: [ ^ aBlock value ].
        icons at: aName put: icon ].

    ^ icon
]

{ #category : #accessing }
EDAIconProvider >> icons [

	^ icons
]

{ #category : #accessing }
EDAIconProvider >> icons: anObject [

	icons := anObject
]

{ #category : #initialization }
EDAIconProvider >> initialize [

	super initialize.
	icons := Dictionary new.
	locations := OrderedCollection withAll: self class defaultLocations
]

{ #category : #accessing }
EDAIconProvider >> loadIcon: fileReference [

	fileReference exists ifFalse: [ 
		self error:
			('Icon {1} does not exit' format: { fileReference fullName }) ].

	^ fileReference binaryReadStreamDo: [ :stream | 
		  Form fromBinaryStream: stream ]
]

{ #category : #accessing }
EDAIconProvider >> loadIconNamed: aSymbol [

    self locations do: [ :each | | ref |
        ref := (each / aSymbol) withExtension: 'png'.
        ref exists ifTrue: [ 
            ^ self loadIcon: ref ] ].
    ^ nil
]

{ #category : #accessing }
EDAIconProvider >> locations [

	^ locations
]
