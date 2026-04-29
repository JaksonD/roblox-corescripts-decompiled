local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local CurrencyTransfersParent = CurrencyTransfers.Parent
local LocalizationService = game:GetService("LocalizationService")
local TransferLocalizationKeys = require(CurrencyTransfers.Localization.TransferLocalizationKeys)
local transferLocaleFormat = require(CurrencyTransfers.Localization.transferLocaleFormat)
local React = require(CurrencyTransfersParent.React)
local SharedFlags = require(CurrencyTransfersParent.SharedFlags)
local SignalsReact = require(CurrencyTransfersParent.SignalsReact)
local Foundation = require(CurrencyTransfersParent.Foundation)
local ButtonVariant = Foundation.Enums.ButtonVariant
local Sheet = Foundation.Sheet
local Button = Foundation.Button
local View = Foundation.View
local FoundationText = Foundation.Text
local FillBehavior = Foundation.Enums.FillBehavior
local useScaledValue = Foundation.Hooks.useScaledValue
local useLocalization = require(CurrencyTransfersParent.Localization).Hooks.useLocalization
local RobuxText = require(CurrencyTransfers.Components.Generic.RobuxText)
local TransferRobuxHeader = require(CurrencyTransfers.Components.Generic.TransferRobuxHeader)
local TransferAmountOptionChips = require(CurrencyTransfers.Components.Generic.TransferAmountOptionChips)
local TransferProfileThumbnail = require(CurrencyTransfers.Components.Generic.TransferProfileThumbnail)
local useTransferStore = require(CurrencyTransfers.Hooks.useTransferStore)
local useTextBoxOnChangeRef = require(CurrencyTransfers.Hooks.useTextBoxOnChangeRef)
local useAutoFocusTextBoxOnMount = require(CurrencyTransfers.Hooks.useAutoFocusTextBoxOnMount)
local proceedToConfirm = require(CurrencyTransfers.Actions.Send.proceedToConfirm)
local setTransferPromptState = require(CurrencyTransfers.Actions.Send.setTransferPromptState)
local PromptState = require(CurrencyTransfers.Enums.PromptState)
local GetFIntCurrencyTransferMinAmount = require(CurrencyTransfers.Flags.GetFIntCurrencyTransferMinAmount)
local GetFIntCurrencyTransferMaxAmount = require(CurrencyTransfers.Flags.GetFIntCurrencyTransferMaxAmount)
local GetFFlagCurrencyTransferFixTextBoxInput = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFixTextBoxInput)
local CurrencyTransferTelemetry = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local RobuxTransferFlowEventName = require(CurrencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounter = require(CurrencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEvent = require(CurrencyTransfers.Utils.logRobuxTransferFlowEvent)
local formatNumber = require(CurrencyTransfers.Utils.formatNumber)

return function(_: {[any]: any}) --[[ TransferRobuxInputSheet ]] -- line: 59
	-- upvalues: useLocalization (copy), TransferLocalizationKeys (copy), useTransferStore (copy), React (copy), logCurrencyTransferCounter (copy), CurrencyTransferTelemetry (copy), SharedFlags (copy), logRobuxTransferFlowEvent (copy), RobuxTransferFlowEventName (copy), SignalsReact (copy), GetFIntCurrencyTransferMinAmount (copy), GetFIntCurrencyTransferMaxAmount (copy), setTransferPromptState (copy), PromptState (copy), proceedToConfirm (copy), useTextBoxOnChangeRef (copy), useAutoFocusTextBoxOnMount (copy), formatNumber (copy), LocalizationService (copy), transferLocaleFormat (copy), useScaledValue (copy), Sheet (copy), TransferRobuxHeader (copy), View (copy), GetFFlagCurrencyTransferFixTextBoxInput (copy), TransferProfileThumbnail (copy), RobuxText (copy), FoundationText (copy), TransferAmountOptionChips (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local v37 = useLocalization(TransferLocalizationKeys.Presets.TransferRobuxInputSheet)
	local v38 = useTransferStore()

	React.useEffect(function() -- line: 64
		-- upvalues: logCurrencyTransferCounter (copy), v38 (copy), CurrencyTransferTelemetry (copy), SharedFlags (copy), logRobuxTransferFlowEvent (copy), RobuxTransferFlowEventName (copy)
		logCurrencyTransferCounter(v38, CurrencyTransferTelemetry.CurrencyTransferInputSheetShownCounter)

		if SharedFlags.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEvent(v38, RobuxTransferFlowEventName.input_shown)
		end

		return nil
	end, { v38 })

	local v39 = SignalsReact.useSignalState(v38.getSelectedAmount) or 0
	local setSelectedAmount = v38.setSelectedAmount
	local v41, v42 = React.useState(false)
	local v43 = v38.getRobuxBalanceAmount(false)
	local v44 = v38.getRecipient(false)
	local v45 = React.useRef(nil)
	local v46 = GetFIntCurrencyTransferMinAmount()
	local v47 = GetFIntCurrencyTransferMaxAmount()

	React.useEffect(function() -- line: 81
		-- upvalues: v39 (copy), v46 (copy), v47 (copy), v42 (copy)
		if v39 == 0 or v39 >= v46 and v39 <= v47 then
			v42(false)
		end
	end, {
		v39,
		v46,
		v47
	})

	local v48 = React.useCallback(function() -- line: 87
		-- upvalues: v39 (copy), v46 (copy), v47 (copy), v42 (copy), v43 (copy), setTransferPromptState (copy), v38 (copy), PromptState (copy), proceedToConfirm (copy)
		if v39 and (v39 < v46 or v39 > v47) then
			v42(true)

			return
		end

		if v39 and v39 > v43 then
			setTransferPromptState(v38, PromptState.TransferInsufficientBalance)

			return
		end

		proceedToConfirm(v38, v39 or 0)
	end, {
		v38,
		v39,
		v43,
		v46,
		v47
	})
	local v49 = React.useCallback(function(n1: number?) -- line: 101
		-- upvalues: setSelectedAmount (copy)
		setSelectedAmount(n1 or 0)
	end, { setSelectedAmount })
	local v50 = React.useCallback(function(b1: boolean, b2: boolean) -- line: 105
		-- upvalues: v39 (copy), v46 (copy), v47 (copy), v42 (copy), v48 (copy)
		if not b1 and b2 then
			if v39 and v39 > 0 and (v39 < v46 or v39 > v47) then
				v42(true)

				return
			end

			v48()
		end
	end, {
		v48,
		v39,
		v46,
		v47
	})
	local v51 = useTextBoxOnChangeRef(v49, v50)
	local triggerOnClose = v38.triggerOnClose
	local v53 = useAutoFocusTextBoxOnMount(v51, 0.05)
	local v54 = React.useCallback(function(p1) -- line: 124
		-- upvalues: v45 (copy), v53 (copy)
		if p1 then
			v45.current = p1
			v53(p1)
		end
	end, { v53 })
	local v55 = React.useMemo(function() -- line: 131
		return {
			{
				amount = 25,
				text = "25"
			},
			{
				amount = 50,
				text = "50"
			},
			{
				amount = 100,
				text = "100"
			},
			{
				amount = 200,
				text = "200"
			}
		}
	end, {})
	local v56 = React.useCallback(function(n2: number) -- line: 140
		-- upvalues: setSelectedAmount (copy)
		setSelectedAmount(n2)
	end, { setSelectedAmount })
	local v57 = v39 > 0 and (v39 < v46 or v47 < v39)
	local v58 = v41 and v57
	local v59 = React.useMemo(function() -- line: 148
		-- upvalues: v58 (copy), v39 (copy), v46 (copy), formatNumber (copy), LocalizationService (copy), transferLocaleFormat (copy), v37 (copy), v47 (copy)
		if not v58 or (not v39 or v39 <= 0) then
			return nil
		end

		if v39 < v46 then
			local v68 = formatNumber(LocalizationService.RobloxLocaleId, v46)

			return transferLocaleFormat.substituteAmount(v37.LowerThanMinAmount or "", (tostring(v68)))
		end

		if v39 > v47 then
			local v69 = formatNumber(LocalizationService.RobloxLocaleId, v47)

			return transferLocaleFormat.substituteAmount(v37.GreaterThanMaxAmount or "", (tostring(v69)))
		end

		return nil
	end, {
		v58,
		v39,
		v46,
		v47,
		v37.LowerThanMinAmount,
		v37.GreaterThanMaxAmount
	})
	local v60 = React.useMemo(function() -- line: 171
		-- upvalues: v39 (copy)
		return not v39 or v39 <= 0
	end, { v39 })
	local v61 = useScaledValue(500)
	local v62 = React.useMemo(function() -- line: 181
		-- upvalues: v61 (copy)
		return {
			v61,
			0.62
		}
	end, { v61 })

	return React.createElement(Sheet.Root, {
		preferCenterSheet = true,
		snapPoints = v62,
		onClose = triggerOnClose
	}, {
		Header = React.createElement(Sheet.Header, {}, {
			TransferRobuxHeader = React.createElement(TransferRobuxHeader, {
				titleText = v37.SendRobux,
				robuxBalanceAmount = v43
			})
		}),
		Content = React.createElement(Sheet.Content, {
			LayoutOrder = 2
		}, {
			SheetContentContainer = React.createElement(View, {
				tag = "col align-x-center items-center gap-large size-full-0 auto-y padding-x-large padding-top-xxlarge"
			}, {
				RobuxInputWrapper = React.createElement("Frame", {
					Size = UDim2.new(0, 0, 0, 0),
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					LayoutOrder = 0
				}, {
					RobuxInput = React.createElement("Frame", {
						Size = UDim2.new(0, 80, 0, 40),
						Position = UDim2.new(0, -10000, 0, 0),
						BackgroundTransparency = 1
					}, {
						TextBox = React.createElement("TextBox", {
							Size = UDim2.new(1, 0, 1, 0),
							Text = if not v39 or not (v39 > 0) then not GetFFlagCurrencyTransferFixTextBoxInput() and "0" or "" else tostring(v39),
							PlaceholderText = "",
							TextInputType = Enum.TextInputType.Number,
							BackgroundTransparency = 1,
							ref = v54
						})
					})
				}),
				ThumbnailAndAmountArea = React.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					LayoutOrder = 1
				}, {
					Content = React.createElement(View, {
						tag = "col align-x-center items-center gap-xlarge size-full-0 auto-y padding-top-xlarge"
					}, {
						RecipientProfile = if not v44 or not v44.targetId then nil else React.createElement(TransferProfileThumbnail, {
							userId = tostring(v44.targetId),
							username = v44.targetName,
							showUsername = true,
							size = UDim2.fromOffset(60, 60),
							layoutOrder = 1,
							thumbnailSize = Enum.ThumbnailSize.Size48x48
						}),
						AmountContainer = React.createElement(View, {
							tag = "col align-x-center gap-large size-full-1600",
							LayoutOrder = 2
						}, {
							ThumbnailAmountGap = React.createElement(View, {
								tag = "size-full-0",
								Size = UDim2.new(1, 0, 0, 20),
								LayoutOrder = 1
							}),
							AmountRow = React.createElement(View, {
								tag = "row align-x-center align-y-center",
								LayoutOrder = 2
							}, {
								AmountWrapper = React.createElement("Frame", {
									AutomaticSize = Enum.AutomaticSize.XY,
									BackgroundTransparency = 1,
									LayoutOrder = 1
								}, {
									SelectedAmountDisplay = React.createElement(RobuxText, {
										amount = v39,
										layoutOrder = 1
									}),
									AmountTapTarget = React.createElement("TextButton", {
										Size = UDim2.new(1, 0, 1, 0),
										Position = UDim2.new(0, 0, 0, 0),
										Text = "",
										BackgroundTransparency = 1,
										ZIndex = 2,
										[React.Event.Activated] = function() -- line: 281
											-- upvalues: v45 (copy)
											if v45.current then
												v45.current:CaptureFocus()
											end
										end
									})
								})
							}),
							ErrorSlot = React.createElement(View, {
								tag = "col align-x-center align-y-center size-full-0 padding-top-medium",
								Size = UDim2.new(1, 0, 0, 40),
								LayoutOrder = 3
							}, {
								ValidationErrorText = if not v59 then nil else React.createElement(FoundationText, {
									Text = v59,
									tag = "auto-xy text-caption-small text-align-x-center content-system-alert",
									LayoutOrder = 1
								})
							})
						})
					}),
					TapToFocusOverlay = React.createElement("TextButton", {
						Size = UDim2.new(1, 0, 1, 0),
						Position = UDim2.new(0, 0, 0, 0),
						Text = "",
						BackgroundTransparency = 1,
						ZIndex = 2,
						[React.Event.Activated] = function() -- line: 311
							-- upvalues: v45 (copy)
							if v45.current then
								v45.current:CaptureFocus()
							end
						end
					})
				}),
				AmountChips = React.createElement(View, {
					tag = "col align-x-center size-full-1600 auto-y",
					LayoutOrder = 2,
					ZIndex = 3
				}, {
					Chips = React.createElement(TransferAmountOptionChips, {
						chips = v55,
						onChipSelected = v56,
						selectedAmount = v39,
						layoutOrder = 1
					})
				})
			})
		}),
		Actions = React.createElement(Sheet.Actions, {
			LayoutOrder = 3
		}, { React.createElement(View, {
			tag = "col align-x-center align-y-center gap-medium size-full-1000"
		}, {
			React.createElement(View, {
				tag = "row gap-small size-full-0 auto-y",
				LayoutOrder = 1
			}, { React.createElement(Button, {
				text = v37.Next,
				onActivated = v48,
				variant = ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				isDisabled = v60
			}) }),
			Disclaimer = React.createElement(FoundationText, {
				Text = v37.Disclaimer,
				tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-center",
				LayoutOrder = 2
			})
		}) })
	})
end
