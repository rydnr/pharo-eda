helper
retrieveApplyEventMethod: event withLogging: aFlag
	| aux auxClass auxClassName result found |
	found := false.
	result := nil.
	auxClass := event class.
	auxClassName := auxClass greaseString.
	aux := self buildApplyEventMethodNameForEvent: auxClassName andVersion: event version.
	[ found ]
		whileFalse: [ [ auxClassName isNotEmpty ]
				whileTrue: [ self class methodDictionary
						at: aux asSymbol
						ifPresent: [ :v | 
							found := true.
							^ aux ]
						ifAbsent: [ aFlag
								ifTrue: [ Transcript
										print: self class greaseString;
										print: '>>';
										print: aux;
										print: ' not found.';
										cr ] ].
					auxClassName := auxClassName allButFirst.
					aux := self buildApplyEventMethodNameForEvent: auxClassName andVersion: event version ].
			auxClass := auxClass superclass.
			auxClassName := auxClass greaseString.
			found := auxClass ~= EDAEventSourcingEvent.
			aux := self buildApplyEventMethodNameForEvent: auxClass greaseString andVersion: event version ].
	^ result