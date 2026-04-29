local scriptParent = script.Parent
local ParentParent = scriptParent.Parent.Parent
local getTextSizeOffset = require(ParentParent.Utility.getTextSizeOffset)
local ParentParentParent = ParentParent.Parent
local Cryo = require(ParentParentParent.Cryo)
local React = require(ParentParentParent.React)
local Roact = require(ParentParentParent.Roact)
local v8 = ParentParent:FindFirstAncestor("Packages") or ParentParent:FindFirstAncestor("CorePackages")
local v9 = not not v8 and (not not v8:FindFirstChild("Dev") and (not not v8.Dev:FindFirstChild("JestGlobals") and pcall(require, v8.Dev.JestGlobals)))
local Foundation = require(ParentParentParent.Foundation)
local FoundationProvider = Foundation.FoundationProvider
local useTokens = Foundation.Hooks.useTokens
local Object = require(ParentParentParent.LuauPolyfill).Object
local getThemeFromName = require(scriptParent.Themes.getThemeFromName)
local getFontFromName = require(scriptParent.Fonts.getFontFromName)
local Constants = require(scriptParent.Constants)
local UIBloxConfig = require(ParentParent.UIBloxConfig)

require(script.Parent.StyleTypes)

local Tokens = require(script.Parent.Tokens)
local StyleContext = require(ParentParent.Core.Style.StyleContext)
local Logger = require(ParentParent.Logger)
local getTokens = Tokens.getTokens
local validateTokens = Tokens.validateTokens
local getFoundationTokens = Tokens.getFoundationTokens
local Mappers = Tokens.Mappers
local t1 = {
	dark = Foundation.Enums.Theme.Dark,
	light = Foundation.Enums.Theme.Light
}
local t2 = {
	themeName = Constants.DefaultThemeName,
	fontName = Constants.DefaultFontName,
	deviceType = Constants.DefaultDeviceType,
	settings = Constants.DefaultSettings
}

return function(t3: {[any]: any}) --[[ AppStyleProvider ]] -- line: 84
	-- upvalues: Object (copy), t2 (copy), React (copy), getTokens (copy), getThemeFromName (copy), useTokens (copy), getFoundationTokens (copy), UIBloxConfig (copy), Cryo (copy), Mappers (copy), validateTokens (copy), getFontFromName (copy), Constants (copy), getTextSizeOffset (copy), StyleContext (copy), Roact (copy), v9 (copy), Logger (copy), FoundationProvider (copy), t1 (copy)
	local v28 = Object.assign({}, t2, t3.style)
	local v29, v30 = React.useState(v28.themeName)
	local v31 = v28.settings and v28.settings.scale
	local v32 = getTokens(v28.deviceType, v29, v31)
	local v33, v34 = React.useState(0)
	local v35 = getThemeFromName(v29)
	local v36 = useTokens()
	local v37 = v36.Config ~= nil
	local v38 = getFoundationTokens(v28.deviceType, v29)
	local v39 = if not UIBloxConfig.useColorTokensForThemeMapping or not v37 then v38 else Cryo.Dictionary.join(v38, v36)
	local v40 = Mappers.mapColorTokensToFoundation(v32, v39)
	local v41 = Mappers.mapThemeToFoundation(v35, if not UIBloxConfig.useColorTokensForThemeMapping or not v37 then v38 else v36)

	assert(validateTokens(v40), "Invalid tokens!")

	local v42 = if not UIBloxConfig.enableFoundationTokenMapping then v40 else Mappers.addFoundationFlatKeys(v40, if not UIBloxConfig.useColorTokensForThemeMapping or not v37 then v38 else v36)
	local t4 = {
		Font = getFontFromName(v28.fontName, v42),
		Theme = v41,
		Tokens = v42,
		Settings = if not v28.settings then Constants.DefaultSettings else {
			PreferredTransparency = v28.settings.preferredTransparency,
			ReducedMotion = v28.settings.reducedMotion,
			PreferredTextSize = v28.settings.preferredTextSize,
			Scale = v28.settings.scale
		}
	}
	local v44 = React.useRef(false)

	React.useEffect(function() -- line: 136
		-- upvalues: v44 (copy), v30 (copy), v28 (copy)
		v44.current = true
		v30(v28.themeName)

		return function() -- line: 139
			-- upvalues: v44 (copy)
			v44.current = false
		end
	end, {
		v44,
		v28.themeName,
		v30
	})
	React.useEffect(function() -- line: 144
		-- upvalues: getTextSizeOffset (copy), v42 (copy), v34 (copy)
		local v48, v49 = getTextSizeOffset(v42.Semantic.Typography.Body.Font)

		if v48 then
			v34(v49)
		end
	end, { v28.settings.preferredTextSize })

	local v45 = React.useCallback(function(_, p2) -- line: 151
		-- upvalues: v44 (copy), v30 (copy)
		if v44.current then
			v30(p2)
		end
	end, {
		v44,
		v30
	})
	local v46 = React.useMemo(function() -- line: 157
		-- upvalues: v29 (copy), Constants (copy)
		if v29:lower() == Constants.ThemeName.Dark:lower() then
			return Constants.ThemeName.Dark
		end

		if v29:lower() == Constants.ThemeName.Light:lower() then
			return Constants.ThemeName.Light
		end

		return Constants.DefaultThemeName
	end, { v29 })
	local v47 = React.createElement(StyleContext.Provider, {
		value = {
			style = t4,
			updateTheme = v45,
			derivedValues = {
				textSizeOffset = v33
			},
			styleMetadata = {
				ThemeName = v46
			}
		}
	}, Roact.oneChild(t3.children))

	if not v37 then
		if not v9 and _G.__DEV__ then
			Logger:warning(debug.traceback("FoundationProvider not found. Please ensure that the FoundationProvider is present in the component tree."))
		end

		return React.createElement(FoundationProvider, {
			theme = t1[v29:lower()],
			device = v28.deviceType,
			preferences = v28.settings
		}, v47)
	end

	return v47
end
