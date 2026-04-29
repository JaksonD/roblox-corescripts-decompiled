local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local GameInvite = script:FindFirstAncestor("GameInvite")
local Components = GameInvite.Components
local Context = GameInvite.Context
local Actions = GameInvite.State.Actions
local GameInviteParent = GameInvite.Parent
local React = require(GameInviteParent.React)
local RoactUtils = require(GameInviteParent.RoactUtils)
local ReactRoblox = require(GameInviteParent.ReactRoblox)
local Promise = require(GameInviteParent.Promise)
local GetGameNameAndDescription = require(GameInviteParent.GameDetailRodux).GetGameNameAndDescription
local InputHandlers = require(GameInviteParent.InputHandlers)
local FocusNavigationUtils = require(GameInviteParent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtils.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtils.FocusNavigationEventNameEnum

require(GameInvite.gameInviteModalType)

local GameInviteModalManager = require(GameInvite.GameInviteModalManager)
local GameInviteModalLayoutProvider = require(Context.GameInviteModalLayoutProvider)
local GameInviteModalWindow = require(Components.GameInviteModalWindow)
local GameInviteContentWrapper = require(Components.GameInviteContentWrapper)
local GameInviteDependencies = require(GameInvite.GameInviteDependencies)
local GameInviteConstants = require(GameInvite.GameInviteConstants)
local ResetUserInviteStatus = require(Actions.ResetUserInviteStatus)
local IxpUtils = require(GameInviteParent.IxpUtils)
local VrCompatibility = require(GameInviteParent.VrCompatibility)
local VRReadyWrapper = VrCompatibility.VRReadyWrapper
local VRConstants = VrCompatibility.VRConstants
local VRPanelWidthIXP = VrCompatibility.VRPanelWidthIXP
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local networkImpl = GameInviteDependencies.networkImpl

game:DefineFastFlag("LuaEnableGameInviteModal2023V5", false)

local SharedFlags = require(GameInviteParent.SharedFlags)
local GetFFlagEnableGameInviteModalVRSupport = SharedFlags.GetFFlagEnableGameInviteModalVRSupport
local GetFFlagVRPanelWidthIXPEnabled = SharedFlags.GetFFlagVRPanelWidthIXPEnabled
local isInExperienceUIVREnabled = require(GameInviteParent.SharedExperimentDefinition).isInExperienceUIVREnabled
local FFlagHideCloseButtonEdp = SharedFlags.FFlagHideCloseButtonEdp
local FFlagLuaAppForceVrAppPanelWidthRollout = SharedFlags.FFlagLuaAppForceVrAppPanelWidthRollout
local FFlagEnableInExperienceUIPCVRFix = SharedFlags.FFlagEnableInExperienceUIPCVRFix
local Responsive = nil
local UIManager = nil
local PanelType = nil
local u43 = nil

if isInExperienceUIVREnabled then
	Responsive = require(GameInviteParent.Responsive)
	u43 = if not FFlagEnableInExperienceUIPCVRFix then nil else require(GameInviteParent.Foundation).Hooks.useStyleSheet

	local VrSpatialUi = require(GameInviteParent.VrSpatialUi)

	UIManager = VrSpatialUi.UIManager
	PanelType = VrSpatialUi.Constants.PanelType
end

local t1 = {
	[FocusNavigationEventNameEnum.NavigateBack] = {
		handler = InputHandlers.onRelease(function(p1) -- line: 68
			-- upvalues: GameInviteModalManager (copy)
			GameInviteModalManager:closeModal()
			p1:cancel()
		end)
	}
}

return function(t2: {[any]: any}) -- line: 79
	-- upvalues: FFlagLuaAppForceVrAppPanelWidthRollout (copy), GetFFlagVRPanelWidthIXPEnabled (copy), IxpUtils (copy), VRPanelWidthIXP (copy), React (copy), RunService (copy), GameInviteConstants (copy), useDispatch (copy), isInExperienceUIVREnabled (copy), Responsive (ref), FFlagEnableInExperienceUIPCVRFix (copy), u43 (ref), ResetUserInviteStatus (copy), GameInviteModalManager (copy), GuiService (copy), Promise (copy), RobloxReplicatedStorage (copy), GetGameNameAndDescription (copy), networkImpl (copy), GameInviteModalWindow (copy), GameInviteContentWrapper (copy), FFlagHideCloseButtonEdp (copy), GetFFlagEnableGameInviteModalVRSupport (copy), VRReadyWrapper (copy), VRConstants (copy), GameInviteModalLayoutProvider (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), t1 (copy), UIManager (ref), PanelType (ref), ReactRoblox (copy)
	if not game:GetFastFlag("LuaEnableGameInviteModal2023V5") then
		return nil
	end

	local v48 = if FFlagLuaAppForceVrAppPanelWidthRollout or not GetFFlagVRPanelWidthIXPEnabled() then nil else IxpUtils.useTestVariables(VRPanelWidthIXP.VrAppPanelWidthMultiplier)
	local v49 = if FFlagLuaAppForceVrAppPanelWidthRollout or not GetFFlagVRPanelWidthIXPEnabled() then nil else IxpUtils.useTestVariables(VRPanelWidthIXP.VrAppPanelCurvature)
	local v50, v51 = React.useState(false)
	local v52, v53 = React.useState(false)
	local v54, v55 = React.useState({})
	local v56, v57 = React.useState({})
	local v58, v59 = React.useState("")
	local v60 = not RunService:IsStudio()
	local v61 = t2.renderLocation == GameInviteConstants.RenderLocation.CoreScripts
	local v62 = t2.renderLocation == GameInviteConstants.RenderLocation.UniversalApp
	local v63 = useDispatch()
	local v64 = nil
	local v65 = nil

	if isInExperienceUIVREnabled then
		v64 = Responsive.useIsSpatial()
		v65 = if not FFlagEnableInExperienceUIPCVRFix then nil else u43()
	end

	local function v66(p2, p3, p4) -- line: 114
		-- upvalues: v51 (copy), v53 (copy), v55 (copy), v62 (copy), v63 (copy), ResetUserInviteStatus (copy)
		v51(p2)
		v53(p3 or false)

		if p4 then
			v55(p4)
		end

		if v62 and not p2 and v63 then
			v63(ResetUserInviteStatus())
		end
	end

	React.useEffect(function() -- line: 126
		-- upvalues: GameInviteModalManager (copy), v66 (copy)
		local connection = GameInviteModalManager.ToggleGameInviteModalEvent.Event:Connect(v66)

		return function() -- line: 128
			-- upvalues: connection (copy)
			connection:Disconnect()
		end
	end, {})
	React.useEffect(function() -- line: 134
		-- upvalues: v61 (copy), GuiService (copy), v50 (copy), GameInviteModalManager (copy)
		if v61 then
			local connection = GuiService.MenuOpened:Connect(function() -- line: 136
				-- upvalues: v50 (copy), GameInviteModalManager (copy)
				if v50 then
					GameInviteModalManager:closeModal()
				end
			end)

			return function() -- line: 141
				-- upvalues: connection (copy)
				connection:Disconnect()
			end
		end

		return function() -- line: 145
		end
	end, {
		v50,
		v61
	})
	React.useEffect(function() -- line: 150
		-- upvalues: v60 (copy), v50 (copy), v61 (copy), v58 (copy), Promise (copy), RobloxReplicatedStorage (copy), v59 (copy), GetGameNameAndDescription (copy), v56 (copy), networkImpl (copy), v57 (copy)
		if v60 and (v50 and v61) then
			if v58 == "" then
				Promise.try(function() -- line: 154
					-- upvalues: RobloxReplicatedStorage (copy)
					return RobloxReplicatedStorage:WaitForChild("GetServerType", 2):InvokeServer()
				end):andThen(function(p5) -- line: 157
					-- upvalues: v59 (copy)
					v59(p5)
				end)
			end

			if GetGameNameAndDescription and not v56.Created then
				GetGameNameAndDescription(networkImpl, game.GameId):andThen(function(p6) -- line: 163
					-- upvalues: v57 (copy)
					v57(p6)
				end)
			end
		end
	end, { v50 })

	if v50 then
		local v67 = React.createElement(GameInviteModalWindow, {}, {
			GameInviteModalContentWrapper = React.createElement(GameInviteContentWrapper, {
				options = v54,
				serverType = v58,
				gameDetails = v56,
				isLoading = v52,
				isCoreScript = v61,
				disableSelectionParentManagement = v62,
				hideCloseButton = if not FFlagHideCloseButtonEdp then nil else v54.hideCloseButton
			})
		})

		if GetFFlagEnableGameInviteModalVRSupport() and v62 then
			return React.createElement(VRReadyWrapper, {
				component = "ScreenGui",
				props = {
					DisplayOrder = t2.displayOrder,
					ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
					IgnoreGuiInset = true,
					Name = GameInviteConstants.ParentComponentName
				},
				vrProps = {
					partSize = if FFlagLuaAppForceVrAppPanelWidthRollout or not v48 then VRConstants.MainScreenSize else Vector2.new(VRConstants.MainScreenSize.X * v48, VRConstants.MainScreenSize.Y),
					offset = if not FFlagLuaAppForceVrAppPanelWidthRollout and (not GetFFlagVRPanelWidthIXPEnabled() or v49 ~= 0) then CFrame.lookAt(VRConstants.MainScreenPosition, VRConstants.DefaultCameraPosition) else CFrame.new(VRConstants.MainScreenPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0),
					virtualScreenSize = if FFlagLuaAppForceVrAppPanelWidthRollout or not v48 then VRConstants.MainScreenResolution else Vector2.new(VRConstants.MainScreenResolution.X * v48, VRConstants.MainScreenResolution.Y),
					panelName = "GameInviteMenu",
					curvature = not FFlagLuaAppForceVrAppPanelWidthRollout and v49 or VRConstants.MainScreenCurvature
				}
			}, {
				GameInviteModalLayoutProvider = React.createElement(GameInviteModalLayoutProvider, {
					isCoreScript = v61
				}, {
					ModalWindowContainer = if not v62 then v67 else React.createElement(FocusNavigableSurfaceWrapper, {
						surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
						isAutoFocusRoot = true,
						isIsolated = true,
						isFocusable = true,
						customEventHandlers = t1
					}, {
						ModalWindowContainer = v67
					})
				})
			})
		end

		if isInExperienceUIVREnabled and v64 then
			local v68 = UIManager.getInstance():getPanelObject(PanelType.MoreMenu)
			local v69 = if not FFlagEnableInExperienceUIPCVRFix then nil else UIManager.getInstance():getPanelSizeInPixel(PanelType.MoreMenu)

			return ReactRoblox.createPortal({
				FoundationStyleLink = if not FFlagEnableInExperienceUIPCVRFix then nil else React.createElement("StyleLink", {
					StyleSheet = v65
				}),
				GameInviteModalLayoutProvider = React.createElement(GameInviteModalLayoutProvider, {
					isCoreScript = v61,
					screenSizeOverride = if not FFlagEnableInExperienceUIPCVRFix then nil else v69
				}, {
					ModalWindowContainer = React.createElement(GameInviteModalWindow, {}, {
						GameInviteModalContentWrapper = React.createElement(GameInviteContentWrapper, {
							options = v54,
							serverType = v58,
							gameDetails = v56,
							isLoading = v52,
							isCoreScript = v61
						})
					})
				})
			}, v68)
		end

		return React.createElement("ScreenGui", {
			DisplayOrder = t2.displayOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			IgnoreGuiInset = true,
			Name = GameInviteConstants.ParentComponentName
		}, {
			GameInviteModalLayoutProvider = React.createElement(GameInviteModalLayoutProvider, {
				isCoreScript = v61
			}, {
				ModalWindowContainer = if not v62 then v67 else React.createElement(FocusNavigableSurfaceWrapper, {
					surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
					isAutoFocusRoot = true,
					isFocusable = true,
					isIsolated = true,
					customEventHandlers = t1
				}, {
					ModalWindowContainer = v67
				})
			})
		})
	end

	return nil
end
