return {
    "navarasu/onedark.nvim",
    config = function()
	    require('onedark').setup {
	      style = 'dark'
	    }
	    -- Enable theme
	    require('onedark').load()
    end
}
