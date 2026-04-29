local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local InExperienceInterventionParent = InExperienceIntervention.Parent
local React = require(InExperienceInterventionParent.React)
local InterventionContestFeedbackFooter = require(InExperienceIntervention.Components.InterventionContestFeedbackFooter)
local UIBlox = require(InExperienceInterventionParent.UIBlox)
local Foundation = require(InExperienceInterventionParent.Foundation)
local FoundationText = Foundation.Text
local PartialPageModal = UIBlox.App.Dialog.Modal.PartialPageModal
local useLayerCollector = UIBlox.Core.Layout.LayerCollector.useLayerCollector
local useLocalization = require(InExperienceInterventionParent.Localization).Hooks.useLocalization
local useStyle = UIBlox.Core.Style.useStyle
local Constants = require(InExperienceInterventionParent.InterventionShared).Utils.Constants
local InExperienceInterventionAnalytics = require(InExperienceIntervention.InExperienceInterventionAnalytics)
local View = Foundation.View
local Button = Foundation.Button
local ScrollView = Foundation.ScrollView
local ScrollBarVisibility = Foundation.Enums.ScrollBarVisibility
local ButtonVariant = Foundation.Enums.ButtonVariant
local FillBehavior = Foundation.Enums.FillBehavior
local useTokens = Foundation.Hooks.useTokens
local useProperty = require(InExperienceInterventionParent.GuiObjectUtils).useProperty
local dependencyArray = require(InExperienceInterventionParent.RoactUtils).Hooks.dependencyArray
local ReactFocusNavigation = require(InExperienceInterventionParent.ReactFocusNavigation)
local FocusNavigationUtils = require(InExperienceInterventionParent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtils.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local v27 = ReactFocusNavigation.FocusNavigationService.new(ReactFocusNavigation.EngineInterface.CoreGui)
local FFlagRemoveDependencyArrayAntipattern = require(InExperienceInterventionParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern

function ChatTimeoutCustomDialog(t1: {[any]: any}) -- line: 42
	-- upvalues: useLayerCollector (copy), React (copy), useTokens (copy), useStyle (copy), useLocalization (copy), Constants (copy), useProperty (copy), InExperienceInterventionAnalytics (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), PartialPageModal (copy), ScrollView (copy), ScrollBarVisibility (copy), ReactFocusNavigation (copy), v27 (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), View (copy), FoundationText (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy), InterventionContestFeedbackFooter (copy)
	local v30 = useLayerCollector()
	local v31 = React.useRef(DateTime.now().UnixTimestampMillis)
	local v32 = React.useRef(nil)
	local v33, v34 = React.useState(0)
	local v35 = useTokens()
	local v36 = useStyle()
	local v37 = useLocalization(Constants.localizationKeys)
	local v38 = useProperty(v32, "AbsoluteSize")
	local v39 = React.useCallback(function() -- line: 56
		-- upvalues: InExperienceInterventionAnalytics (copy), v31 (copy), t1 (copy)
		InExperienceInterventionAnalytics.sendAnalyticsEvent(InExperienceInterventionAnalytics.Constants.EventTypes.CtaClicked, InExperienceInterventionAnalytics.Constants.InterventionTypes.Timeout, v31.current, t1.eventId, t1.violatingChatLine, t1.duration)
		t1.onDismiss()
	end, { v31 })

	React.useEffect(function() -- line: 68
		-- upvalues: InExperienceInterventionAnalytics (copy), v31 (copy), t1 (copy)
		InExperienceInterventionAnalytics.sendAnalyticsEvent(InExperienceInterventionAnalytics.Constants.EventTypes.ModalAppeared, InExperienceInterventionAnalytics.Constants.InterventionTypes.Timeout, v31.current, t1.eventId, t1.violatingChatLine, t1.duration)
	end, { v31 })
	React.useEffect(function() -- line: 80
		-- upvalues: v38 (copy), v30 (copy), Constants (copy), v34 (copy)
		local v41 = not v38 and 0 or v38.Y
		local v42 = math.min(v30.absoluteSize.Y - Constants.UNIBAR_HEIGHT - Constants.DIALOG_HEADER_HEIGHT, v41)

		v34(v42)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v30.absoluteSize.Y, v38) else {
		v30.absoluteSize.Y,
		v38
	})

	local v40 = if not (t1.duration <= 60) then useLocalization({
		value = {
			Constants.localizationKeys.CannotSendText,
			number = math.ceil(t1.duration / 60)
		}
	}).value else v37.CannotSend1MinText

	return React.createElement(PartialPageModal, {
		title = v37.TextChatSuspensionText,
		screenSize = v30.absoluteSize
	}, {
		ScrollView = React.createElement(ScrollView, {
			Size = UDim2.new(1, 0, 0, v33),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 1, 0),
				scrollBarVisibility = ScrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			FocusNavigationCoreScriptsProvider = React.createElement(ReactFocusNavigation.FocusNavigationContext.Provider, {
				value = v27
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
						ref = v32,
						Size = UDim2.new(1, -Constants.SCROLL_BAR_WIDTH, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						tag = "col gap-large align-x-center align-y-center padding-x-small padding-top-large"
					}, {
						ChatDisabledText = React.createElement(FoundationText, {
							LayoutOrder = 1,
							Text = v40,
							textStyle = v36.Theme.TextEmphasis,
							fontStyle = v35.Typography.LabelLarge,
							Size = UDim2.new(1, 0, 0, 0),
							TextXAlignment = Enum.TextXAlignment.Center,
							TextYAlignment = Enum.TextYAlignment.Center,
							AutomaticSize = Enum.AutomaticSize.Y,
							TextWrapped = true
						}),
						WarningTextLabel = React.createElement(FoundationText, {
							LayoutOrder = 2,
							Text = v37.MayLoseAccessText,
							tag = "padding-small size-full-800 text-wrap",
							TextWrapped = true,
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						UnderstandButtonFrame = React.createElement(View, {
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							LayoutOrder = 3
						}, {
							UnderstandButton = React.createElement(Button, {
								text = v37.IUnderstandText,
								variant = ButtonVariant.Standard,
								onActivated = v39,
								fillBehavior = FillBehavior.Fill,
								FillDirection = Enum.FillDirection.Horizontal
							})
						}),
						FeedbackFrame = React.createElement(View, {
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							LayoutOrder = 4
						}, {
							FeedbackFooter = React.createElement(InterventionContestFeedbackFooter, {
								onDismiss = t1.onDismiss,
								renderTimestamp = v31.current,
								interventionType = InExperienceInterventionAnalytics.Constants.InterventionTypes.Timeout,
								eventId = t1.eventId,
								violatingChatLine = t1.violatingChatLine,
								duration = t1.duration
							})
						})
					})
				})
			})
		})
	})
end

return ChatTimeoutCustomDialog
