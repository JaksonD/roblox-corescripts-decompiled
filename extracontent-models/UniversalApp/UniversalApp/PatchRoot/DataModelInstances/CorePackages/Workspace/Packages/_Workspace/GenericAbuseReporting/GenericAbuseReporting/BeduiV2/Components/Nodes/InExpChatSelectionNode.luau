local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local GenericAbuseReportingParent = GenericAbuseReporting.Parent
local Dash = require(GenericAbuseReportingParent.Dash)
local Foundation = require(GenericAbuseReportingParent.Foundation)
local React = require(GenericAbuseReportingParent.React)
local Button = Foundation.Button
local ButtonVariant = Foundation.Enums.ButtonVariant
local DialogSize = Foundation.Enums.DialogSize
local Dropdown = Foundation.Dropdown
local Empty = Foundation.Empty
local FillBehavior = Foundation.Enums.FillBehavior
local List = Foundation.List
local ListItemInputType = Foundation.Enums.ListItemInputType
local EnumsRadius = Foundation.Enums.Radius
local Sheet = Foundation.Sheet
local Skeleton = Foundation.Skeleton
local FoundationText = Foundation.Text
local useTokens = Foundation.Hooks.useTokens
local View = Foundation.View
local AbuseReportAnalyticsContext = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local analyticsService = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService)
local LayoutSlots = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots)
local scrollToItem = require(GenericAbuseReporting.BeduiV2.Utils.scrollToItem)

require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)

local useArTranslation = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local useGroupedListLoader = require(GenericAbuseReporting.BeduiV2.Loaders.useLoader).useGroupedListLoader
local TelemetryEventType = analyticsService.TelemetryEventType
local useAbuseReportAnalytics = AbuseReportAnalyticsContext.useAbuseReportAnalytics
local useLayoutSlots = LayoutSlots.useLayoutSlots

local function LoadingContent() -- line: 126
	-- upvalues: useTokens (copy), React (copy), Sheet (copy), View (copy), Dash (copy), Skeleton (copy), EnumsRadius (copy)
	local v33 = useTokens()

	return React.createElement(Sheet.Content, nil, {
		SkeletonContainer = React.createElement(View, {
			tag = "col gap-medium size-full-0 auto-y"
		}, Dash.map(table.create(5, true), function(_: boolean, n1: number) -- line: 133
			-- upvalues: React (copy), Skeleton (copy), EnumsRadius (copy), v33 (copy)
			return React.createElement(Skeleton, {
				key = tostring(n1),
				radius = EnumsRadius.Medium,
				Size = UDim2.new(1, 0, 0, v33.Size.Size_800)
			})
		end))
	})
