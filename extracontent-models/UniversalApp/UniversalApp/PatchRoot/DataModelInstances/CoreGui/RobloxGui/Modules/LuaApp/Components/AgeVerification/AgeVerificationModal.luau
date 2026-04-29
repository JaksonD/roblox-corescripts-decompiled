local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local t = require(CorePackages.Packages.t)
local Roact = require(CorePackages.Packages.Roact)
local React = require(CorePackages.Packages.React)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local ExperienceDetailsExperimentation = require(script.Parent.Parent.ExperienceDetails.ExperienceDetailsExperimentation)
local Cryo = require(CorePackages.Packages.Cryo)
local NavigateDown = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateBack = require(Modules.LuaApp.Thunks.NavigateBack)
local FetchGameDetailsPageData = require(Modules.LuaApp.Thunks.Games.FetchGameDetailsPageData)
local UrlBuilder = require(Modules.LuaApp.Http.UrlBuilder)
local AppPage = require(Modules.LuaApp.AppPage)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local getCurrentPage = require(Modules.LuaApp.getCurrentPage)
local withLocalization = require(CorePackages.Workspace.Packages.Localization).withLocalization
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppEventIngestService = require(Modules.LuaApp.Services.AppEventIngestService)
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local useAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local UIBlox = require(CorePackages.Packages.UIBlox)
local PartialPageModal = UIBlox.App.Dialog.Modal.PartialPageModal
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local withStyle = UIBlox.Core.Style.withStyle
local v28 = Roact.PureComponent:extend("AgeVerificationModal")

v28.validateProps = t.strictInterface({
	universeId = t.string,
	pageName = t.string,
	screenSize = t.Vector2,
	navigateDown = t.callback,
	navigateBack = t.callback,
	dispatchFetchGameDetailsPageData = t.callback,
	eventIngest = t.table,
	networking = t.callback,
	areWebviewsSupported = t.boolean,
	shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else t.optional(t.boolean)
})

function v28.init(p1) -- line: 55
	p1.isMounted = false

	function p1.trackDeeplinkClick(p2, p3) -- line: 58
		-- upvalues: p1 (copy)
		local t1 = {
			universeId = p3
		}

		p1.props.eventIngest:setRBXEventStream(p2, "ageVerificationUpsellClick", t1)
	end
end
function v28.didMount(p4) -- line: 68
	p4.isMounted = true
end
function v28.willUnmount(p5) -- line: 72
	-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
	local networking = p5.props.networking
	local universeId = p5.props.universeId

	if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then
		p5.props.dispatchFetchGameDetailsPageData(networking, universeId, nil, p5.props.shouldHydrateLegacyIxp)
	else
		p5.props.dispatchFetchGameDetailsPageData(networking, universeId)
	end

	p5.isMounted = false
