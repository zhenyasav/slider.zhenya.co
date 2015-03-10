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
			
			min: -0.1
			max: 0.1
			step: 0.01
			label:
				precision: 2
		,
			orientation: "vertical"
		
		]

Template.home.helpers

	format: ->
		format = (v, indent=0) ->
			_.map v, (val, key) ->
				val = "\"#{val}\"" if typeof val is 'string'
				val = "\n" + format val, indent+1 if '[object Object]' is Object.prototype.toString.call val
				"#{('  ' for t in [0..indent]).join('')}#{key}: #{val}"
			.join '\n'
		format @