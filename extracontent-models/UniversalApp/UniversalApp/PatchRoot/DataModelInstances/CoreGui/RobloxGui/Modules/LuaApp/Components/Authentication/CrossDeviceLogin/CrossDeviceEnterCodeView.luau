local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local Cryo = require(CorePackages.Packages.Cryo)
local Roact = require(CorePackages.Packages.Roact)
local React = require(CorePackages.Packages.React)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local UIBlox = require(CorePackages.Packages.UIBlox)
local withStyle = UIBlox.Style.withStyle
local withLocalization = require(Modules.LuaApp.withLocalization)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local Foundation = require(CorePackages.Packages.Foundation)
local FoundationImage = Foundation.Image
local useTokens = Foundation.Hooks.useTokens
local View = Foundation.View
local FoundationText = Foundation.Text
local TextInput = Foundation.TextInput
local InputSize = Foundation.Enums.InputSize
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local useDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local CrossDeviceLogin = require(Modules.LuaApp.Thunks.Authentication.CrossDeviceLogin)
local RoactAnalyticsAuthEvents = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local EventStreamConstants = require(Modules.LuaApp.EventStreamConstants)
local GetIXPLayerParameters = require(Modules.LuaApp.Http.Requests.GetIXPLayerParameters)
local GetFFlagEnableCrossDeviceLoginUsingQRCodes = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes)
local GetFFlagEnableCrossDeviceEnterCodeRefresh = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceEnterCodeRefresh)
local FitChildren = require(Modules.LuaApp.FitChildren)
local FitTextLabel = require(Modules.LuaApp.Components.FitTextLabel)
local AuthCommon = require(CorePackages.Workspace.Packages.AuthCommon)
local TextInputBoxWithBorder = AuthCommon.Components.TextInputBoxWithBorder
local AuthStatefulRoundCornerBorder = AuthCommon.Components.AuthStatefulRoundCornerBorder
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local CrossDevicePhoneLayout = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDevicePhoneLayout)
local CrossDeviceTabletLayout = require(Modules.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceTabletLayout)
local Logger = require(Modules.LuaApp.Components.Authentication.Logger)
local GetFFlagEnableAuthsecImageUpdate = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAuthsecImageUpdate
local Images = UIBlox.App.ImageSet.Images
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local v41 = Images["icons/graphic/lock_xxlarge"]
local v42 = Roact.PureComponent:extend("CrossDeviceEnterCodePage")

