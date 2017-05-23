code generation - repository
createRepositoryClass
	| cls attributes result |
	cls := self retrieveRepositoryClassName asSymbol.
	attributes := OrderedCollection new.
	attributes add: 'eventStore'.
	(self classExists: cls)
		ifTrue: [ attributes := self allAttributesOf: (self class environment at: cls) including: attributes ].
	result := Object
		subclass: cls
		instanceVariableNames: (self concatenateCollection: attributes with: ' ')
		classVariableNames: ''
		package: self appName , '-Domain-' , (self toCamelCase: self aggregate).
	(self class environment at: cls) class instanceVariableNames: 'EventStore UniqueInstance'.
	^ result