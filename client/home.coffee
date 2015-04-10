Router.route '/',

	template: 'home'

	data: ->
		features: [
			'Mobile-first'
			'Responsive'
			'Styleable'
			'Dependency-free'
			'Extensible'
			'MIT Licensed'
		]

		demos: [

			name: "Smooth but snappy"
			description: "The slider range can be quantized, but the dragging experience remains smooth."
			options: [
				min: 0
				max: 6
				step: 2
			]
		,
			name: "Form controls"
			description: "Connect bidirectionally with a form input."
			template: "positionOutput"
			options: [
				formElement: '#position'
			]
		,
			name: "Events"
			description: "Get notified when the slider is dragged, the value changes, or when the control finishes transitioning."
			template: 'events'
			code: "slider.element.addEventListener('change', function(event) { ... });"
			options: [{}]
		,
			name: "Small numbers"
			description: """When dealing with small numbers, floating point representation errors may become more frequent. 

			These are dealt with internally such that `slider.value()` returns nice values as you would expect."""
			options: [
				min: -0.1
				max: 0.1
				step: 0.01
				label:
					precision: 2
			]
		,
			name: "Fill"
			description: "Color in a range of the track. Accepted values are `null`, `lower`, `upper`."
			options: [
				fill: "lower"
				value: 0.5
			,
				fill: "upper"
				value: 0.5
			]
		,
			name: "Vertical"
			description: "You must specify an explicit height for the slider container in this mode."
			options: [
				orientation: "vertical"
			]
			
		]

Session.setDefault 'random', 0

Template.home.helpers

	format: -> Slider._.formatObject @options?[0]

	value: -> Session.get 'random'

flash = (el) ->
	el?.addClass? 'flash'
	Meteor.setTimeout ->
		el?.removeClass? 'flash'
	, 50

Template.home.events

	'change .demo-events .slider': (e) -> 
		flash Template.instance()?.$? '.events .change'

	'drag .demo-events .slider': (e) ->
		flash Template.instance()?.$? '.events .drag'

	'transition .demo-events .slider': (e) ->
		flash Template.instance()?.$? '.events .transition'


