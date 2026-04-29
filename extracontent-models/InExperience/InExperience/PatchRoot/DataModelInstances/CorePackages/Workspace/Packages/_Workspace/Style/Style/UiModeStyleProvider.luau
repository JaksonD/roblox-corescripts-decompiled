local Style = script:FindFirstAncestor("Style")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local StyleParent = Style.Parent
local Cryo = require(StyleParent.Cryo)
local React = require(StyleParent.React)
local SignalsReact = require(StyleParent.SignalsReact)
local dependencyArray = require(StyleParent.RoactUtils).Hooks.dependencyArray
local useDeviceType = require(StyleParent.RobloxAppHooks).useDeviceType
local ThemeContext = require(script.Parent.ThemeContext)
local SceneOverridesRegistry = require(script.Parent.SceneOverridesRegistry)
local AppStyleProvider = require(StyleParent.UIBlox).App.Style.AppStyleProvider
local Foundation = require(StyleParent.Foundation)
local FoundationProvider = Foundation.FoundationProvider
local Theme = Foundation.Enums.Theme
local getUIScale = require(StyleParent.Display).GetDisplayStore(false).getUIScale
local v16 = game:DefineFastFlag("LuaAppEnableWindowsHandheldTokenScale", false) and game:GetEngineFeature("EnableDisplaySize")
local v17 = game:DefineFastFlag("DebugLuaAppEnableTokenScale", false)
local FFlagRemoveDependencyArrayAntipattern = require(StyleParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local FFlagEnableCoreContentTheme = require(StyleParent.SharedFlags).FFlagEnableCoreContentTheme
local v20 = v16 or v17
local t1 = {
	dark = Theme.Dark,
	light = Theme.Light
}

local function UiModeStyleProvider(t2: {[any]: any}) -- line: 59
	-- upvalues: useDeviceType (copy), v20 (copy), SignalsReact (copy), getUIScale (copy), React (copy), UserGameSettings (copy), Cryo (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), FoundationProvider (copy), t1 (copy), FFlagEnableCoreContentTheme (copy), SceneOverridesRegistry (copy), AppStyleProvider (copy)
	local v24 = useDeviceType()
	local u25 = nil

	if v20 then
		u25 = SignalsReact.useSignalState(getUIScale)
	end

	local v26, v27 = React.useState({
		preferredTransparency = UserGameSettings.PreferredTransparency,
		reducedMotion = UserGameSettings.ReducedMotion,
		preferredTextSize = UserGameSettings.PreferredTextSize
	})

	React.useEffect(function() -- line: 73
		-- upvalues: v27 (copy), UserGameSettings (copy)
		local function updateSettings() -- line: 74
			-- upvalues: v27 (copy), UserGameSettings (copy)
			v27({
				preferredTransparency = UserGameSettings.PreferredTransparency,
				reducedMotion = UserGameSettings.ReducedMotion,
				preferredTextSize = UserGameSettings.PreferredTextSize
			})
		end

		local connection = UserGameSettings:GetPropertyChangedSignal("PreferredTransparency"):Connect(updateSettings)
		local connection2 = UserGameSettings:GetPropertyChangedSignal("ReducedMotion"):Connect(updateSettings)
		local connection3 = UserGameSettings:GetPropertyChangedSignal("PreferredTextSize"):Connect(updateSettings)

		return function() -- line: 88
			-- upvalues: connection (copy), connection2 (copy), connection3 (copy)
			connection:Disconnect()
			connection2:Disconnect()
			connection3:Disconnect()
		end
	end, {})

	local style = t2.style
	local v29 = React.useMemo(function() -- line: 97
		-- upvalues: Cryo (copy), style (copy), v24 (copy), v20 (copy), v26 (copy), u25 (ref)
		return Cryo.Dictionary.join({
			deviceType = style.deviceType or v24
		}, style, {
			settings = if not v20 then v26 else Cryo.Dictionary.join(v26, {
				scale = u25
			})
		})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(style, v24, v26, u25) else {
		style,
		v24,
		v26,
		u25
	})

	return React.createElement(FoundationProvider, {
		device = v29.deviceType,
		theme = t1[v29.themeName:lower()],
		preferences = v29.settings,
		tokenOverrides = if not FFlagEnableCoreContentTheme then nil else v29.tokenOverrides,
		DONOTUSE_colorUpdate = true
	}, if not FFlagEnableCoreContentTheme or v29.tokenOverrides == nil then React.createElement(AppStyleProvider, {
		style = v29
	}, t2.children) else React.createElement(SceneOverridesRegistry, nil, React.createElement(AppStyleProvider, {
		style = v29
	}, t2.children)))
end

return function(t3: {[any]: any}) --[[ ThemeProvider ]] -- line: 136
	-- upvalues: React (copy), FFlagEnableCoreContentTheme (copy), t1 (copy), Cryo (copy), ThemeContext (copy), UiModeStyleProvider (copy)
	local v31, v32 = React.useState(t3.style.themeName)
	local v33 = table.clone(t3)
	local v34 = if not FFlagEnableCoreContentTheme then nil else t3.style.tokenOverrides

	if FFlagEnableCoreContentTheme and t3.tokenOverridesByTheme then
		local v35 = t1[v31:lower()]

		v34 = t3.tokenOverridesByTheme[v35] or v34
	end

	v33.style = Cryo.Dictionary.join(v33.style, {
		themeName = v31,
		tokenOverrides = if not FFlagEnableCoreContentTheme then nil else v34
	})

	return React.createElement(ThemeContext.Provider, {
		value = {
			theme = v31,
			setTheme = v32
		}
	}, React.createElement(UiModeStyleProvider, v33))
end
