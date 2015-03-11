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
				initial: 0.5
			,
				fill: "upper"
				initial: 0.5
			]
		,
			name: "Vertical"
			description: "You must specify an explicit height for the slider container in this mode."
			options: [
				orientation: "vertical"
			]
		
		]

Template.home.helpers

	format: -> Slider._.formatObject @options?[0]