function v42.init(p1) -- line: 97
	-- upvalues: Foundation (copy), Logger (copy), GetFFlagEnableCrossDeviceLoginUsingQRCodes (copy), GetFFlagEnableCrossDeviceEnterCodeRefresh (copy), EventStreamConstants (copy), Roact (copy)
	p1.latestSanitizedCode = ""
	p1:setState({
		inputCode = "",
		inputErrorKey = "",
		placeholderTextOverride = "",
		disableSubmissionForBadCode = false,
		isConfirming = false,
		isFocused = false
	})

	function p1.onFocus() -- line: 109
		-- upvalues: p1 (copy)
		p1:setState({
			inputErrorKey = "",
			isFocused = true
		})
	end
	function p1.onFocusLost(_, p3) -- line: 116
		-- upvalues: p1 (copy)
		if p3 and #p1.state.inputCode == 6 then
			p1.confirmButtonPressed()

			return
		end

		p1:setState({
			isFocused = false
		})
	end
	function p1.getVerifyCodeImage(s1: string) -- line: 126
		-- upvalues: Foundation (copy)
		if s1 == Foundation.Enums.Theme.Dark then
			return "icons/graphic/verifyCode_dark"
		end

		return "icons/graphic/verifyCode_light"
	end
	function p1.onTextChanged(p4) -- line: 134
		-- upvalues: p1 (copy), Logger (copy)
		local ok, result = pcall(function() -- line: 141
			-- upvalues: p4 (copy), p1 (copy)
			local v124 = p4.Text:gsub("[^%w]", ""):upper():sub(1, 6)

			if v124 ~= p4.Text then
				p4.Text = v124

				return
			end

			p1:setState({
				inputCode = p4.Text
			})
		end)

		if not ok then
			Logger:warning(string.format("Text validation error in CrossDeviceEnderCodeView: %s", (tostring(result))))
		end
	end
	function p1.onRefreshCodeChanged(s2: string) -- line: 156
		-- upvalues: p1 (copy), Logger (copy)
		local ok, result = pcall(function() -- line: 157
			-- upvalues: s2 (copy), p1 (copy)
			local v125 = s2:gsub("[^%w]", ""):upper():sub(1, 6)

			p1.latestSanitizedCode = v125
			p1.setInputText(v125)
			p1:setState({
				inputCode = v125
			})
		end)

		if not ok then
			Logger:warning(string.format("Text validation error in CrossDeviceEnderCodeView: %s", (tostring(result))))
		end
	end

	p1.attemptDeeplinkCode = true
	p1.confirmingCode = false

	function p1.confirmButtonPressed() -- line: 172
		-- upvalues: p1 (copy), GetFFlagEnableCrossDeviceLoginUsingQRCodes (copy), GetFFlagEnableCrossDeviceEnterCodeRefresh (copy), EventStreamConstants (copy)
		if not p1.confirmingCode then
			p1.confirmingCode = true
			p1:setState({
				isConfirming = true,
				isFocused = false
			})

			local code, s3

			if GetFFlagEnableCrossDeviceLoginUsingQRCodes() and p1.attemptDeeplinkCode and p1.props.code then
				code = p1.props.code
				s3 = "qrCode"
			else
				code = p1.state.inputCode
				s3 = "alphaNumericCode"
			end

			if GetFFlagEnableCrossDeviceEnterCodeRefresh() and s3 == "alphaNumericCode" then
				code = p1.latestSanitizedCode
			end

			p1.attemptDeeplinkCode = false

			if GetFFlagEnableCrossDeviceLoginUsingQRCodes() then
				p1.props.authAnalytics.reportButtonClickedWithCType(EventStreamConstants.Context.QuickLogin, EventStreamConstants.Button.EnterDeviceCode, s3)
			else
				p1.props.authAnalytics.reportButtonClicked(EventStreamConstants.Context.QuickLogin, EventStreamConstants.Button.EnterDeviceCode)
			end

			p1.props.validateCode(p1.props.networking, code):andThen(function(p5) -- line: 209
				-- upvalues: p1 (copy), code (ref)
				p1.acceptInputCode(code, p5.DeviceInfo)
			end, p1.clearInputCode)
		end
	end

	local v53, v54 = Roact.createBinding("")

	p1.inputText = v53
	p1.setInputText = v54

	function p1.clearInputCode(p6) -- line: 216
		-- upvalues: p1 (copy)
		p1.confirmingCode = false
		p1.latestSanitizedCode = ""
		p1.setInputText("")

		local s4 = "Authentication.Login.Response.SomethingWentWrong"

		if p6.Body == "\"CodeInvalid\"" then
			s4 = "Authentication.CrossDevice.Response.InvalidCode"
		elseif p6.Body == "\"InvalidLocation\"" then
			s4 = "Authentication.CrossDevice.Label.InvalidLocationError"
		end

		p1:setState({
			inputCode = "",
			inputErrorKey = s4,
			isConfirming = false
		})
	end
	function p1.acceptInputCode(p7, p8) -- line: 233
		-- upvalues: p1 (copy)
		if p1.props.confirmDeviceCode then
			p1.props.confirmDeviceCode(p7, p8)
		end
	end
