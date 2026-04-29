local Foundation = script:FindFirstAncestor("Foundation")
local Device = require(Foundation.Enums.Device)
local Flags = require(Foundation.Utility.Flags)
local StyleTagFormat = require(Foundation.Enums.StyleTagFormat)
local Theme = require(Foundation.Enums.Theme)
local t1 = {
	[StyleTagFormat.Static] = {
		Common = function() --[[ Common ]] -- line: 14
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.CommonStatic)
		end,
		Dark = function() --[[ Dark ]] -- line: 17
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.DarkStatic)
		end,
		Light = function() --[[ Light ]] -- line: 20
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.LightStatic)
		end,
		Console = function() --[[ Console ]] -- line: 23
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.ConsoleStatic)
		end,
		Desktop = function() --[[ Desktop ]] -- line: 26
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.DesktopStatic)
		end
	},
	[StyleTagFormat.Attribute] = {
		Common = function() --[[ Common ]] -- line: 31
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.CommonAttribute)
		end,
		Dark = function() --[[ Dark ]] -- line: 34
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.DarkAttribute)
		end,
		Light = function() --[[ Light ]] -- line: 37
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.LightAttribute)
		end,
		Console = function() --[[ Console ]] -- line: 40
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.ConsoleAttribute)
		end,
		Desktop = function() --[[ Desktop ]] -- line: 43
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.DesktopAttribute)
		end
	}
}

return function(p1, p2) --[[ getGeneratedRules ]] -- line: 49
	-- upvalues: StyleTagFormat (copy), Flags (copy), t1 (copy), Theme (copy), Device (copy)
	local Attribute = StyleTagFormat.Attribute
	local v10 = nil
	local v11 = if not Flags.FoundationUseAttributeTokens then t1[StyleTagFormat.Static].Common() else t1[StyleTagFormat.Attribute].Common()

	if p1 == Theme.Dark then
		v10 = if not Flags.FoundationUseAttributeTokens then t1[StyleTagFormat.Static].Dark() else t1[StyleTagFormat.Attribute].Dark()
	elseif p1 == Theme.Light then
		v10 = if not Flags.FoundationUseAttributeTokens then t1[StyleTagFormat.Static].Light() else t1[StyleTagFormat.Attribute].Light()
	end

	local v12 = if p2 ~= Device.Console or Flags.FoundationDisableTokenScaling then t1[Attribute].Desktop() else t1[Attribute].Console()

	if not v10 or not v12 or not v11 then
		return {}
	end

	local v13 = table.clone(v12)

	for v14, v15 in v11 do
		v13[v14] = v15
	end

	for v16, v17 in v10 do
		v13[v16] = v17
	end

	return v13
end
