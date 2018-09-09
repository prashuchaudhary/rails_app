module IRBExtension
	def start
		pre_init
		super
	end

	def pre_init
		if Rails.env.development?
			require 'awesome_print'
			AwesomePrint.irb!
		end
	end
end