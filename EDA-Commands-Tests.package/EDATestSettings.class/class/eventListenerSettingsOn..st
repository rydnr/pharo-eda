settings
eventListenerSettingsOn: aBuilder
	(aBuilder group: #testEventListener)
		label: 'Event Listener' translated;
		description: 'Event Listener (for integration tests)' translated;
		parent: #edatests.

	^ self stompListenerSettingsOn: aBuilder withConfig: EDAEventStompTopicListener under: #testEventListener populatedWithValuesFrom: 'testEventListener'