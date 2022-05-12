local wk = require("which-key")

local map_key = function( prefix, mode, buffer, mappings )
	local opt = {
		prefix = prefix,
		mode = mode,
		buffer = buffer,
		silent = true,
		noremap = true,
		nowait = false,
	}
	wk.register( mappings, opt )
end

local map_nkey = function( prefix, mappings )
	map_key( prefix, "n", nil, mappings)
end

local map_vkey = function( prefix, mappings )
	map_key( prefix, "v", nil, mappings)
end

local map_tkey = function( prefix, mappings )
	map_key( prefix, "t", nil, mappings)
end

return {
	map_key = map_key,
	map_nkey = map_nkey,
	map_vkey = map_vkey,
	map_tkey = map_tkey,
}

