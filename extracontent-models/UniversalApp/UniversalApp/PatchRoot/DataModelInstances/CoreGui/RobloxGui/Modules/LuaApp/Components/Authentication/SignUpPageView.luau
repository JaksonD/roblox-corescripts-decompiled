local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local React = require(CorePackages.Packages.React)
local ReactFocusNavigation = require(CorePackages.Packages.ReactFocusNavigation)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local useUiModeInfo = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local UIBlox = require(CorePackages.Packages.UIBlox)
local useStyle = UIBlox.Core.Style.useStyle
local Images = UIBlox.App.ImageSet.Images
local ImageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local GetImageData = require(CorePackages.Workspace.Packages.RobloxAppAssets).GetImageData
local FitChildren = require(Modules.LuaApp.FitChildren)
local FitTextLabel = require(Modules.LuaApp.Components.FitTextLabel)
local useTextSizeOffset = require(CorePackages.Packages.Foundation).Hooks.useTextSizeOffset
local useLocalization = require(Modules.LuaApp.Hooks.useLocalization)
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local useDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local useAnimatedScrollToSelection = require(CorePackages.Workspace.Packages.RobloxAppHooks).useAnimatedScrollToSelection
local AuthCommon = require(CorePackages.Workspace.Packages.AuthCommon)
local UsernameValidationContext = require(Modules.LuaApp.Enum.UsernameValidationContext)

require(Modules.LuaApp.Components.Authentication.Enum.InputValidity)

local AuthBirthdayBar = require(Modules.LuaApp.Components.Authentication.AuthBirthdayBar)
local GenderDropdownSelector = require(Modules.LuaApp.Components.Authentication.GenderDropdownSelector)
local BirthdateDropdownSelector = require(Modules.LuaApp.Components.Authentication.BirthdateDropdownSelector)
local CollapsingTextInputValidator = require(Modules.LuaApp.Components.Authentication.CollapsingTextInputValidator)
local SuggestionsFrame = require(Modules.LuaApp.Components.Authentication.SuggestionsFrame)
local UsernameSuggestor = require(Modules.LuaApp.Thunks.Authentication.UsernameSuggestor)
local SignUpGenderSelector = require(Modules.LuaApp.Components.Authentication.SignUpGenderSelector)
local TitleAndParagraph = require(Modules.LuaApp.Components.Authentication.TitleAndParagraph)
local DisclaimerLinks = require(Modules.LuaApp.Components.Authentication.DisclaimerLinks)
local ContactInfoField = require(Modules.LuaApp.Components.Authentication.ContactInfoField)
local BackgroundFill = AuthCommon.Components.BackgroundFill
local FullscreenPageWithSafeArea = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)
local useAppPolicy = require(Modules.LuaApp.Hooks.useAppPolicy)
local useSignUpPageNavigationBindings = AuthCommon.Hooks.useSignUpPageNavigationBindings
local DateHelper = require(CorePackages.Workspace.Packages.Time).DateHelper
local GetFFlagEnableTextFieldContentType = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableTextFieldContentType
local GetFFlagRefactorAuthPageForTenFoot = require(Modules.LuaApp.Flags.GetFFlagRefactorAuthPageForTenFoot)
local GetFFlagLuaAppEnable10ftSignUpView = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnable10ftSignUpView
local GetFIntLuaLoginGenderSelector = require(Modules.LuaApp.Flags.GetFIntLuaLoginGenderSelector)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local uDim2 = UDim2.new(0, 36, 0, 36)
local vector2 = Vector2.new(540, 1080)
local vector2_2 = Vector2.new(850, 1080)
local v48 = game:DefineFastFlag("EnableUsernameNextSelectionDown", false)
local v49 = game:DefineFastFlag("AuthRefactorConsoleDisclaimerText", false)

