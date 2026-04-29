local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Cryo = require(CorePackages.Packages.Cryo)
local Roact = require(CorePackages.Packages.Roact)
local React = require(CorePackages.Packages.React)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local UIBlox = require(CorePackages.Packages.UIBlox)
local withStyle = UIBlox.Style.withStyle
local withLocalization = require(Modules.LuaApp.withLocalization)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local Foundation = require(CorePackages.Packages.Foundation)
local FoundationImage = Foundation.Image
local useTokens = Foundation.Hooks.useTokens
local useDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local CrossDeviceLogin = require(Modules.LuaApp.Thunks.Authentication.CrossDeviceLogin)
local RoactAnalyticsAuthEvents = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local FitChildren = require(Modules.LuaApp.FitChildren)
local FitTextLabel = require(Modules.LuaApp.Components.FitTextLabel)
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local CrossDevicePhoneLayout = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDevicePhoneLayout)
local CrossDeviceTabletLayout = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceTabletLayout)
local GetFFlagEnableAuthsecImageUpdate = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAuthsecImageUpdate
local GetFFlagEnableCrossDeviceEnterCodeRefresh = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceEnterCodeRefresh)
local Images = UIBlox.App.ImageSet.Images
local IconSize = UIBlox.App.ImageSet.Enum.IconSize
local getIconSize = UIBlox.App.ImageSet.getIconSize
local getIconSizeUDim2 = UIBlox.App.ImageSet.getIconSizeUDim2
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local v33 = Images["icons/graphic/devices_xxlarge"]
local v34 = getIconSize(IconSize.XLarge)
local v35 = Images["icons/status/alert"]
local v36 = getIconSizeUDim2(IconSize.Medium)
local v37 = Roact.PureComponent:extend("CrossDeviceConfirmLoginView")
local EventStreamConstants = require(Modules.LuaApp.EventStreamConstants)

function v37.init(p1) -- line: 53
	-- upvalues: Foundation (copy), EventStreamConstants (copy), RbxAnalyticsService (copy)
	p1:setState({
		isConfirming = false
	})

	function p1.getVerifyCodeImage(s1: string) -- line: 58
		-- upvalues: Foundation (copy)
		if s1 == Foundation.Enums.Theme.Dark then
			return "icons/graphic/verifyCode_dark"
		end

		return "icons/graphic/verifyCode_light"
	end

	p1.confirming = false

	function p1.confirmButtonPressed() -- line: 67
		-- upvalues: p1 (copy), EventStreamConstants (copy)
		if not p1.confirming then
			p1.confirming = true
			p1:setState({
				isConfirming = true
			})
			p1.props.authAnalytics.reportButtonClicked(EventStreamConstants.Context.ApproveQuickLogin, EventStreamConstants.Button.GrantAccess)
			p1.props.confirmDeviceAccess(p1.props.networking, p1.props.deviceCode):andThen(function(_) -- line: 77
				-- upvalues: p1 (copy)
				p1.confirmCallback(true)
			end, function(_) -- line: 79
				-- upvalues: p1 (copy)
				p1.confirmCallback(false)
			end)
		end
	end
	function p1.confirmCallback(p4) -- line: 85
		-- upvalues: p1 (copy), RbxAnalyticsService (copy)
		if p1.confirming then
			p1.confirming = false
			p1:setState({
				isConfirming = false
			})
			p1.props.openConfirmationModal(p4, p1.props.closeCallback, p1.props.retryCallback, p1.props.deviceString)

			if p1.props.source == "vng" then
				RbxAnalyticsService:ReportCounter("CrossAppLoginSuccess", 1)
				p1.props.linking:openURL("robloxvng://")
			end
		end
	end
	function p1.closeButtonPressed() -- line: 106
		-- upvalues: p1 (copy)
		p1.props.cancelLoginCode(p1.props.networking, p1.props.deviceCode)

		if p1.props.closeCallback then
			p1.props.closeCallback()
		end
	end
end
function v37.didMount(p5) -- line: 114
	-- upvalues: EventStreamConstants (copy)
	p5.props.authAnalytics.reportScreenLoaded(EventStreamConstants.Context.ApproveQuickLogin)
end
function v37.willUnmount(p6) -- line: 118
	p6.confirming = false
