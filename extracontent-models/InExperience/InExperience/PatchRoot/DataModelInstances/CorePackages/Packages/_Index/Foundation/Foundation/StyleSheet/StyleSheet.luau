local scriptParent = script.Parent
local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local Flags = require(Foundation.Utility.Flags)
local React = require(FoundationParent.React)

require(Foundation.Providers.Style.Tokens)
require(scriptParent.Rules.Types)

local createStyleSheetRules = require(scriptParent.createStyleSheetRules)
local getOverrideAttributes = require(scriptParent.getOverrideAttributes)
local useGeneratedRules = require(Foundation.Utility.useGeneratedRules)

require(Foundation.Enums.Device)
require(Foundation.Enums.Theme)

return React.memo(function(t1: {[any]: any}) --[[ StyleSheet ]] -- line: 32
	-- upvalues: React (copy), useGeneratedRules (copy), Flags (copy), getOverrideAttributes (copy), createStyleSheetRules (copy)
	local v10, v11 = React.useState(nil)
	local v12 = React.useRef({})

	React.useLayoutEffect(function() -- line: 36
		-- upvalues: t1 (copy), v10 (copy)
		if t1.setStyleSheetRef and t1.setStyleSheetRef.current then
			t1.setStyleSheetRef.current(v10)
		end
	end, { v10 })

	local v13 = useGeneratedRules(t1.theme, t1.device)

	React.useLayoutEffect(function() -- line: 46
		-- upvalues: v10 (copy), Flags (copy), t1 (copy)
		if v10 and not Flags.FoundationDisableStyleProviderDerives then
			v10:SetDerives(t1.derives or {})
		end
	end, {
		v10,
		t1.derives
	})

	local v14 = React.useMemo(function() -- line: 53
		-- upvalues: getOverrideAttributes (copy), t1 (copy)
		return getOverrideAttributes(t1.theme, t1.device, t1.tokenOverrides)
	end, {
		t1.theme,
		t1.device,
		t1.tokenOverrides
	})
	local v15 = React.useMemo(function() -- line: 57
		-- upvalues: v10 (copy), createStyleSheetRules (copy), v13 (copy), t1 (copy), v12 (copy), v14 (copy)
		if v10 then
			return createStyleSheetRules(v13, t1.tags, v10, v12.current, t1.scale, v14)
		end

		return nil
	end, {
		v10,
		v13,
		t1.tags,
		t1.scale,
		v14
	})

	return React.createElement(React.Fragment, nil, {
		FoundationStyleSheet = React.createElement("StyleSheet", {
			ref = v11
		}, v15),
		FoundationStyleLink = React.createElement("StyleLink", {
			StyleSheet = v10
		})
	})
end)