return function(t1: {[any]: any}) -- line: 169
	-- upvalues: useStyle (copy), useUiModeInfo (copy), GetFFlagRefactorAuthPageForTenFoot (copy), UiMode (copy), GetFFlagLuaAppEnable10ftSignUpView (copy), useDesignTokens (copy), useAppPolicy (copy), useLocalization (copy), useSelector (copy), FormFactor (copy), React (copy), ReactFocusNavigation (copy), useSignUpPageNavigationBindings (copy), BackgroundFill (copy), GetFFlagEnableTextFieldContentType (copy), v49 (copy), useTextSizeOffset (copy), useAnimatedScrollToSelection (copy), FullscreenPageWithSafeArea (copy), FFlagEnableLeftNavOnConsole (copy), ImageSetLabel (copy), GetImageData (copy), vector2_2 (copy), vector2 (copy), ImageSetButton (copy), uDim2 (copy), Images (copy), FitTextLabel (copy), FitChildren (copy), AuthBirthdayBar (copy), BirthdateDropdownSelector (copy), GenderDropdownSelector (copy), ContactInfoField (copy), DateHelper (copy), CollapsingTextInputValidator (copy), UsernameValidationContext (copy), v48 (copy), SuggestionsFrame (copy), UsernameSuggestor (copy), GetFIntLuaLoginGenderSelector (copy), SignUpGenderSelector (copy), Button (copy), ButtonType (copy), TitleAndParagraph (copy), DisclaimerLinks (copy)
	local v51 = useStyle()
	local v52 = useUiModeInfo()
	local v53 = GetFFlagRefactorAuthPageForTenFoot() and v52.uiMode == UiMode.TenFoot or v52.uiMode == UiMode.VR
	local v54 = GetFFlagLuaAppEnable10ftSignUpView() or v52.uiMode == UiMode.VR
	local v55 = if not v54 then nil else useDesignTokens()
	local v56 = if not v54 or not v55 then nil else v55.LuaApps.SignUpView
	local v57 = useAppPolicy(function(p1) -- line: 177
		return p1.getPlatformAccountName()
	end)
	local v58 = useLocalization({
		signUpText = "Authentication.SignUp.Action.CreateAccount",
		usernamePlaceholder = "Authentication.SignUp.Message.Username.NoRealNameUse",
		passwordPlaceholder = "Authentication.SignUp.Label.PasswordPlaceholder",
		unknownError = "Feature.Reauthentication.Message.Error.Default"
	})
	local v59 = useSelector(function(p2) -- line: 188
		return p2.FormFactor
	end) == FormFactor.WIDE
	local v60 = React.useRef(nil)
	local v61 = ReactFocusNavigation.useFocusedGuiObject()
	local v62 = ReactFocusNavigation.useFocusGuiObject()
	local v63 = useSignUpPageNavigationBindings()
	local v64, v65

	if not v53 then
		v64, v65 = ReactFocusNavigation.useDefaultFocusBehavior(v63)
	else
		v64, v65 = ReactFocusNavigation.useDefaultFocusBehavior()
	end

	local v66, v67 = React.useState(false)
	local v68 = React.useCallback(function() -- line: 205
		-- upvalues: v67 (copy)
		v67(true)
	end)
	local v69 = React.useCallback(function() -- line: 208
		-- upvalues: v67 (copy)
		v67(false)
	end)
	local v70 = React.useCallback(function() -- line: 211
		-- upvalues: React (copy), v59 (copy), v51 (copy), BackgroundFill (copy)
		return React.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = not v59 and 0 or 1,
			BackgroundColor3 = v51.Theme.BackgroundUIDefault.Color
		}, {
			Background = v59 and React.createElement(BackgroundFill, {
				Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg"
			}),
			Mask = v59 and React.createElement("ImageLabel", {
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = Color3.new(0, 0, 0),
				BackgroundTransparency = 0.5
			})
		})
	end, {
		v59,
		v51
	})
	local v71 = t1.useUsernameSuggestions()
	local birthday = t1.birthday
	local n1 = 0
	local n2 = 0
	local v75 = t1.onScreenKeyboardHeight > 0
	local v76 = t1.useVerifiedSignup()
	local v77 = (not v59 or not v76) and 0 or 12
	local v78 = true
	local v79 = true
	local v80 = not t1.validUsernameEntered()
	local s1 = "Authentication.SignUp.Label.ErrorsWithUsername"
	local s2 = "Authentication.SignUp.Label.ErrorsWithPassword"

	if not birthday then
		s1 = "Authentication.SignUp.Response.BirthdayMustBeSetFirst"
		s2 = s1
		v80 = true
		v78 = false
	elseif v80 then
		s2 = "Authentication.SignUp.Response.UsernameMustBeSetFirst"
		v79 = false
	end

	if v59 then
		if v75 then
			n1 = t1.onScreenKeyboardHeight + 10
		else
			n1 = 48
			n2 = 24
		end
	end

	local v83 = GetFFlagEnableTextFieldContentType() and Enum.TextInputType.Username or Enum.TextInputType.NoSuggestions
	local n3 = 36
	local v85 = v51.Font.BaseSize * v51.Font.Header1.RelativeSize
	local v86 = v51.Font.BaseSize * v51.Font.CaptionBody.RelativeSize
	local n4 = 5
	local n5 = 1
	local t4 = nil
	local t2 = { "Authentication.SignUp.Description.VerificationPage" }
	local t3 = {{}}

	if v53 and v57 then
		if v49 then
			t2 = {{
				"Authentication.SignUp.Description.VerificationLinkingText",
				platform = v57
			}}
		else
			t2 = { "Authentication.SignUp.Description.VerificationLinkingText" }
			t3 = {{
				platform = v57
			}}
		end
	end

	if v54 and v56 then
		n2 = v56.marginTop
		v86 = v56.textCaptionHeaderSize
		v85 = v56.textHeaderSize
		n3 = v56.buttonHeight
		n4 = v56.contentPadding
		n5 = v56.headerPadding
		t4 = {
			Size = UDim2.fromScale(1, 1),
			TextSize = v56.buttonTextSize
		}
	end

	React.useEffect(function() -- line: 315
		-- upvalues: v61 (copy), v60 (copy), v62 (copy)
		if v61 and v60.current then
			v62(v60.current)
		end
	end, {})

	local v92 = useTextSizeOffset()
	local v93, v94 = useAnimatedScrollToSelection(Enum.ScrollingDirection.Y, n1 + 49 + v92)
	local t5 = {
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(1, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasPosition = v93,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarImageTransparency = 1,
		Position = UDim2.new(0.5, 0, 0, 49),
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.new(1, 0, 1, -(49 + v77 + n2 + v92)),
		[React.Change.CanvasSize] = t1.onSignUpContentFrameCanvasSizeChange,
		[React.Event.SelectionChanged] = v94,
		ref = t1.signUpContentFrameRef,
		LayoutOrder = 3,
		Selectable = false,
		BackgroundTransparency = 1
	}

	return React.createElement(FullscreenPageWithSafeArea, {
		BackgroundColor3 = if not FFlagEnableLeftNavOnConsole or v52.uiMode ~= UiMode.TenFoot then nil else v51.Theme.BackgroundDefault.Color,
		BackgroundTransparency = (not FFlagEnableLeftNavOnConsole or v52.uiMode ~= UiMode.TenFoot) and 1 or v51.Theme.BackgroundDefault.Transparency,
		includeStatusBar = true,
		buttonRef = v65,
		renderFullscreenBackground = if not v53 then v70 else nil
	}, {
		UserInputSink = t1.isSignUpInProgress and React.createElement("ImageButton", {
			ZIndex = 2,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Image = ""
		}),
		Container = React.createElement(ImageSetLabel, {
			Size = UDim2.new(1, 0, 1, -n1),
			Position = UDim2.new(0.5, 0, 0, n2),
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundTransparency = 1,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(9, 9, 9, 9),
			Image = GetImageData("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
			ImageColor3 = v51.Theme.BackgroundUIDefault.Color,
			ImageTransparency = not v53 and 0 or 1,
			ClipsDescendants = true
		}, {
			ContainerListLayout = if not v54 then nil else React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, n5)
			}),
			SizeConstraint = React.createElement("UISizeConstraint", {
				MaxSize = if not v53 then vector2 else vector2_2
			}),
			HeaderFrame = React.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 48),
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = if not v54 then nil else Enum.AutomaticSize.Y
			}, {
				BackButton = if v52.uiMode ~= UiMode.VR and v54 then nil else React.createElement(ImageSetButton, {
					Size = uDim2,
					AutoButtonColor = false,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 12, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					ScaleType = Enum.ScaleType.Fit,
					Image = Images["icons/navigation/close"],
					ImageColor3 = v51.Theme.UIEmphasis.Color,
					ImageTransparency = 0,
					[React.Event.Activated] = t1.navigateBack,
					ref = v60
				}),
				Title = v58.signUpText and React.createElement(FitTextLabel, {
					Position = UDim2.new(0, 0, 0.5, 0),
					Size = UDim2.new(1, 0, 0, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					fitAxis = FitChildren.FitAxis.Height,
					BackgroundTransparency = 1,
					Text = v58.signUpText or "",
					TextWrapped = true,
					Font = v51.Font.CaptionHeader.Font,
					TextSize = v85,
					TextColor3 = v51.Theme.TextEmphasis.Color,
					TextTransparency = v51.Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Center
				})
			}),
			Divider = if v54 then nil else React.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0.5, 0, 0, 48),
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundTransparency = 0,
				BackgroundColor3 = v51.Theme.UIEmphasis.Color,
				LayoutOrder = 2
			}),
			SignUpContentFrame = React.createElement("ScrollingFrame", t5, {
				ContentPadding = React.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24),
					PaddingTop = UDim.new(0, not v59 and 48 or 25)
				}),
				ListLayout = React.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, n4)
				}),
				BirthdayBar = if not v53 then React.createElement(AuthBirthdayBar, {
					layoutOrder = 1,
					onBirthdaySelected = t1.onBirthdaySelected,
					onBirthdayFocused = t1.onBirthdayFocused,
					autoFocusOnMount = v76,
					buttonRef = v64
				}) else nil,
				BirthdayGenderPicker = if not v53 then nil else React.createElement("Frame", {
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 140),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ZIndex = 2,
					ref = v64
				}, {
					BirthdayPicker = React.createElement(BirthdateDropdownSelector, {
						onBirthdaySelected = t1.onBirthdaySelected,
						alignment = Enum.HorizontalAlignment.Left,
						layoutOrder = 1
					}),
					GenderSelector = React.createElement(GenderDropdownSelector, {
						onGenderChanged = t1.onGenderChanged,
						alignment = Enum.HorizontalAlignment.Right,
						layoutOrder = 2
					})
				}),
				ContactInfoField = v76 and React.createElement(ContactInfoField, {
					layoutOrder = 2,
					Under13 = birthday and DateHelper:isRecentOrFutureDate(birthday.Month, birthday.Day, birthday.Year + 13),
					SetContactMethod = t1.SetContactMethod,
					SetPhoneNumber = t1.SetPhoneNumber,
					SetEmail = t1.SetEmail,
					contactMethod = t1.contactMethod,
					phoneCountryCodeSelectorCallback = t1.phoneCountryCodeSelectorCallback
				}),
				BackgroundPanel = v76 and React.createElement("Frame", {
					Size = UDim2.new(0, 0, 0, 6),
					LayoutOrder = 3,
					BackgroundTransparency = 1
				}, {
					LightPanel = React.createElement("Frame", {
						BorderSizePixel = 0,
						Size = UDim2.new(0, 100000, 0, 100000),
						Position = UDim2.new(0, 0, 1, 0),
						BackgroundColor3 = v51.Theme.UIDefault.Color,
						AnchorPoint = Vector2.new(0.5, 0)
					})
				}),
				UsernameValidator = React.createElement(CollapsingTextInputValidator, {
					layoutOrder = 4,
					titleTextKey = "Authentication.Login.Label.Username",
					summaryErrorTextKey = s1,
					prerequisiteMet = not not birthday,
					textInputType = v83,
					onInputTextChanged = t1.onUsernameTextChanged,
					onInputTextValidated = v71 and t1.onUsernameTextValidated or t1.onUsernameTextChanged,
					validator = t1.UsernameValidator,
					placeholderText = v58.usernamePlaceholder,
					validatorAdditionalProps = {
						birthday = birthday and birthday:FormatForEndpoint() or "",
						context = UsernameValidationContext.Signup
					},
					textBoxFocusedCallback = t1.onUsernameTextBoxFocused,
					textBoxFocusLostCallback = t1.onTextBoxFocusLost,
					focusedTextBoxPositionChangedCallback = t1.onFocusedTextBoxPositionChanged,
					returnKeyType = Enum.ReturnKeyType.Next,
					onReturnPressedFromOnScreenKeyboard = t1.onUsernameTextChangeCompletedFromKeyboard,
					onAnimationStateChangeCallback = t1.onAnimationStateChangeCallback,
					textBoxRef = t1.usernameTextFieldRef,
					pillClicked = v66,
					updatePillClicked = v68,
					resetPillClicked = v69,
					issueCondition = t1.issueCondition,
					updateIssueCondition = t1.updateIssueCondition,
					loadingSuggestions = t1.loadingSuggestions,
					tokens = v56,
					showDetailedError = v78,
					NextSelectionDown = if not v48 or v71 then nil else t1.passwordTextFieldRef
				}),
				SuggestionsFrame = v71 and React.createElement(SuggestionsFrame, {
					layoutOrder = 4,
					textBoxRef = t1.usernameTextFieldRef,
					usernameValid = t1.usernameValid,
					birthday = birthday and birthday:FormatForEndpoint() or "",
					suggest = UsernameSuggestor,
					context = UsernameValidationContext.Signup,
					pillClicked = v66,
					updatePillClicked = v68,
					resetPillClicked = v69,
					issueCondition = t1.issueCondition,
					usernameSuggestionClicked = t1.usernameSuggestionClicked,
					usernameSuggestionsShown = t1.usernameSuggestionsShown,
					shouldSuggest = t1.shouldSuggest,
					updateSuggestionControlState = t1.updateSuggestionControlState,
					useRefreshButton = t1.useRefreshButton,
					logRefreshButtonClicked = t1.logRefreshButtonClicked,
					loadSuggestions = t1.loadSuggestions,
					finishSuggestions = t1.finishSuggestions,
					loadingSuggestions = t1.loadingSuggestions
				}),
				PasswordValidator = React.createElement(CollapsingTextInputValidator, {
					disabled = t1.birthdayFocused,
					layoutOrder = 5,
					titleTextKey = "CommonUI.Messages.Label.Password",
					summaryErrorTextKey = s2,
					prerequisiteMet = not v80,
					textInputType = Enum.TextInputType.Password,
					onInputTextChanged = t1.onPasswordTextChanged,
					onInputTextValidated = t1.onPasswordTextChanged,
					validator = t1.PasswordValidator,
					placeholderText = v58.passwordPlaceholder,
					validatorAdditionalProps = {
						username = t1.username
					},
					returnKeyType = Enum.ReturnKeyType.Next,
					textBoxFocusedCallback = t1.onPasswordTextBoxFocused,
					textBoxFocusLostCallback = t1.onTextBoxFocusLost,
					focusedTextBoxPositionChangedCallback = t1.onFocusedTextBoxPositionChanged,
					onReturnPressedFromOnScreenKeyboard = t1.onPasswordTextChangeCompletedFromKeyboard,
					onAnimationStateChangeCallback = t1.onAnimationStateChangeCallback,
					textBoxRef = t1.passwordTextFieldRef,
					centralOverlayBlocksInput = v76,
					captureFocusOnTapStart = not t1.isCountryCodeSearchVisible,
					tokens = v56,
					showDetailedError = v79,
					IsKeyboardOverlayUsed = v52.uiMode ~= UiMode.VR
				}),
				GenderSelector = if not v53 then GetFIntLuaLoginGenderSelector() ~= 2 and React.createElement(SignUpGenderSelector, {
					layoutOrder = 7,
					onGenderChanged = t1.onGenderChanged
				}) else nil,
				Spacing = if v53 then nil else React.createElement("Frame", {
					LayoutOrder = 8,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 38)
				}),
				ErrorLabel = if not t1.signUpError then nil else React.createElement(FitTextLabel, {
					LayoutOrder = 9,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildren.FitAxis.Height,
					BackgroundTransparency = 1,
					Text = v58.unknownError,
					TextWrapped = true,
					Font = v51.Font.CaptionBody.Font,
					TextSize = v86,
					TextColor3 = v51.Theme.Alert.Color,
					TextTransparency = v51.Theme.TextDefault.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				SignUpPageButton = React.createElement(Button, {
					buttonType = ButtonType.PrimaryContextual,
					layoutOrder = 10,
					size = UDim2.new(1, 0, 0, n3),
					text = v58.signUpText,
					isDisabled = not t1.isSignUpButtonEnabled,
					isLoading = t1.isSignUpInProgress,
					onActivated = t1.onSignUpClick,
					buttonTextOverride = t4
				}),
				DisclaimerText = React.createElement(TitleAndParagraph, {
					layoutOrder = 11,
					textXAlignment = Enum.TextXAlignment.Center,
					paragraphTextKeys = t2,
					paragraphTextArgs = t3
				}),
				DisclaimerLinks = React.createElement(DisclaimerLinks, {
					isDualLayout = v54,
					fillDirection = Enum.FillDirection.Horizontal,
					LayoutOrder = 12
				}),
				ScrollPadding = v75 and React.createElement("Frame", {
					LayoutOrder = 13,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, t1.onScreenKeyboardHeight * 2)
				})
			}),
			Footer = v76 and (v59 and React.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 12),
				Position = UDim2.new(0, 0, 1, -12),
				BackgroundTransparency = 1,
				ClipsDescendants = true
			}, {
				Rounding = React.createElement(ImageSetLabel, {
					Size = UDim2.new(1, 0, 2, 0),
					Position = UDim2.new(0, 0, -1, 0),
					BackgroundTransparency = 1,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(9, 9, 9, 9),
					Image = GetImageData("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
					ImageColor3 = v51.Theme.UIDefault.Color
				})
			}))
		})
	})
end
