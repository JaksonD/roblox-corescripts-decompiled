local Parent = script:FindFirstAncestor("Style").Parent
local React = require(Parent.React)
local Foundation = require(Parent.Foundation)
local useTokens = Foundation.Hooks.useTokens
local Theme = Foundation.Enums.Theme
local getSceneOverridesStore = require(script.Parent.getSceneOverridesStore)

return function(t1: {[any]: any}) --[[ SceneOverridesRegistry ]] -- line: 13
	-- upvalues: useTokens (copy), React (copy), Theme (copy), getSceneOverridesStore (copy)
	local v8 = useTokens()
	local v9 = React.useMemo(function() -- line: 16
		-- upvalues: v8 (copy), Theme (copy)
		local Gray_300Color3 = v8.Color.Extended.Gray.Gray_300.Color3
		local Gray_400Color3 = v8.Color.Extended.Gray.Gray_400.Color3
		local Gray_500Color3 = v8.Color.Extended.Gray.Gray_500.Color3
		local Gray_700Color3 = v8.Color.Extended.Gray.Gray_700.Color3
		local Gray_800Color3 = v8.Color.Extended.Gray.Gray_800.Color3
		local Gray_900Color3 = v8.Color.Extended.Gray.Gray_900.Color3
		local Surface_200Color3 = v8.Color.Surface.Surface_200.Color3
		local Surface_100Color3 = v8.Color.Surface.Surface_100.Color3

		if v8.Config.ColorMode.Name == Theme.Light then
			return {
				SkyboxBlockerColor = Gray_400Color3:Lerp(Surface_200Color3, 0.6),
				SkyboxBlockerTransparency = 0,
				BackPanel = Gray_500Color3:Lerp(Surface_200Color3, 0.6),
				Clouds = Gray_500Color3:Lerp(Surface_200Color3, 0.3),
				LargerShapes = Gray_500Color3:Lerp(Surface_200Color3, 0.4),
				Baseplate = Gray_300Color3:Lerp(Surface_200Color3, 0.2),
				FogStart = 400,
				FogEnd = 500
			}
		end

		return {
			SkyboxBlockerColor = Gray_800Color3:Lerp(Surface_200Color3, 0.3),
			SkyboxBlockerTransparency = 0,
			BackPanel = Gray_700Color3:Lerp(Surface_200Color3, 0.3),
			Clouds = Gray_700Color3:Lerp(Surface_200Color3, 0.3),
			LargerShapes = Gray_700Color3:Lerp(Surface_100Color3, 0.4),
			Baseplate = Gray_900Color3:Lerp(Surface_200Color3, 0.2),
			FogStart = 400,
			FogEnd = 500
		}
	end, { v8 })

	React.useEffect(function() -- line: 52
		-- upvalues: getSceneOverridesStore (copy), v9 (copy)
		local v18 = getSceneOverridesStore()

		v18.setSceneOverrides(v9)

		return function() -- line: 55
			-- upvalues: v18 (copy)
			v18.setSceneOverrides(nil)
		end
	end, { v9 })

	return t1.children
end
