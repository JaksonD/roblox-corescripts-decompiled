local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local Foundation = require(CorePackages.Packages.Foundation)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local useNavigation = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local Constants = AvatarExperienceCommon.Constants
local ItemTypeEnum = AvatarExperienceCommon.Enums.ItemTypeEnum
local getTryOnItemReducerKey = AvatarExperienceCommon.Utils.getTryOnItemReducerKey
local ToggleTryOn = require(Modules.AvatarExperience.Common.Actions.ToggleTryOn)
local RemoveFromTryOn = require(Modules.AvatarExperience.Common.Actions.RemoveFromTryOn)
local FetchAssetOrBundleInfo = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local Analytics = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local useRoactService = require(Modules.LuaApp.Hooks.useRoactService)
local ActionBarWithExpiredTimedOptions = require(Modules.AvatarExperience.Catalog.Components.ActionBar.ActionBarWithExpiredTimedOptions)

local function selectDeviceOrientation(p1) -- line: 38
	return p1.DeviceOrientation
end
local function selectTryOnItems(p2) -- line: 42
	return p2.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

return require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function() --[[ ExpiredUserLookActionBarScreen ]] -- line: 46
	-- upvalues: useNavigation (copy), useDispatch (copy), useRoactService (copy), Analytics (copy), RoactNetworking (copy), useSelector (copy), selectDeviceOrientation (copy), selectTryOnItems (copy), DeviceOrientationMode (copy), React (copy), RemoveFromTryOn (copy), ItemTypeEnum (copy), getTryOnItemReducerKey (copy), ToggleTryOn (copy), FetchAssetOrBundleInfo (copy), AvatarScreen (copy), Foundation (copy), Constants (copy), ActionBarWithExpiredTimedOptions (copy)
	local v26 = useNavigation()
	local v27 = useDispatch()
	local v28 = useRoactService(Analytics)
	local v29 = useRoactService(RoactNetworking)
	local v30 = useSelector(selectDeviceOrientation)
	local v31 = useSelector(selectTryOnItems)
	local v32 = v30 == DeviceOrientationMode.Portrait
	local v33 = v26.state.params or {}
	local v34 = v33.expiredItemCount or 0
	local expiredItems = v33.expiredItems
	local v36 = React.useRef(expiredItems)

	v36.current = expiredItems

	local v37 = React.useRef(v27)

	v37.current = v27
	React.useEffect(function() -- line: 67
		-- upvalues: v36 (copy), v37 (copy), RemoveFromTryOn (copy), ItemTypeEnum (copy)
		return function() -- line: 68
			-- upvalues: v36 (copy), v37 (copy), RemoveFromTryOn (copy), ItemTypeEnum (copy)
			local current = v36.current

			if not current then
				return
			end

			for _, v44 in current do
				v37.current(RemoveFromTryOn(v44.itemId, ItemTypeEnum.Asset))
			end
		end
	end, {})

	local v38 = React.useCallback(function() -- line: 79
		-- upvalues: expiredItems (copy), getTryOnItemReducerKey (copy), ItemTypeEnum (copy), v31 (copy), v27 (copy), ToggleTryOn (copy), FetchAssetOrBundleInfo (copy), v29 (copy), v28 (copy), v26 (copy), AvatarScreen (copy)
		if expiredItems then
			for _, v40 in expiredItems do
				local v41 = getTryOnItemReducerKey(v40.itemId, ItemTypeEnum.Asset)

				if not v31 or not v31[v41] then
					v27(ToggleTryOn(ItemTypeEnum.Asset, v40.itemSubType, v40.itemId, true, v40.order))
					v27(FetchAssetOrBundleInfo(v29, v28, v40.itemId, ItemTypeEnum.Asset))
				end
			end
		end

		v26.navigate(AvatarScreen.ExpiredUserLookCheckout)
	end, {
		v26,
		v27,
		expiredItems,
		v31,
		v28,
		v29
	})

	if v34 > 0 then
		return (React.createElement(Foundation.View, {
			tag = "size-full gui-object-defaults",
			ZIndex = 4
		}, {
			ActionBarInner = React.createElement(Foundation.View, {
				tag = "gui-object-defaults",
				Size = if not v32 then UDim2.fromScale(Constants.LANDSCAPE_SCENE_WIDTH_PERCENTAGE, 1) else UDim2.fromScale(1, 1),
				Position = if not v32 then UDim2.fromScale(Constants.LANDSCAPE_UI_WIDTH_PERCENTAGE, 0) else UDim2.fromScale(0, 0)
			}, {
				ActionBar = React.createElement(ActionBarWithExpiredTimedOptions, {
					expiredItemCount = v34,
					onViewPressed = v38
				})
			})
		}))
	end

	return nil
end)
