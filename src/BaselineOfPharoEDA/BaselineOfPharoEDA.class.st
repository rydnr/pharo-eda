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

{ #category : #baselines }
BaselineOfPharoEDA >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec blessing: #baseline.
		spec postLoadDoIt: #postload:package:.
		self
			includePharoEDACore: spec;
			includePharoEDAApi: spec;
			includePharoEDAAdapters: spec;
			includePharoEDACommon: spec;
			includePharoEDAPorts: spec;
			includePharoEDASettings: spec;
			includePharoEDATools: spec ]
]

{ #category : #dependencies }
BaselineOfPharoEDA >> includeBabyMock2: spec [
	spec
		project: 'BabyMock2'
		with: [ spec
				className: #ConfigurationOfBabyMock2;
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA >> includeGToolkit: spec [
	spec
		baseline: 'GToolkit'
		with: [ spec repository: 'github://feenkcom/gtoolkit:master' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA >> includeNeoJSON: spec [
	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON/repository' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA >> includeObjectDiff: spec [

	spec
		baseline: 'ObjectDiff'
		with: [ spec repository: 'github://rydnr/object-diff:main/src' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA >> includePharoEDAAdapters: spec [
	spec
		baseline: 'PharoEDAAdapters'
		with: [ spec repository: 'github://rydnr/pharo-eda-adapters:main' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA >> includePharoEDAApi: spec [
spec
		baseline: 'PharoEDAApi'
		with: [ spec repository: 'github://rydnr/pharo-eda-api:main' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA >> includePharoEDACommon: spec [
spec
		baseline: 'PharoEDACommon'
		with: [ spec repository: 'github://rydnr/pharo-eda-common:main' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA >> includePharoEDACore: spec [

	spec
		baseline: 'PharoEDAApi'
		with: [ spec repository: 'github://rydnr/pharo-eda-core:main' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA >> includePharoEDAPorts: spec [
spec
		baseline: 'PharoEDAPorts'
		with: [ spec repository: 'github://rydnr/pharo-eda-ports:main' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA >> includePharoEDASettings: spec [
spec
		baseline: 'PharoEDASettings'
		with: [ spec repository: 'github://rydnr/pharo-eda-settings:main' ].
	^ spec
]

{ #category : #dependencies }
BaselineOfPharoEDA >> includePharoEDATools: spec [
spec
		baseline: 'PharoEDATools'
		with: [ spec repository: 'github://rydnr/pharo-eda-tools:main' ].
	^ spec
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