end
function v42.didMount(p9) -- line: 240
	-- upvalues: EventStreamConstants (copy), GetIXPLayerParameters (copy)
	if p9.props.code then
		local v56 = p9.props.code:gsub("[^%w]", ""):upper():sub(1, 6)

		p9.setInputText(v56)
		p9.latestSanitizedCode = v56
		p9:setState({
			inputCode = v56
		})
		p9.confirmButtonPressed()
	end

	p9.isMounted = true
	p9.props.authAnalytics.reportScreenLoaded(EventStreamConstants.Context.QuickLogin)
	GetIXPLayerParameters(p9.props.networking, "PlayerApp.CrossDeviceLogin.ConfirmCode", { "HintTextOverride" }):andThen(function(p10) -- line: 258
		-- upvalues: p9 (copy)
		local v92 = p10 and p10.responseBody

		if v92 and p9.isMounted then
			local HintTextOverride = v92.HintTextOverride
			local ShouldDisableSubmissionForBadCode = v92.ShouldDisableSubmissionForBadCode

			p9:setState({
				placeholderTextOverride = HintTextOverride or "",
				disableSubmissionForBadCode = ShouldDisableSubmissionForBadCode or false
			})
		end
	end, function() -- line: 268
	end)
end
function v42.willUnmount(p11) -- line: 273
	p11.isMounted = false
