local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local CurrencyTransfersParent = CurrencyTransfers.Parent
local React = require(CurrencyTransfersParent.React)
local SharedFlags = require(CurrencyTransfersParent.SharedFlags)
local TransferLocalizationKeys = require(CurrencyTransfers.Localization.TransferLocalizationKeys)
local Foundation = require(CurrencyTransfersParent.Foundation)
local ButtonVariant = Foundation.Enums.ButtonVariant
local Sheet = Foundation.Sheet
local Button = Foundation.Button
local View = Foundation.View
local FoundationText = Foundation.Text
local FillBehavior = Foundation.Enums.FillBehavior
local Enums = Foundation.Enums
local IconVariant = Foundation.Enums.IconVariant
local getIconRichText = Foundation.Utility.getIconRichText
local useLocalization = require(CurrencyTransfersParent.Localization).Hooks.useLocalization
local TransferRobuxHeader = require(CurrencyTransfers.Components.Generic.TransferRobuxHeader)
local TransferProfileThumbnail = require(CurrencyTransfers.Components.Generic.TransferProfileThumbnail)
local RobuxText = require(CurrencyTransfers.Components.Generic.RobuxText)
local useTransferStore = require(CurrencyTransfers.Hooks.useTransferStore)
local setTransferPromptState = require(CurrencyTransfers.Actions.Send.setTransferPromptState)
local processTransfer = require(CurrencyTransfers.Actions.Send.processTransfer)
local PromptState = require(CurrencyTransfers.Enums.PromptState)
local TransferOrigination = require(CurrencyTransfers.Enums.TransferOrigination)
local CurrencyTransferTelemetry = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local RobuxTransferFlowEventName = require(CurrencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounter = require(CurrencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEvent = require(CurrencyTransfers.Utils.logRobuxTransferFlowEvent)
local GetFIntCurrencyTransferDeveloperCommissionRate = require(CurrencyTransfers.Flags.GetFIntCurrencyTransferDeveloperCommissionRate)
local GetFIntCurrencyTransferPlatformFeeRate = require(CurrencyTransfers.Flags.GetFIntCurrencyTransferPlatformFeeRate)

return function(_: {[any]: any}) --[[ TransferRobuxConfirmSheet ]] -- line: 56
	-- upvalues: useLocalization (copy), TransferLocalizationKeys (copy), useTransferStore (copy), React (copy), logCurrencyTransferCounter (copy), CurrencyTransferTelemetry (copy), SharedFlags (copy), logRobuxTransferFlowEvent (copy), RobuxTransferFlowEventName (copy), TransferOrigination (copy), GetFIntCurrencyTransferDeveloperCommissionRate (copy), GetFIntCurrencyTransferPlatformFeeRate (copy), Sheet (copy), TransferRobuxHeader (copy), View (copy), TransferProfileThumbnail (copy), FoundationText (copy), getIconRichText (copy), Enums (copy), IconVariant (copy), RobuxText (copy), Button (copy), setTransferPromptState (copy), PromptState (copy), processTransfer (copy), ButtonVariant (copy), FillBehavior (copy), Foundation (copy)
	local v32 = useLocalization(TransferLocalizationKeys.Presets.TransferRobuxConfirmSheet)
	local v33 = useTransferStore()

	React.useEffect(function() -- line: 61
		-- upvalues: logCurrencyTransferCounter (copy), v33 (copy), CurrencyTransferTelemetry (copy), SharedFlags (copy), logRobuxTransferFlowEvent (copy), RobuxTransferFlowEventName (copy)
		logCurrencyTransferCounter(v33, CurrencyTransferTelemetry.CurrencyTransferConfirmSheetShownCounter)

		if SharedFlags.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEvent(v33, RobuxTransferFlowEventName.confirm_shown)
		end

		return nil
	end, { v33 })

	local v34 = v33.getRobuxBalanceAmount(false)
	local v35 = v33.getSelectedAmount(false)
	local v36 = v33.getUserRelationshipDetail(false)
	local v37 = v33.getRecipient(false)
	local v38 = v33.getTransferOrigination(false) == TransferOrigination.InExperience
	local triggerOnClose = v33.triggerOnClose
	local year = os.date("*t").year
	local v41, v42 = React.useState(v36)
	local v43, v44 = React.useState(v37)

	React.useEffect(function() -- line: 81
		-- upvalues: v36 (copy), v42 (copy)
		if v36 then
			v42(v36)
		end
	end, { v36 })
	React.useEffect(function() -- line: 87
		-- upvalues: v37 (copy), v44 (copy)
		if v37 then
			v44(v37)
		end
	end, { v37 })

	local v45 = React.useMemo(function() -- line: 93
		-- upvalues: v41 (copy), v32 (copy), year (copy)
		if not v41 or not v41.friendSinceYear then
			return v32.NewConnection
		end

		local friendSinceYear = v41.friendSinceYear
		local v50 = year - friendSinceYear

		if v50 == 0 then
			return v32.NewConnection
		end

		return string.gsub(v32.ConnectedYear, "{year}", (tostring(v50)))
	end, {
		year,
		v41
	})
	local v46 = React.useMemo(function() -- line: 105
		-- upvalues: v32 (copy), v41 (copy)
		return string.gsub(v32.MutualConnection, "{amount}", (tostring(v41.mutualFriendsCount)))
	end, { v41.mutualFriendsCount })
	local v47 = React.useMemo(function() -- line: 113
		-- upvalues: v32 (copy), v41 (copy)
		return string.gsub(v32.JoinedInYear, "{year}", (tostring(v41.userAccountSinceYear)))
	end, { v41.userAccountSinceYear })
	local v48 = React.useMemo(function() -- line: 117
		-- upvalues: v38 (copy), v35 (copy), GetFIntCurrencyTransferDeveloperCommissionRate (copy), GetFIntCurrencyTransferPlatformFeeRate (copy), v32 (copy)
		if not v38 or not v35 then
			return nil
		end

		local v51 = GetFIntCurrencyTransferDeveloperCommissionRate()
		local v52 = GetFIntCurrencyTransferPlatformFeeRate()
		local v53 = math.ceil(v35 * (1 - (v51 + v52) / 100))

		return (string.gsub(v32.RecipientWillGet, "{amount}", (tostring(v53))))
	end, {
		v38,
		v35,
		v32.RecipientWillGet
	})

	return React.createElement(Sheet.Root, {
		preferCenterSheet = true,
		onClose = triggerOnClose
	}, {
		Header = React.createElement(Sheet.Header, {}, {
			TransferRobuxHeader = React.createElement(TransferRobuxHeader, {
				titleText = v32.SendRobux,
				robuxBalanceAmount = v34
			})
		}),
		Content = React.createElement(Sheet.Content, {
			LayoutOrder = 2
		}, {
			SheetContentContainer = React.createElement(View, {
				tag = "col gap-large auto-y size-full-0 align-x-center"
			}, {
				ProfileCard = React.createElement(View, {
					Size = UDim2.new(1, 0, 0, 250),
					tag = "col gap-xlarge align-x-center bg-shift-100 align-y-center radius-medium padding-large",
					LayoutOrder = 1
				}, {
					RecipientProfile = if not v43 or not v43.targetId then nil else React.createElement(TransferProfileThumbnail, {
						userId = tostring(v43.targetId),
						username = v43.targetName,
						displayName = v43.targetDisplayName,
						showUsername = true,
						size = UDim2.fromOffset(60, 60),
						layoutOrder = 1,
						thumbnailSize = Enum.ThumbnailSize.Size48x48
					}),
					InfoRow = React.createElement(View, {
						tag = "col gap-medium align-x-center align-y-start auto-y size-full-0",
						LayoutOrder = 2
					}, {
						FirstRow = React.createElement(View, {
							tag = "row align-x-center align-y-center auto-xy",
							LayoutOrder = 1
						}, {
							ConnectedDetail = if not v41 or not v41.areFriends then nil else React.createElement(FoundationText, {
								Text = `{ getIconRichText(Enums.IconName.Calendar, IconVariant.Filled) } { v45 }`,
								tag = "auto-xy text-body-medium content-default text-no-wrap",
								RichText = true,
								LayoutOrder = 1
							}),
							Spacer = if not v41 or not v41.areFriends then nil else React.createElement(View, {
								tag = "auto-xy",
								Size = UDim2.new(0, 8, 0, 0),
								LayoutOrder = 2
							}),
							MutualDetail = React.createElement(FoundationText, {
								Text = `{ getIconRichText(Enums.IconName.TwoPeople, IconVariant.Filled) } { v46 }`,
								tag = "auto-xy text-body-medium content-default text-no-wrap",
								RichText = true,
								LayoutOrder = 3
							})
						}),
						JoinedDetail = React.createElement(FoundationText, {
							Text = `{ getIconRichText(Enums.IconName.CircleI, IconVariant.Filled) } { v47 }`,
							tag = "auto-xy text-body-medium content-default text-no-wrap padding-y-xsmall",
							RichText = true,
							LayoutOrder = 2
						})
					})
				}),
				AmountDisplay = React.createElement(View, {
					tag = "col align-x-center align-y-center size-full-2000 radius-medium bg-shift-100",
					LayoutOrder = 2
				}, {
					Amount = React.createElement(RobuxText, {
						amount = v35 or 0,
						layoutOrder = 1
					}),
					RecipientText = if not v48 then nil else React.createElement(FoundationText, {
						Text = v48,
						tag = "auto-xy text-caption-small text-align-x-center content-muted",
						LayoutOrder = 2
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
			}, {
				SendButton = React.createElement(Button, {
					LayoutOrder = 1,
					text = v32.Send,
					onActivated = function() --[[ onActivated ]] -- line: 229
						-- upvalues: v35 (copy), v34 (copy), setTransferPromptState (copy), v33 (copy), PromptState (copy), processTransfer (copy)
						if v35 and v35 > v34 then
							setTransferPromptState(v33, PromptState.TransferInsufficientBalance)

							return
						end

						processTransfer(v33, v35 or 0)
					end,
					inputDelay = if not v38 then nil else 2.5,
					variant = ButtonVariant.Emphasis,
					fillBehavior = FillBehavior.Fill
				}),
				EditButton = if v38 then nil else React.createElement(Button, {
					LayoutOrder = 2,
					text = v32.Edit,
					onActivated = function() --[[ onActivated ]] -- line: 244
						-- upvalues: setTransferPromptState (copy), v33 (copy), PromptState (copy)
						setTransferPromptState(v33, PromptState.TransferInput)
					end,
					variant = ButtonVariant.Standard,
					fillBehavior = FillBehavior.Fill
				})
			}),
			Disclaimer = React.createElement(Foundation.Text, {
				Text = v32.AgeEstimationDisclaimer,
				tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-left",
				LayoutOrder = 2
			})
		}) })
	})
end