end
function v37.render(p7) -- line: 122
	-- upvalues: GetFFlagEnableCrossDeviceEnterCodeRefresh (copy), withStyle (copy), withLocalization (copy), GetFFlagEnableAuthsecImageUpdate (copy), Roact (copy), FoundationImage (copy), ImageSetLabel (copy), v33 (copy), CrossDeviceTabletLayout (copy), CrossDevicePhoneLayout (copy), FitChildren (copy), v34 (copy), v36 (copy), v35 (copy), FitTextLabel (copy), Button (copy), ButtonType (copy)
	local isWideView = p7.props.isWideView
	local isConfirming = p7.state.isConfirming
	local v47 = not GetFFlagEnableCrossDeviceEnterCodeRefresh() and "Authentication.CrossDevice.Action.ConfirmLogin" or "Authentication.CrossDevice.Label.Confirm"

	return withStyle(function(p8) -- line: 129
		-- upvalues: withLocalization (copy), v47 (copy), p7 (copy), isWideView (copy), GetFFlagEnableCrossDeviceEnterCodeRefresh (copy), GetFFlagEnableAuthsecImageUpdate (copy), Roact (copy), FoundationImage (copy), ImageSetLabel (copy), v33 (copy), CrossDeviceTabletLayout (copy), CrossDevicePhoneLayout (copy), FitChildren (copy), v34 (copy), v36 (copy), v35 (copy), FitTextLabel (copy), Button (copy), ButtonType (copy), isConfirming (copy)
		return withLocalization({
			heading = "Authentication.CrossDevice.Heading.Warning",
			confirmation1 = "Authentication.CrossDevice.Label.ConfirmationMessage1",
			confirmation2 = "Authentication.CrossDevice.Label.ConfirmationMessage2",
			confirmation3 = "Authentication.CrossDevice.Label.ConfirmationMessage3",
			confirm = v47,
			cancel = "Authentication.CrossDevice.Action.CancelLogin"
		})(function(p9) -- line: 137
			-- upvalues: p7 (copy), isWideView (copy), p8 (copy), GetFFlagEnableCrossDeviceEnterCodeRefresh (copy), GetFFlagEnableAuthsecImageUpdate (copy), Roact (copy), FoundationImage (copy), ImageSetLabel (copy), v33 (copy), CrossDeviceTabletLayout (copy), CrossDevicePhoneLayout (copy), FitChildren (copy), v34 (copy), v36 (copy), v35 (copy), FitTextLabel (copy), Button (copy), ButtonType (copy), isConfirming (copy)
			local designTokens = p7.props.designTokens
			local uDim2 = UDim2.fromOffset(designTokens.LuaApps.CrossDeviceLogin.iconSize, designTokens.LuaApps.CrossDeviceLogin.iconSize)
			local headerFontFont = designTokens.LuaApps.CrossDeviceLogin.headerFont.Font
			local FontSize = designTokens.LuaApps.CrossDeviceLogin.headerFont.FontSize
			local headerTextColorColor3 = designTokens.LuaApps.CrossDeviceLogin.headerTextColor.Color3
			local v73 = isWideView and p7.props.tokens.Size.Size_2000 * 2 or p7.props.tokens.Size.Size_2000 * 4
			local v74 = isWideView and p7.props.tokens.Size.Size_2200 or p7.props.tokens.Size.Size_2200 * 2
			local v75 = not isWideView and p7.props.tokens.Size.Size_350 or 0
			local bodyFontFont = designTokens.LuaApps.CrossDeviceLogin.bodyFont.Font
			local FontSize2 = designTokens.LuaApps.CrossDeviceLogin.bodyFont.FontSize
			local bodyTextColorColor3 = designTokens.LuaApps.CrossDeviceLogin.bodyTextColor.Color3
			local headerTextColorTransparency = designTokens.LuaApps.CrossDeviceLogin.headerTextColor.Transparency
			local textAlertFontFont = designTokens.LuaApps.CrossDeviceLogin.textAlertFont.Font
			local FontSize3 = designTokens.LuaApps.CrossDeviceLogin.textAlertFont.FontSize
			local textAlertColorColor3 = designTokens.LuaApps.CrossDeviceLogin.textAlertColor.Color3
			local BaseSize = p8.Font.BaseSize
			local UIEmphasisColor = p8.Theme.UIEmphasis.Color
			local v85 = nil

			if not GetFFlagEnableCrossDeviceEnterCodeRefresh() then
				v85 = if not GetFFlagEnableAuthsecImageUpdate() then Roact.createElement(ImageSetLabel, {
					Size = uDim2,
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					ScaleType = Enum.ScaleType.Fit,
					Image = v33,
					ImageColor3 = UIEmphasisColor,
					ImageTransparency = 0
				}) else Roact.createElement("Frame", {
					LayoutOrder = 1,
					Size = isWideView and uDim2 or UDim2.new(0, v73, 0, v74 - v75),
					BackgroundTransparency = 1
				}, {
					Image = Roact.createElement(FoundationImage, {
						Image = p7.getVerifyCodeImage(p7.props.tokens.Config.ColorMode.Name),
						ScaleType = Enum.ScaleType.Fit,
						Size = UDim2.new(0, v73, 0, v74),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				})
			end

			return Roact.createElement(isWideView and CrossDeviceTabletLayout or CrossDevicePhoneLayout, {
				TabletHeaderText = p9.tabletHeader,
				Style = p8,
				HighKeyboardMode = p7.props.highKeyboardMode,
				Icon = v85,
				WarningText = Roact.createElement(FitChildren.FitFrame, {
					LayoutOrder = 2,
					Size = UDim2.new(1, isWideView and -50 - v34 or -20, 0, 0),
					fitAxis = FitChildren.FitAxis.Height,
					BackgroundTransparency = 1
				}, {
					Align = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = UDim.new(0, 6),
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					TopWarning = not GetFFlagEnableAuthsecImageUpdate() and Roact.createElement(FitChildren.FitFrame, {
						fitAxis = FitChildren.FitAxis.Height,
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 1
					}, {
						ListLayout = Roact.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = isWideView and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center,
							Padding = UDim.new(0, 0),
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						WarningIcon1 = Roact.createElement(ImageSetLabel, {
							Size = v36,
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							ScaleType = Enum.ScaleType.Fit,
							Image = v35,
							ImageColor3 = UIEmphasisColor,
							ImageTransparency = 0
						}),
						WarningText = Roact.createElement(FitTextLabel, {
							LayoutOrder = 2,
							Size = UDim2.new(0, BaseSize, 1, 0),
							Text = p9.heading,
							TextWrapped = true,
							Font = headerFontFont,
							TextSize = FontSize,
							TextColor3 = headerTextColorColor3,
							TextTransparency = headerTextColorTransparency,
							TextXAlignment = isWideView and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
							fitAxis = FitChildren.FitAxis.Width,
							BackgroundTransparency = 1
						}),
						WarningIcon2 = Roact.createElement(ImageSetLabel, {
							Size = v36,
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							ScaleType = Enum.ScaleType.Fit,
							Image = v35,
							ImageColor3 = UIEmphasisColor,
							ImageTransparency = 0
						})
					}) or nil,
					Warning1 = Roact.createElement(FitTextLabel, {
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, 0),
						Text = string.format(p9.confirmation1, p7.props.deviceString),
						TextWrapped = true,
						Font = bodyFontFont,
						TextSize = FontSize2,
						TextColor3 = bodyTextColorColor3,
						TextTransparency = headerTextColorTransparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						fitAxis = FitChildren.FitAxis.Height,
						BackgroundTransparency = 1
					}),
					Warning2 = Roact.createElement(FitTextLabel, {
						LayoutOrder = 4,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p9.confirmation2,
						TextWrapped = true,
						Font = textAlertFontFont,
						TextSize = FontSize3,
						TextColor3 = textAlertColorColor3,
						TextTransparency = headerTextColorTransparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						fitAxis = FitChildren.FitAxis.Height,
						BackgroundTransparency = 1
					}),
					Warning3 = Roact.createElement(FitTextLabel, {
						LayoutOrder = 5,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p9.confirmation3,
						TextWrapped = true,
						Font = bodyFontFont,
						TextSize = FontSize2,
						TextColor3 = bodyTextColorColor3,
						TextTransparency = headerTextColorTransparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						fitAxis = FitChildren.FitAxis.Height,
						BackgroundTransparency = 1
					})
				}),
				LoginButton = Roact.createElement(Button, {
					buttonType = ButtonType.PrimarySystem,
					size = UDim2.new(1, 0, 1, 0),
					text = p9.confirm,
					onActivated = p7.confirmButtonPressed,
					isLoading = isConfirming
				}),
				CancelButton = Roact.createElement(Button, {
					buttonType = ButtonType.Secondary,
					size = UDim2.new(1, 0, 1, 0),
					text = p9.cancel,
					onActivated = p7.closeButtonPressed
				})
			})
		end)
	end)
end

local v39 = RoactServices.connect({
	networking = RoactNetworking,
	authAnalytics = RoactAnalyticsAuthEvents,
	linking = AppLinking
})(v37)
local v40 = RoactRodux.connect(function(p10, _) -- line: 319
	return {
		screenSize = p10.ScreenSize
	}
end, function(p12) -- line: 323
	-- upvalues: CrossDeviceLogin (copy)
	return {
		confirmDeviceAccess = function(p13, p14) --[[ confirmDeviceAccess ]] -- line: 325
			-- upvalues: p12 (copy), CrossDeviceLogin (copy)
			return p12(CrossDeviceLogin.ConfirmDeviceAccess(p13, p14))
		end,
		cancelLoginCode = function(p15, p16) --[[ cancelLoginCode ]] -- line: 328
			-- upvalues: p12 (copy), CrossDeviceLogin (copy)
			return p12(CrossDeviceLogin.CancelLoginCode(p15, p16))
		end,
		openConfirmationModal = function(p17, p18, p19, p20) --[[ openConfirmationModal ]] -- line: 331
			-- upvalues: p12 (copy), CrossDeviceLogin (copy)
			return p12(CrossDeviceLogin.OpenConfirmationOverlay(p17, p18, p19, p20))
		end
	}
end)(v39)

return function(p21) -- line: 340
	-- upvalues: useDesignTokens (copy), useTokens (copy), React (copy), v40 (copy), Cryo (copy)
	local v52 = useDesignTokens()
	local v53 = useTokens()

	return React.createElement(v40, Cryo.Dictionary.join(p21, {
		designTokens = v52,
		tokens = v53
	}))
end
