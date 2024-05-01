-- Options need to load first.
require("core.options") 		-- ./core/options.lua

-- Deal with plugin crap.
require("plugins.lazynvim") 		-- ./core/plugins/lazynvim
require("plugins.config") 		-- ./core/plugins/config/*

-- Creation functions are keymaps.
require("core.functions") 		-- ./core/functions.lua
require("core.keymaps") 		-- ./core/keymaps.lua