end
function v42.renderEnterCodeRefresh(p12, p13, p14, p15) -- line: 277
	-- upvalues: withLocalization (copy), Text (copy), Players (copy), Roact (copy), View (copy), FoundationText (copy), TextInput (copy), InputSize (copy), Button (copy), ButtonType (copy)
	return withLocalization({
		refreshHeadline = "Authentication.CrossDevice.Heading.SigninAnotherDevice",
		refreshIntro = "Authentication.CrossDevice.Label.SigninInstructionHeading",
		refreshStep1 = "Authentication.CrossDevice.Label.SigninInstructionOne",
		refreshStep2 = "Authentication.CrossDevice.Label.SigninInstructionTwo",
		refreshStep3 = "Authentication.CrossDevice.Label.SigninInstructionThree",
		refreshSecurityFooter = "Authentication.CrossDevice.Label.QuickSignInWarning",
		refreshContinue = "Authentication.CrossDevice.Label.Continue",
		refreshPlaceholder = "Authentication.CrossDevice.Label.EnterCodeTextBox"
	})(function(p16) -- line: 287
		-- upvalues: p12 (copy), p13 (copy), Text (copy), Players (copy), p15 (copy), Roact (copy), View (copy), FoundationText (copy), TextInput (copy), InputSize (copy), Button (copy), ButtonType (copy), p14 (copy)
		local inputCode = p12.state.inputCode
		local v97 = p12.state.inputErrorKey == ""
		local isConfirming = p12.state.isConfirming
		local designTokens = p12.props.designTokens
		local bodyFontFont = designTokens.LuaApps.CrossDeviceLogin.bodyFont.Font
		local bodyTextColorColor3 = designTokens.LuaApps.CrossDeviceLogin.bodyTextColor.Color3
		local headerTextColorTransparency = designTokens.LuaApps.CrossDeviceLogin.headerTextColor.Transparency
		local textAlertColorColor3 = designTokens.LuaApps.CrossDeviceLogin.textAlertColor.Color3
		local BaseSize = p13.Font.BaseSize
		local refreshContinue = p16.refreshContinue
		local v106 = p12.props.tokens.Padding.Medium * 2
		local v107 = Text.GetTextWidth(refreshContinue, bodyFontFont, BaseSize) + v106
		local refreshIntro = p16.refreshIntro
		local LocalPlayer = Players.LocalPlayer
		local s5

		if not LocalPlayer then
			s5 = "Player"
		else
			local DisplayName = LocalPlayer.DisplayName

			s5 = if not DisplayName or DisplayName == "" then LocalPlayer.Name else DisplayName
		end

		local v112 = refreshIntro:gsub("{username}", "<b>" .. s5:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;") .. "</b>")
		local v113 = p12.state.placeholderTextOverride ~= "" and p12.state.placeholderTextOverride or p16.refreshPlaceholder
		local t1 = {
			Color3 = textAlertColorColor3,
			Transparency = headerTextColorTransparency
		}
		local t2 = {
			Color3 = bodyTextColorColor3,
			Transparency = headerTextColorTransparency
		}
		local Global = designTokens.Global
		local Size_1000 = p12.props.tokens.Size.Size_1000
		local Space_150 = Global.Space_150
		local v119 = p12.props.highKeyboardMode and not p15
		local verticalPadding = designTokens.LuaApps.CrossDeviceLogin.verticalPadding

		return Roact.createElement(View, {
			tag = "col align-x-left gap-xsmall size-full-0 auto-y",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Position = if not v119 then nil else UDim2.new(0, 0, 0, -verticalPadding),
			padding = {
				left = UDim.new(0, 0),
				right = UDim.new(0, 0)
			}
		}, {
			CopyBlock = not v119 and Roact.createElement(View, {
				tag = "col align-x-left gap-xsmall size-full-0 auto-y",
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				padding = {
					bottom = UDim.new(0, Space_150)
				}
			}, {
				HeadlineWrap = Roact.createElement(View, {
					tag = "col size-full-0 auto-y",
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					padding = {
						bottom = UDim.new(0, Space_150)
					}
				}, {
					Headline = Roact.createElement(FoundationText, {
						tag = "size-full-0 auto-xy text-heading-small text-wrap text-align-x-left",
						LayoutOrder = 1,
						Text = p16.refreshHeadline,
						TextWrapped = true
					})
				}),
				Intro = Roact.createElement(FoundationText, {
					tag = "size-full-0 auto-xy text-body-medium text-wrap text-align-x-left",
					LayoutOrder = 2,
					Text = v112,
					RichText = true,
					TextWrapped = true
				}),
				StepsIndent = Roact.createElement(View, {
					tag = "col gap-xxsmall size-full-0 auto-y",
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					padding = {
						left = UDim.new(0, 18)
					}
				}, {
					Step1 = Roact.createElement(FoundationText, {
						tag = "size-full-0 auto-xy text-body-medium text-wrap text-align-x-left",
						LayoutOrder = 1,
						Text = p16.refreshStep1,
						TextWrapped = true
					}),
					Step2 = Roact.createElement(FoundationText, {
						tag = "size-full-0 auto-xy text-body-medium text-wrap text-align-x-left",
						LayoutOrder = 2,
						Text = p16.refreshStep2,
						TextWrapped = true
					}),
					Step3 = Roact.createElement(FoundationText, {
						tag = "size-full-0 auto-xy text-body-medium text-wrap text-align-x-left",
						LayoutOrder = 3,
						Text = p16.refreshStep3,
						TextWrapped = true
					})
				})
			}) or nil,
			InputRow = Roact.createElement(View, {
				tag = "row items-stretch gap-small size-full-0 auto-y",
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				padding = {
					bottom = UDim.new(0, Space_150)
				}
			}, {
				InputWrap = Roact.createElement(View, {
					tag = "grow auto-y",
					LayoutOrder = 1,
					BackgroundTransparency = 1
				}, {
					CodeField = Roact.createElement(TextInput, {
						LayoutOrder = 1,
						label = "",
						text = p12.inputText,
						onChanged = p12.onRefreshCodeChanged,
						placeholder = v113,
						width = UDim.new(1, 0),
						hasError = not v97,
						size = InputSize.Medium,
						onFocusGained = p12.onFocus,
						onFocusLost = function() --[[ onFocusLost ]] -- line: 418
							-- upvalues: p12 (copy)
							p12:setState({
								isFocused = false
							})
						end,
						onReturnPressed = function() --[[ onReturnPressed ]] -- line: 423
							-- upvalues: p12 (copy)
							if #p12.state.inputCode == 6 then
								p12.confirmButtonPressed()
							end
						end
					})
				}),
				ContinueButtonWrap = Roact.createElement(View, {
					tag = "col",
					LayoutOrder = 2,
					Size = UDim2.new(0, v107, 0, Size_1000),
					BackgroundTransparency = 1
				}, {
					ContinueButton = Roact.createElement(Button, {
						buttonType = ButtonType.PrimarySystem,
						size = UDim2.new(1, 0, 1, 0),
						text = refreshContinue,
						isDisabled = p12.state.disableSubmissionForBadCode and #inputCode < 6 or inputCode == "",
						isLoading = isConfirming,
						onActivated = p12.confirmButtonPressed,
						[Roact.Ref] = p12.props.continueButtonRef
					})
				})
			}),
			InputError = not v97 and Roact.createElement(View, {
				tag = "col size-full-0 auto-y",
				LayoutOrder = 4,
				BackgroundTransparency = 1,
				padding = {
					bottom = UDim.new(0, Space_150)
				}
			}, {
				ErrorText = Roact.createElement(FoundationText, {
					tag = "size-full-0 auto-xy text-body-small text-wrap text-align-x-left",
					LayoutOrder = 1,
					Text = p14.inputError,
					TextWrapped = true,
					textStyle = t1
				})
			}) or nil,
			SecurityFooter = Roact.createElement(FoundationText, {
				tag = "size-full-0 auto-xy text-body-small text-wrap text-align-x-left",
				LayoutOrder = 6,
				Text = p16.refreshSecurityFooter,
				TextWrapped = true,
				textStyle = t2
			})
		})
	end)
end
function v42.render(p17) -- line: 475
	-- upvalues: withStyle (copy), withLocalization (copy), GetFFlagEnableCrossDeviceEnterCodeRefresh (copy), Roact (copy), CrossDeviceTabletLayout (copy), CrossDevicePhoneLayout (copy), GetFFlagEnableAuthsecImageUpdate (copy), FoundationImage (copy), ImageSetLabel (copy), v41 (copy), FitChildren (copy), FitTextLabel (copy), TextInputBoxWithBorder (copy), AuthStatefulRoundCornerBorder (copy), Button (copy), ButtonType (copy), Text (copy)
	local isWideView = p17.props.isWideView
	local inputCode = p17.state.inputCode
	local v65 = p17.state.inputErrorKey == ""
	local isConfirming = p17.state.isConfirming
	local isFocused = p17.state.isFocused

	return withStyle(function(p18) -- line: 483
		-- upvalues: withLocalization (copy), v65 (copy), p17 (copy), isWideView (copy), GetFFlagEnableCrossDeviceEnterCodeRefresh (copy), Roact (copy), CrossDeviceTabletLayout (copy), CrossDevicePhoneLayout (copy), GetFFlagEnableAuthsecImageUpdate (copy), FoundationImage (copy), ImageSetLabel (copy), v41 (copy), FitChildren (copy), FitTextLabel (copy), TextInputBoxWithBorder (copy), AuthStatefulRoundCornerBorder (copy), isFocused (copy), Button (copy), ButtonType (copy), isConfirming (copy), inputCode (copy), Text (copy)
		return withLocalization({
			tabletHeader = "Authentication.CrossDevice.Heading.LoginAnotherDevice",
			warningHeader = "Authentication.CrossDevice.Heading.LoginWarning",
			warning1 = "Authentication.CrossDevice.Label.Warning1",
			warning2 = "Authentication.CrossDevice.Label.Warning2",
			placeholderText = "Authentication.CrossDevice.Label.EnterOtherDeviceCode",
			enter = "Authentication.CrossDevice.Action.Enter",
			inputError = not v65 and p17.state.inputErrorKey or nil
		})(function(p19) -- line: 492
			-- upvalues: p17 (copy), isWideView (copy), p18 (copy), GetFFlagEnableCrossDeviceEnterCodeRefresh (copy), Roact (copy), CrossDeviceTabletLayout (copy), CrossDevicePhoneLayout (copy), GetFFlagEnableAuthsecImageUpdate (copy), FoundationImage (copy), ImageSetLabel (copy), v41 (copy), FitChildren (copy), FitTextLabel (copy), TextInputBoxWithBorder (copy), v65 (copy), AuthStatefulRoundCornerBorder (copy), isFocused (copy), Button (copy), ButtonType (copy), isConfirming (copy), inputCode (copy), Text (copy)
			local designTokens = p17.props.designTokens
			local v129 = isWideView and p17.props.tokens.Size.Size_2000 * 2 or p17.props.tokens.Size.Size_2000 * 4
			local v130 = isWideView and p17.props.tokens.Size.Size_2200 or p17.props.tokens.Size.Size_2200 * 2
			local v131 = not isWideView and p17.props.tokens.Size.Size_350 or 0
			local uDim2 = UDim2.fromOffset(designTokens.LuaApps.CrossDeviceLogin.iconSize, designTokens.LuaApps.CrossDeviceLogin.iconSize)
			local headerFontFont = designTokens.LuaApps.CrossDeviceLogin.headerFont.Font
			local FontSize = designTokens.LuaApps.CrossDeviceLogin.headerFont.FontSize
			local headerTextColorColor3 = designTokens.LuaApps.CrossDeviceLogin.headerTextColor.Color3
			local headerPadding = designTokens.LuaApps.CrossDeviceLogin.headerPadding
			local bodyFontFont = designTokens.LuaApps.CrossDeviceLogin.bodyFont.Font
			local FontSize2 = designTokens.LuaApps.CrossDeviceLogin.bodyFont.FontSize
			local bodyTextColorColor3 = designTokens.LuaApps.CrossDeviceLogin.bodyTextColor.Color3
			local headerTextColorTransparency = designTokens.LuaApps.CrossDeviceLogin.headerTextColor.Transparency
			local textAlertFontFont = designTokens.LuaApps.CrossDeviceLogin.textAlertFont.Font
			local FontSize3 = designTokens.LuaApps.CrossDeviceLogin.textAlertFont.FontSize
			local textAlertColorColor3 = designTokens.LuaApps.CrossDeviceLogin.textAlertColor.Color3
			local BaseSize = p18.Font.BaseSize
			local v145 = p17.state.placeholderTextOverride ~= "" and p17.state.placeholderTextOverride or p19.placeholderText

			if GetFFlagEnableCrossDeviceEnterCodeRefresh() then
				return p17:renderEnterCodeRefresh(p18, p19, isWideView)
			end

			return Roact.createElement(isWideView and CrossDeviceTabletLayout or CrossDevicePhoneLayout, {
				TabletHeaderText = p19.tabletHeader,
				Style = p18,
				HighKeyboardMode = p17.props.highKeyboardMode,
				Icon = GetFFlagEnableAuthsecImageUpdate() and Roact.createElement("Frame", {
					LayoutOrder = 1,
					Size = isWideView and uDim2 or UDim2.new(0, v129, 0, v130 - v131),
					BackgroundTransparency = 1
				}, {
					Image = Roact.createElement(FoundationImage, {
						Image = p17.getVerifyCodeImage(p17.props.tokens.Config.ColorMode.Name),
						ScaleType = Enum.ScaleType.Fit,
						Size = UDim2.new(0, v129, 0, v130),
						Position = UDim2.new(0.5, 0, 0.5, -v131 / 2),
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				}) or Roact.createElement(ImageSetLabel, {
					Size = uDim2,
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					ScaleType = Enum.ScaleType.Fit,
					Image = v41,
					ImageColor3 = p18.Theme.UIEmphasis.Color,
					ImageTransparency = 0
				}),
				WarningText = Roact.createElement(FitChildren.FitFrame, {
					LayoutOrder = 2,
					Size = UDim2.new(1, -20, 0, 0),
					fitAxis = FitChildren.FitAxis.Height,
					BackgroundTransparency = 1
				}, {
					Align = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = UDim.new(0, 6),
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					TopWarning = Roact.createElement(FitTextLabel, {
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p19.warningHeader,
						TextWrapped = true,
						Font = headerFontFont,
						TextSize = FontSize,
						TextColor3 = headerTextColorColor3,
						TextTransparency = headerTextColorTransparency,
						TextXAlignment = isWideView and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
						fitAxis = FitChildren.FitAxis.Height,
						BackgroundTransparency = 1
					}),
					Padding = Roact.createElement("Frame", {
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, headerPadding),
						BackgroundTransparency = 1
					}),
					BulletPoint1 = Roact.createElement(FitTextLabel, {
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p19.warning1,
						TextWrapped = true,
						Font = bodyFontFont,
						TextSize = FontSize2,
						TextColor3 = bodyTextColorColor3,
						TextTransparency = headerTextColorTransparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						fitAxis = FitChildren.FitAxis.Height,
						BackgroundTransparency = 1
					}),
					BulletPoint2 = Roact.createElement(FitTextLabel, {
						LayoutOrder = 4,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p19.warning2,
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
				InputBox = Roact.createElement(TextInputBoxWithBorder, {
					layoutOrder = 3,
					placeholderText = v145,
					borderState = not v65 and AuthStatefulRoundCornerBorder.BorderState.Error or (isFocused and AuthStatefulRoundCornerBorder.BorderState.Focused or AuthStatefulRoundCornerBorder.BorderState.Default),
					text = p17.inputText,
					onFocused = p17.onFocus,
					onFocusLost = p17.onFocusLost,
					onChangeTextCallback = p17.onTextChanged
				}),
				InputWarning = not v65 and Roact.createElement(FitTextLabel, {
					LayoutOrder = 4,
					Size = UDim2.new(1, -6, 0, FontSize3),
					Position = UDim2.new(0, 3, 1, 3),
					BackgroundTransparency = 1,
					Font = textAlertFontFont,
					TextSize = FontSize3,
					TextColor3 = textAlertColorColor3,
					TextTransparency = headerTextColorTransparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					Text = p19.inputError,
					TextWrapped = true,
					fitAxis = FitChildren.FitAxis.Height
				}),
				ConfirmCodeButton = Roact.createElement(Button, {
					buttonType = ButtonType.PrimarySystem,
					size = UDim2.new(1, 0, 1, 0),
					text = p19.enter,
					[Roact.Ref] = p17.props.continueButtonRef,
					onActivated = p17.confirmButtonPressed,
					isLoading = isConfirming,
					isDisabled = p17.state.disableSubmissionForBadCode and #inputCode < 6 or inputCode == ""
				}),
				ConfirmCodeButtonWidth = Text.GetTextWidth(p19.enter, bodyFontFont, BaseSize) + 40
			})
		end)
	end)
end

local RoactAppExperiment = require(CorePackages.Packages.RoactAppExperiment)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local v45 = RoactAppExperiment.connectUserLayer({
	AppUserLayers.ExposureLayer,
	AppUserLayers.AccessLayer
}, function(_, _) -- line: 655
	return {}
end)(v42)
local v46 = RoactServices.connect({
	networking = RoactNetworking,
	authAnalytics = RoactAnalyticsAuthEvents
})(v45)
local v47 = RoactRodux.connect(function(p22, _) -- line: 664
	return {
		screenSize = p22.ScreenSize
	}
end, function(p24) -- line: 668
	-- upvalues: CrossDeviceLogin (copy)
	return {
		validateCode = function(p25, p26) --[[ validateCode ]] -- line: 670
			-- upvalues: p24 (copy), CrossDeviceLogin (copy)
			return p24(CrossDeviceLogin.EnterCode(p25, p26))
		end
	}
end)(v46)

return function(p27) -- line: 677
	-- upvalues: useDesignTokens (copy), useTokens (copy), React (copy), v47 (copy), Cryo (copy)
	local v74 = useDesignTokens()
	local v75 = useTokens()

	return React.createElement(v47, Cryo.Dictionary.join(p27, {
		designTokens = v74,
		tokens = v75
	}))
end