end
local function ErrorContent(t1: {[any]: any}) -- line: 144
	-- upvalues: useArTranslation (copy), React (copy), Sheet (copy), View (copy), FoundationText (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local translateIntoString = useArTranslation().translateIntoString

	return React.createElement(Sheet.Content, nil, {
		ErrorContainer = React.createElement(View, {
			tag = "align-x-center align-y-center gap-medium size-full"
		}, {
			ErrorText = React.createElement(FoundationText, {
				Text = translateIntoString(t1.errorText),
				RichText = true,
				tag = "auto-xy text-body-medium text-wrap text-align-x-left"
			}),
			RetryButton = React.createElement(Button, {
				text = translateIntoString(t1.retryButtonText),
				variant = ButtonVariant.Standard,
				fillBehavior = FillBehavior.Fit,
				onActivated = t1.retry or function() -- line: 164
				end
			})
		})
	})
end

return React.memo(function(t2: {[any]: any}) --[[ InExpChatSelectionNode ]] -- line: 177
	-- upvalues: React (copy), useArTranslation (copy), useAbuseReportAnalytics (copy), useLayoutSlots (copy), useGroupedListLoader (copy), scrollToItem (copy), TelemetryEventType (copy), Dash (copy), LoadingContent (copy), ErrorContent (copy), Sheet (copy), View (copy), Empty (copy), Dropdown (copy), List (copy), ListItemInputType (copy), DialogSize (copy), FoundationText (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local v37, v38 = React.useState(t2.initialValue or nil)
	local v39 = React.useRef(nil)
	local v40, v41 = React.useState(nil)
	local v42, v43 = React.useState(true)
	local translateIntoString = useArTranslation().translateIntoString
	local v45 = React.useRef({})
	local v46 = React.useRef(false)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local v48 = React.useRef(false)
	local v49 = React.useRef(false)
	local v50 = React.useRef(nil)
	local v51 = React.useRef(false)
	local v52 = React.useRef(false)
	local Body = useLayoutSlots().Body
	local v54 = useGroupedListLoader(t2.items)
	local v55 = v54.data or {}

	React.useEffect(function() -- line: 36
		-- upvalues: v37 (copy), v45 (copy), scrollToItem (copy)
		if not v37 then
			return
		end

		local v70 = v45.current[v37]

		if not v70 then
			return
		end

		local ScrollingFrame = v70:FindFirstAncestorWhichIsA("ScrollingFrame")

		if not ScrollingFrame then
			return
		end

		local u72 = false
		local t3 = {
			current = ScrollingFrame.Parent
		}
		local t4 = {
			current = v70
		}

		if v70.AbsoluteSize.Y > 0 then
			if not u72 then
				scrollToItem(t3, t4)
			end
		else
			local connection = nil

			connection = v70:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- line: 70
				-- upvalues: v70 (copy), connection (ref), u72 (ref), scrollToItem (copy), t3 (copy), t4 (copy)
				if v70.AbsoluteSize.Y > 0 then
					connection:Disconnect()

					if u72 then
						return
					end

					scrollToItem(t3, t4)
				end
			end)
			task.delay(2, function() -- line: 77
				-- upvalues: connection (ref)
				if connection.Connected then
					connection:Disconnect()
				end
			end)
		end

		return function() -- line: 84
			-- upvalues: u72 (ref)
			u72 = true
		end
	end, { v37 })
	React.useEffect(function() -- line: 201
		-- upvalues: v50 (copy), v48 (copy), v49 (copy)
		local current = v50.current

		if not current then
			return
		end

		local ScrollingFrame = current:FindFirstChildWhichIsA("ScrollingFrame", true)

		if not ScrollingFrame then
			return
		end

		local function checkScrollbar() -- line: 212
			-- upvalues: v48 (copy), ScrollingFrame (copy)
			v48.current = ScrollingFrame.AbsoluteCanvasSize.Y > ScrollingFrame.AbsoluteWindowSize.Y
		end

		v48.current = ScrollingFrame.AbsoluteCanvasSize.Y > ScrollingFrame.AbsoluteWindowSize.Y

		local connection = ScrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkScrollbar)
		local connection2 = ScrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkScrollbar)
		local connection3 = ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ onScroll ]] -- line: 216
			-- upvalues: ScrollingFrame (copy), v49 (copy)
			if ScrollingFrame.CanvasPosition.Y > 0 then
				v49.current = true
			end
		end)

		return function() -- line: 229
			-- upvalues: connection (copy), connection2 (copy), connection3 (copy)
			connection:Disconnect()
			connection2:Disconnect()
			connection3:Disconnect()
		end
	end, { v54.loading })
	React.useEffect(function() -- line: 236
		-- upvalues: v54 (copy), v51 (copy), sendEvent (copy), TelemetryEventType (copy)
		if v54.error and not v51.current then
			v51.current = true
			sendEvent({
				sub_event_type = TelemetryEventType.Error,
				error_detail = {
					error_message = "inExpChatSelection: load failed: " .. v54.error
				}
			})
		end
	end, {
		v54.error,
		sendEvent
	})

	local v56 = #v55 > 1
	local v57 = React.useMemo(function() -- line: 247
		-- upvalues: v40 (copy), v37 (copy), v55 (copy)
		if v40 then
			return v40
		end

		if v37 then
			for _, v in ipairs(v55) do
				for _, v2 in ipairs(v.items) do
					if v2.id == v37 then
						return v.id
					end
				end
			end
		end

		return v55[1] and v55[1].id or nil
	end, {
		v40,
		v37,
		v55
	})
	local v58 = React.useMemo(function() -- line: 263
		-- upvalues: v55 (copy), Dash (copy), v57 (copy)
		if #v55 == 0 then
			return {}
		end

		local v86 = Dash.find(v55, function(p1) -- line: 267
			-- upvalues: v57 (copy)
			return p1.id == v57
		end)
		local items

		if v86 then
			items = v86.items

			if not items then
				return {}
			end
		else
			items = v55[1] and v55[1].items or {}
		end

		return items
	end, {
		v55,
		v57
	})

	React.useEffect(function() -- line: 273
		-- upvalues: v54 (copy), v58 (copy), v52 (copy), sendEvent (copy), TelemetryEventType (copy)
		if not v54.loading and (not v54.error and #v58 == 0 and not v52.current) then
			v52.current = true
			sendEvent({
				sub_event_type = TelemetryEventType.EmptyState
			})
		end
	end, {
		v54.loading,
		v54.error,
		v58,
		sendEvent
	})

	local v59 = React.useCallback(function() -- line: 287
		-- upvalues: v46 (copy), v43 (copy)
		v46.current = true
		v43(false)
	end, {})
	local v60 = React.useMemo(function() -- line: 292
		-- upvalues: Dash (copy), v55 (copy)
		return Dash.map(v55, function(t5: {[any]: any}) -- line: 293
			return {
				id = t5.id,
				text = t5.label
			}
		end)
	end, { v55 })
	local v61 = if not v54.loading then if not v54.error then if #v58 ~= 0 then React.createElement(Sheet.Content, {
		ref = v50
	}, {
		ChannelDropdown = if not v56 then nil else React.createElement(View, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 1
		}, {
			Dropdown = React.createElement(Dropdown.Root, {
				label = "",
				value = v57,
				items = v60,
				width = UDim.new(1, 0),
				onItemChanged = function(p2) --[[ onItemChanged ]] -- line: 333
					-- upvalues: v57 (copy), v38 (copy), v41 (copy), sendEvent (copy), TelemetryEventType (copy), v55 (copy)
					local v89 = v57 or ""
					local str = tostring(p2)

					v38(nil)
					v41(str)
					sendEvent({
						sub_event_type = TelemetryEventType.TextChannelSwitch,
						text_channel_switch_detail = {
							previous_channel_name = v89,
							new_channel_name = str,
							channel_count = #v55
						}
					})
				end
			})
		}),
		ItemList = React.createElement(List.Root, {
			hasDivider = {
				hasDivider = true,
				isInset = false
			},
			isContained = {
				isContained = false,
				hasMargin = true
			},
			LayoutOrder = 2
		}, { Dash.map(v58, function(t6: {[any]: any}, n2: number) -- line: 361
			-- upvalues: React (copy), List (copy), translateIntoString (copy), v38 (copy), v39 (copy), sendEvent (copy), TelemetryEventType (copy), v58 (copy), v48 (copy), v49 (copy), ListItemInputType (copy), v37 (copy), v45 (copy)
			return React.createElement(List.Item, {
				description = translateIntoString(t6.label),
				onActivated = {
					onActivated = function() --[[ onActivated ]] -- line: 366
						-- upvalues: v38 (copy), t6 (copy), v39 (copy), sendEvent (copy), TelemetryEventType (copy), n2 (copy), v58 (copy), v48 (copy), v49 (copy)
						v38(t6.id)
						v39.current = t6
						sendEvent({
							sub_event_type = TelemetryEventType.SelectItem,
							select_item_detail = {
								selected_index = n2,
								list_length = #v58,
								has_scroll = v48.current,
								did_scroll = v49.current
							}
						})
					end,
					inputType = ListItemInputType.Radio,
					isChecked = v37 == t6.id
				},
				LayoutOrder = n2,
				ref = function(p3) --[[ ref ]] -- line: 383
					-- upvalues: v45 (copy), t6 (copy)
					v45.current[t6.id] = p3
				end,
				key = t6.id
			})
		end) })
	}) else React.createElement(Sheet.Content, nil, {
		Empty = React.createElement(View, {
			tag = "align-x-center align-y-center size-full"
		}, React.createElement(Empty, {
			text = translateIntoString(t2.emptyText)
		}))
	}) else React.createElement(ErrorContent, {
		retry = v54.retry,
		errorText = t2.errorText,
		retryButtonText = t2.retryButtonText
	}) else React.createElement(LoadingContent)

	return React.createElement(React.Fragment, nil, {
		Content = React.createElement(Body),
		ChatSelectionSheet = React.createElement(Sheet.Root, {
			isOpen = v42,
			centerSheetHeight = 1,
			size = DialogSize.Medium,
			preferCenterSheet = true,
			snapPoints = { 0.9 },
			onClose = function() --[[ onClose ]] -- line: 402
				-- upvalues: v46 (copy), t2 (copy), v37 (copy), v39 (copy)
				if v46.current then
					v46.current = false

					if t2.onNext then
						t2.onNext(v37, v39.current)

						return
					end
				elseif t2.goBack then
					t2.goBack()
				end
			end
		}, {
			SheetHeader = React.createElement(Sheet.Header, nil, {
				Title = React.createElement(FoundationText, {
					tag = "align-x-left auto-xy text-title-large text-truncate-end content-emphasis",
					Text = translateIntoString(t2.title)
				})
			}),
			SheetContent = v61,
			SheetActions = if v54.loading or (v54.error or v37 == nil) then nil else React.createElement(Sheet.Actions, nil, {
				Button = React.createElement(Button, {
					variant = ButtonVariant.Emphasis,
					text = translateIntoString(t2.nextButtonText),
					isLoading = t2.isSubmitting,
					isDisabled = t2.isSubmitting,
					fillBehavior = FillBehavior.Fill,
					onActivated = v59
				})
			})
		})
	})
end)