end
function v28.render(p6) -- line: 86
	-- upvalues: withStyle (copy), withLocalization (copy), ButtonType (copy), AppPage (copy), UrlBuilder (copy), Roact (copy), PartialPageModal (copy), StyledTextLabel (copy)
	return withStyle(function(p7) -- line: 87
		-- upvalues: withLocalization (copy), ButtonType (copy), p6 (copy), AppPage (copy), UrlBuilder (copy), Roact (copy), PartialPageModal (copy), StyledTextLabel (copy)
		return withLocalization({
			title = "Feature.AgeVerificationUpsell.Modal.Title",
			message = "Feature.AgeVerificationUpsell.Modal.ContentText",
			buttonCancel = "Feature.AgeVerificationUpsell.Button.Cancel",
			buttonSettings = "Feature.AgeVerificationUpsell.Button.Settings"
		})(function(p8) -- line: 93
			-- upvalues: ButtonType (copy), p6 (copy), AppPage (copy), UrlBuilder (copy), Roact (copy), PartialPageModal (copy), StyledTextLabel (copy), p7 (copy)
			local t2 = {{
				buttonType = ButtonType.Secondary,
				props = {
					isDisabled = false,
					onActivated = p6.props.navigateBack,
					text = p8.buttonCancel
				}
			}}

			if p6.props.areWebviewsSupported then
				table.insert(t2, {
					buttonType = ButtonType.PrimarySystem,
					props = {
						isDisabled = false,
						onActivated = function() --[[ onActivated ]] -- line: 109
							-- upvalues: p6 (copy), AppPage (copy), UrlBuilder (copy), p8 (copy)
							if p6.isMounted then
								p6.trackDeeplinkClick(p6.props.pageName, p6.props.universeId)
								p6.props.navigateDown({
									name = AppPage.GenericWebPage,
									detail = UrlBuilder.static.settings.account(),
									extraProps = {
										title = p8.buttonSettings
									}
								})
							end
						end,
						text = p8.buttonSettings
					}
				})
			end

			local v59 = Roact.createElement(PartialPageModal, {
				title = p8.title,
				screenSize = p6.props.screenSize,
				buttonStackProps = {
					forcedFillDirection = Enum.FillDirection.Horizontal,
					buttonHeight = 48,
					buttons = t2
				}
			}, {
				ViewFrame = Roact.createElement("Frame", {
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundTransparency = 1
				}, {
					UIPadding = Roact.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, 24)
					}),
					Text = Roact.createElement(StyledTextLabel, {
						fontStyle = p7.Font.Body,
						colorStyle = p7.Theme.TextEmphasis,
						size = UDim2.new(1, 0, 0, 0),
						fluidSizing = false,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Center,
						automaticSize = Enum.AutomaticSize.Y,
						text = p8.message
					})
				})
			})

			return Roact.createElement("ImageButton", {
				AutoButtonColor = false,
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				BackgroundColor3 = Color3.new(0, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0
			}, {
				Overlay = Roact.createElement("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BorderSizePixel = 0,
					BackgroundTransparency = 1
				}, {
					Content = v59
				})
			})
		end)
	end)
end

local v29 = RoactServices.connect({
	eventIngest = AppEventIngestService,
	networking = RoactNetworking
})(v28)
local v30 = RoactRodux.connect(function(p9, _) -- line: 181
	-- upvalues: getCurrentPage (copy)
	return {
		screenSize = p9.ScreenSize,
		pageName = getCurrentPage(p9)
	}
end, function(p11) -- line: 186
	-- upvalues: NavigateDown (copy), NavigateBack (copy), FetchGameDetailsPageData (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
	return {
		navigateDown = function(p12) --[[ navigateDown ]] -- line: 188
			-- upvalues: p11 (copy), NavigateDown (copy)
			return p11(NavigateDown(p12))
		end,
		navigateBack = function() --[[ navigateBack ]] -- line: 191
			-- upvalues: p11 (copy), NavigateBack (copy)
			return p11(NavigateBack())
		end,
		dispatchFetchGameDetailsPageData = function(p13, p14, p15, p16) --[[ dispatchFetchGameDetailsPageData ]] -- line: 194
			-- upvalues: p11 (copy), FetchGameDetailsPageData (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
			return p11(FetchGameDetailsPageData(p13, p14, p15, if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p16))
		end
	}
end)(v29)

if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then
	local v31 = v30

	function v30(p17) -- line: 209
		-- upvalues: ExperienceDetailsExperimentation (copy), React (copy), IXPService (copy), AppUserLayers (copy), Roact (copy), v31 (copy), Cryo (copy)
		local v43 = ExperienceDetailsExperimentation.getShouldHydrateLegacy()

		React.useEffect(function() -- line: 212
			-- upvalues: IXPService (copy), AppUserLayers (copy)
			IXPService:LogUserLayerExposure(AppUserLayers.ExperienceDetailsPageExposureLayer)
		end, {})

		return Roact.createElement(v31, Cryo.Dictionary.join(p17, {
			shouldHydrateLegacyIxp = v43
		}))
	end
end

local v32 = v30

return function(p18) -- line: 227
	-- upvalues: useAppPolicy (copy), Cryo (copy), Roact (copy), v32 (copy)
	local v45 = useAppPolicy(function(p19) -- line: 228
		return p19.getWebViewSupport()
	end)
	local v46 = Cryo.Dictionary.join(p18, {
		areWebviewsSupported = v45
	})

	return Roact.createElement(v32, v46)
end
