local scriptParent = script.Parent
local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local Dash = require(FoundationParent.Dash)
local React = require(FoundationParent.React)
local Device = require(Foundation.Enums.Device)
local Flags = require(Foundation.Utility.Flags)
local StyleSheet = require(Foundation.StyleSheet)
local StyleSheetContext = require(scriptParent.StyleSheetContext)
local TagsContext = require(scriptParent.TagsContext)
local TextSizeOffsetContext = require(scriptParent.TextSizeOffsetContext)
local Theme = require(Foundation.Enums.Theme)
local Tokens = require(scriptParent.Tokens)
local TokensContext = require(scriptParent.TokensContext)
local VariantsContext = require(scriptParent.VariantsContext)
local getTextSizeOffset = require(Foundation.Utility.getTextSizeOffset)
local usePreferences = require(Foundation.Providers.Preferences.usePreferences)
local useTagsState = require(scriptParent.useTagsState)
local withDefaults = require(Foundation.Utility.withDefaults)
local getTokens = Tokens.getTokens
local v21 = if not Flags.FoundationUseStyleSheetRegistry then nil else require(scriptParent.useRegistryStyleSheet)
local t1 = {
	theme = Theme.Dark,
	device = Device.Desktop,
	scale = 1
}

function StyleSheetContextWrapper(t2: {[any]: any}) -- line: 54
	-- upvalues: React (copy), StyleSheetContext (copy), Dash (copy)
	local v24, v25 = React.useState(nil)

	if t2.setStyleSheetRef and v25 ~= t2.setStyleSheetRef.current then
		t2.setStyleSheetRef.current = v25
	end

	return React.createElement(StyleSheetContext.Provider, {
		value = v24 or Dash.None
	}, t2.children)
end

return function(t3: {[any]: any}) --[[ StyleProvider ]] -- line: 68
	-- upvalues: withDefaults (copy), t1 (copy), Flags (copy), React (copy), useTagsState (copy), VariantsContext (copy), getTokens (copy), usePreferences (copy), getTextSizeOffset (copy), v21 (copy), TokensContext (copy), TextSizeOffsetContext (copy), TagsContext (copy), StyleSheetContext (copy), StyleSheet (copy)
	local v27 = withDefaults({
		theme = t3.theme,
		device = t3.device,
		scale = t3.scale
	}, t1)
	local v28 = if Flags.FoundationUseStyleSheetRegistry then nil else React.useRef(nil)
	local v29 = nil
	local v30 = nil

	if not Flags.FoundationUseStyleSheetRegistry then
		v29, v30 = useTagsState()
	end

	local v31 = VariantsContext.useVariantsState()
	local v32 = React.useMemo(function() -- line: 85
		-- upvalues: getTokens (copy), v27 (copy), t3 (copy)
		return getTokens(v27.theme, v27.device, v27.scale, t3.tokenOverrides)
	end, {
		v27.device,
		v27.theme,
		v27.scale,
		t3.tokenOverrides
	})
	local preferredTextSize = usePreferences().preferredTextSize
	local v34 = React.useMemo(function() -- line: 92
		-- upvalues: getTextSizeOffset (copy)
		return getTextSizeOffset() or 0
	end, { preferredTextSize })
	local v35 = nil
	local v36 = nil

	if Flags.FoundationUseStyleSheetRegistry then
		v35, v36 = v21(v27.theme, v27.device, v27.scale, t3.tokenOverrides)
	end

	return React.createElement(TokensContext.Provider, {
		value = v32
	}, {
		TextSizeOffsetContext = React.createElement(TextSizeOffsetContext.Provider, {
			value = v34
		}, {
			VariantsContext = React.createElement(VariantsContext.Provider, {
				value = v31
			}, {
				TagsContext = React.createElement(TagsContext.Provider, {
					value = if not Flags.FoundationUseStyleSheetRegistry then v30 else v36
				}, if not Flags.FoundationUseStyleSheetRegistry then React.createElement(StyleSheetContextWrapper, {
					setStyleSheetRef = v28
				}, t3.children) else React.createElement(StyleSheetContext.Provider, {
					value = v35
				}, t3.children)),
				StyleSheet = if not Flags.FoundationUseStyleSheetRegistry then React.createElement(StyleSheet, {
					theme = v27.theme,
					device = v27.device,
					scale = v27.scale,
					tags = v29,
					derives = t3.derives,
					setStyleSheetRef = v28,
					tokenOverrides = t3.tokenOverrides
				}) else React.createElement("StyleLink", {
					StyleSheet = v35
				})
			})
		})
	})
end
