local colorScopeKeepPrefix = require(script.Parent.colorScopeKeepPrefix)

local function kebabToPascal(s1: string) -- line: 3
	return (s1:gsub("^%-?(.)", function(p1) -- line: 4
		return p1:upper()
	end):gsub("%-(.)", function(p2) -- line: 7
		return p2:upper()
	end))
end

return function(s2: string, s3: string) --[[ tokenAttributePascalName ]] -- line: 15
	-- upvalues: kebabToPascal (copy), colorScopeKeepPrefix (copy)
	local v6 = kebabToPascal(s3)

	if colorScopeKeepPrefix[s2] and s2 == string.sub(v6, 1, #s2) then
		return (string.sub(v6, #s2 + 1))
	end

	return v6
end
