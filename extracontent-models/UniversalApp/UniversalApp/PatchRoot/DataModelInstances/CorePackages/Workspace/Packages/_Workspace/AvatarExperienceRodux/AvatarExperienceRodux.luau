require(script.Types.RoduxTypes)
require(script.Types.AssetMetadata)
require(script.Types.AssetInfo)
require(script.Types.OutfitTryOn)
require(script.Types.BodyColors)
require(script.Types.HydratedWidgetData)

local Constants = require(script.Constants)
local ReducerUtils = require(script.Utils.ReducerUtils)
local AddAnalyticsMetadata = require(script.Actions.AddAnalyticsMetadata)
local AvatarExperienceLoaded = require(script.Actions.AvatarExperienceLoaded)
local PlayingSwimAnimation = require(script.Actions.PlayingSwimAnimation)
local SetAvatarSceneRoute = require(script.Actions.SetAvatarSceneRoute)
local SetItemDetailsPeekViewState = require(script.Actions.SetItemDetailsPeekViewState)
local SetItemTryOnPeekViewState = require(script.Actions.SetItemTryOnPeekViewState)
local SetTryOnManagerPeekViewState = require(script.Actions.SetTryOnManagerPeekViewState)
local SetCurrentCharacter = require(script.Actions.SetCurrentCharacter)
local SetLookDetailsPeekViewSelectedTab = require(script.Actions.SetLookDetailsPeekViewSelectedTab)
local AddSaveDelay = require(script.Actions.AddSaveDelay)
local RemoveSaveDelay = require(script.Actions.RemoveSaveDelay)
local SetCameraButtonStatus = require(script.Actions.SetCameraButtonStatus)
local SetCameraButtonErrorOccurred = require(script.Actions.SetCameraButtonErrorOccurred)
local CurrentCharacter = require(script.Reducers.CurrentCharacter)
local AnalyticsMetadata = require(script.Reducers.AnalyticsMetadata)
local AvatarExperienceLoaded2 = require(script.Reducers.AvatarExperienceLoaded)
local AvatarRoute = require(script.Reducers.AvatarRoute)
local ItemDetailsPeekView = require(script.Reducers.ItemDetailsPeekView)
local PlayingSwimAnimation2 = require(script.Reducers.PlayingSwimAnimation)
local ShouldDelaySaveManager = require(script.Reducers.ShouldDelaySaveManager)
local CameraButton = require(script.Reducers.CameraButton)

return {
	Actions = {
		AddAnalyticsMetadata = AddAnalyticsMetadata,
		AvatarExperienceLoaded = AvatarExperienceLoaded,
		PlayingSwimAnimation = PlayingSwimAnimation,
		SetAvatarSceneRoute = SetAvatarSceneRoute,
		SetItemDetailsPeekViewState = SetItemDetailsPeekViewState,
		SetItemTryOnPeekViewState = SetItemTryOnPeekViewState,
		SetTryOnManagerPeekViewState = SetTryOnManagerPeekViewState,
		SetCurrentCharacter = SetCurrentCharacter,
		SetLookDetailsPeekViewSelectedTab = SetLookDetailsPeekViewSelectedTab,
		AddSaveDelay = AddSaveDelay,
		RemoveSaveDelay = RemoveSaveDelay,
		SetCameraButtonStatus = SetCameraButtonStatus,
		SetCameraButtonErrorOccurred = SetCameraButtonErrorOccurred
	},
	Reducers = {
		CurrentCharacter = CurrentCharacter,
		AnalyticsMetadata = AnalyticsMetadata,
		AvatarExperienceLoaded = AvatarExperienceLoaded2,
		AvatarRoute = AvatarRoute,
		ItemDetailsPeekView = ItemDetailsPeekView,
		PlayingSwimAnimation = PlayingSwimAnimation2,
		ShouldDelaySaveManager = ShouldDelaySaveManager,
		CameraButton = CameraButton
	},
	Constants = Constants,
	Utils = {
		ReducerUtils = ReducerUtils
	},
	["jest.config"] = script["jest.config"]
}
