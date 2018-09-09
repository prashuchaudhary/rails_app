module IRBExtension
	def start
		pre_init
		super
	end

	def pre_init
		require 'awesome_print'
		AwesomePrint.irb!
	end
end