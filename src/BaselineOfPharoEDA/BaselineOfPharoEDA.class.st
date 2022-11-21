"
**Class**

I'm a baseline to load PharoEDA.

**Responsibilities**

Guide Metacello to load PharoEDA with its dependencies.

**Collaborators**

Metacello
"
Class {
	#name : #BaselineOfPharoEDA,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoEDA
}

{ #category : #dependencies }
BaselineOfPharoEDA class >> includeNeoJSON: spec [
	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON/repository' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA class >> includePharoEDAAdapters: spec [
	spec
		baseline: 'PharoEDAAdapters'
		with: [ spec repository: 'github://rydnr/pharo-eda-adapters:main' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA class >> includePharoEDAApi: spec [

	spec
		baseline: 'PharoEDAApi'
		with: [ spec repository: 'github://rydnr/pharo-eda-api:main' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA class >> includePharoEDACommon: spec [
spec
		baseline: 'PharoEDACommon'
		with: [ spec repository: 'github://rydnr/pharo-eda-common:main' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA class >> includePharoEDACore: spec [

	spec
		baseline: 'PharoEDACore'
		with: [ spec repository: 'github://rydnr/pharo-eda-core:main' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA class >> includePharoEDAPorts: spec [
spec
		baseline: 'PharoEDAPorts'
		with: [ spec repository: 'github://rydnr/pharo-eda-ports:main' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA class >> includePharoEDASettings: spec [
spec
		baseline: 'PharoEDASettings'
		with: [ spec repository: 'github://rydnr/pharo-eda-settings:main' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA class >> includePharoEDATools: spec [
spec
		baseline: 'PharoEDATools'
		with: [ spec repository: 'github://rydnr/pharo-eda-tools:main' ].
	^ spec
]

{ #category : #baselines }
BaselineOfPharoEDA >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec blessing: #baseline.
		spec postLoadDoIt: #postload:package:.
		self
			class includeNeoJSON: spec;
			includePharoEDACommon: spec;
			includePharoEDACore: spec;
			includePharoEDAApi: spec;
			includePharoEDAAdapters: spec;
			includePharoEDAPorts: spec;
			includePharoEDASettings: spec;
			includePharoEDATools: spec ]
]

{ #category : #baselines }
BaselineOfPharoEDA >> postload: loader package: packageSpec [

	| location |
	location := (IceRepository registry detect: [ :each | 
		             each name = 'pharo-eda' ]) location.
	EDACIconProvider addDefaultLocation: location / 'resources' / 'icons'.
	EDACTranslationProvider addDefaultLocation:
		location / 'resources' / 'l10n'
]
