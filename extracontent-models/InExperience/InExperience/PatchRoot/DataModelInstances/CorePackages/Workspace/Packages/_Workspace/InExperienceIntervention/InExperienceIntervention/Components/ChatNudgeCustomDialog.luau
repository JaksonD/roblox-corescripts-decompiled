local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Players = game:GetService("Players")
local InExperienceInterventionParent = InExperienceIntervention.Parent
local Constants = require(InExperienceInterventionParent.InterventionShared).Utils.Constants
local React = require(InExperienceInterventionParent.React)
local InterventionContestFeedbackFooter = require(InExperienceIntervention.Components.InterventionContestFeedbackFooter)
local UIBlox = require(InExperienceInterventionParent.UIBlox)
local Foundation = require(InExperienceInterventionParent.Foundation)
local PartialPageModal = UIBlox.App.Dialog.Modal.PartialPageModal
local FoundationText = Foundation.Text
local View = Foundation.View
local Button = Foundation.Button
local useTokens = Foundation.Hooks.useTokens
local useLocalization = require(InExperienceInterventionParent.Localization).Hooks.useLocalization
local useStyle = UIBlox.Core.Style.useStyle
local useLayerCollector = UIBlox.Core.Layout.LayerCollector.useLayerCollector
local LocalPlayer = Players.LocalPlayer
local InExperienceInterventionAnalytics = require(InExperienceIntervention.InExperienceInterventionAnalytics)
local ScrollView = Foundation.ScrollView
local ScrollBarVisibility = Foundation.Enums.ScrollBarVisibility
local ButtonVariant = Foundation.Enums.ButtonVariant
local FillBehavior = Foundation.Enums.FillBehavior
local useProperty = require(InExperienceInterventionParent.GuiObjectUtils).useProperty
local dependencyArray = require(InExperienceInterventionParent.RoactUtils).Hooks.dependencyArray
local ReactFocusNavigation = require(InExperienceInterventionParent.ReactFocusNavigation)
local FocusNavigationUtils = require(InExperienceInterventionParent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtils.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local v29 = ReactFocusNavigation.FocusNavigationService.new(ReactFocusNavigation.EngineInterface.CoreGui)
local FFlagRemoveDependencyArrayAntipattern = require(InExperienceInterventionParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern

function ChatNudgeCustomDialog(t1: {[any]: any}) -- line: 44
	-- upvalues: React (copy), InExperienceInterventionAnalytics (copy), useLocalization (copy), Constants (copy), useStyle (copy), useLayerCollector (copy), useTokens (copy), useProperty (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), LocalPlayer (copy), View (copy), FoundationText (copy), PartialPageModal (copy), ScrollView (copy), ScrollBarVisibility (copy), ReactFocusNavigation (copy), v29 (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy), InterventionContestFeedbackFooter (copy)
	local v32 = React.useRef(DateTime.now().UnixTimestampMillis)
	local v33 = React.useRef(nil)
	local v34, v35 = React.useState(0)

	React.useEffect(function() -- line: 48
		-- upvalues: InExperienceInterventionAnalytics (copy), v32 (copy), t1 (copy)
		InExperienceInterventionAnalytics.sendAnalyticsEvent(InExperienceInterventionAnalytics.Constants.EventTypes.ModalAppeared, InExperienceInterventionAnalytics.Constants.InterventionTypes.Nudge, v32.current, t1.eventId, t1.violatingChatLine, nil)
	end, { v32 })

	local v36 = useLocalization(Constants.localizationKeys)
	local v37 = useStyle()
	local v38 = useLayerCollector()
	local v39 = useTokens()
	local v40 = useProperty(v33, "AbsoluteSize")

	React.useEffect(function() -- line: 68
		-- upvalues: v40 (copy), v38 (copy), Constants (copy), v35 (copy)
		local v44 = not v40 and 0 or v40.Y
		local v45 = math.min(v38.absoluteSize.Y - Constants.UNIBAR_HEIGHT - Constants.DIALOG_HEADER_HEIGHT, v44)

		v35(v45)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v38.absoluteSize.Y, v40) else {
		v38.absoluteSize.Y,
		v40
	})

	local v41 = if not LocalPlayer then t1.violatingChatLine else `{ LocalPlayer.DisplayName }: { t1.violatingChatLine }`
	local v42 = React.useCallback(function() -- line: 83
		-- upvalues: InExperienceInterventionAnalytics (copy), v32 (copy), t1 (copy)
		InExperienceInterventionAnalytics.sendAnalyticsEvent(InExperienceInterventionAnalytics.Constants.EventTypes.CtaClicked, InExperienceInterventionAnalytics.Constants.InterventionTypes.Nudge, v32.current, t1.eventId, t1.violatingChatLine, nil)
		t1.onDismiss()
	end, { v32 })
	local v43 = if not t1.violatingChatLine then nil else React.createElement(View, {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = 1
	}, {
		Layout = React.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, Constants.STANDARD_PADDING / 2)
		}),
		ChatIncludesTextFrame = React.createElement(View, {
			Size = UDim2.new(1, 0, 0, 0),
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ChatIncludesText = React.createElement(FoundationText, {
				Text = v36.ChatIncludesText,
				fontStyle = v39.Typography.BodySmall,
				TextXAlignment = Enum.TextXAlignment.Left,
				AnchorPoint = Vector2.new(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY
			})
		}),
		ViolatingTextFrame = React.createElement(View, {
			Size = UDim2.new(1, 0, 0, Constants.VIOLATION_HEIGHT),
			LayoutOrder = 2,
			BackgroundTransparency = 0,
			BackgroundColor3 = v37.Theme.BackgroundUIDefault.Color,
			tag = "col gap-small align-x-center align-y-center padding-x-large radius-medium stroke-default"
		}, {
			ViolationText = React.createElement(FoundationText, {
				LayoutOrder = 2,
				Text = v41,
				textStyle = v37.Theme.TextMuted,
				fontStyle = v37.Font.Body,
				Size = UDim2.new(1, 0, 0, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				AutomaticSize = Enum.AutomaticSize.Y,
				TextWrapped = true,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		})
	})

	return React.createElement(PartialPageModal, {
		title = v36.ChatBreaksRulesText,
		screenSize = v38.absoluteSize
	}, {
		ScrollView = React.createElement(ScrollView, {
			Size = UDim2.new(1, 0, 0, v34),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 1, 0),
				scrollBarVisibility = ScrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			FocusNavigationCoreScriptsProvider = React.createElement(ReactFocusNavigation.FocusNavigationContext.Provider, {
				value = v29
			}, {
				FocusNavigationCoreScriptsWrapper = React.createElement(FocusRoot, {
					surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
					isIsolated = true,
					isAutoFocusRoot = true,
					frameProps = {
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}
				}, {
					InnerContent = React.createElement(View, {
						ref = v33,
						Size = UDim2.new(1, -Constants.SCROLL_BAR_WIDTH, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						tag = "col gap-large align-x-center align-y-center padding-x-small padding-top-large"
					}, {
						MiddleContent = v43,
						WarningText = React.createElement(FoundationText, {
							LayoutOrder = 3,
							Text = v36.TextChatMayBeSuspendedText,
							textStyle = v37.Theme.TextEmphasis,
							fontStyle = v37.Font.Body,
							Size = UDim2.new(1, 0, 0, 0),
							TextXAlignment = Enum.TextXAlignment.Center,
							TextYAlignment = Enum.TextYAlignment.Center,
							AutomaticSize = Enum.AutomaticSize.Y,
							TextWrapped = true
						}),
						UnderstandButtonFrame = React.createElement(View, {
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							LayoutOrder = 4
						}, {
							UnderstandButton = React.createElement(Button, {
								text = v36.IUnderstandText,
								variant = ButtonVariant.Standard,
								onActivated = v42,
								fillBehavior = FillBehavior.Fill,
								FillDirection = Enum.FillDirection.Horizontal
							})
						}),
						FeedbackFrame = React.createElement(View, {
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							LayoutOrder = 5
						}, {
							FeedbackFooter = React.createElement(InterventionContestFeedbackFooter, {
								onDismiss = t1.onDismiss,
								renderTimestamp = v32.current,
								interventionType = InExperienceInterventionAnalytics.Constants.InterventionTypes.Nudge,
								eventId = t1.eventId,
								violatingChatLine = t1.violatingChatLine,
								duration = nil
							})
						})
					})
				})
			})
		})
	})
end

return ChatNudgeCustomDialog
