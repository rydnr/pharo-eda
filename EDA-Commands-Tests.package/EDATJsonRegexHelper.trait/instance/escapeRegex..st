as yet unclassified
escapeRegex: aRegex
	| escaped |
	escaped := aRegex copyWithRegex: '<ANYTHING>' matchesReplacedWith: '(.*)'.
	escaped := escaped copyWithRegex: '\:' matchesReplacedWith: '\:'.
	^ escaped