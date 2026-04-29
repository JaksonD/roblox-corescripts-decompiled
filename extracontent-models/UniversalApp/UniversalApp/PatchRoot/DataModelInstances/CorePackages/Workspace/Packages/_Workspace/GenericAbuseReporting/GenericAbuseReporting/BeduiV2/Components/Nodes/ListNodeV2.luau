local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local GenericAbuseReportingParent = GenericAbuseReporting.Parent
local Dash = require(GenericAbuseReportingParent.Dash)
local Foundation = require(GenericAbuseReportingParent.Foundation)
local React = require(GenericAbuseReportingParent.React)
local Button = Foundation.Button
local ButtonVariant = Foundation.Enums.ButtonVariant
local Empty = Foundation.Empty
local FillBehavior = Foundation.Enums.FillBehavior
local IconName = Foundation.Enums.IconName
local List = Foundation.List
local ListItemInputType = Foundation.Enums.ListItemInputType
local Skeleton = Foundation.Skeleton
local EnumsRadius = Foundation.Enums.Radius
local useTokens = Foundation.Hooks.useTokens
local View = Foundation.View
local AbuseReportAnalyticsContext = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local analyticsService = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService)
local Eyebrow = require(GenericAbuseReporting.BeduiV2.Components.Eyebrow)
local LayoutSlots = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots)
local scrollToItem = require(GenericAbuseReporting.BeduiV2.Utils.scrollToItem)
local TextWithTranslation = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)

require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)

local useArTranslation = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local useListLoader = require(GenericAbuseReporting.BeduiV2.Loaders.useLoader).useListLoader
local TelemetryEventType = analyticsService.TelemetryEventType
local useAbuseReportAnalytics = AbuseReportAnalyticsContext.useAbuseReportAnalytics
local useLayoutSlots = LayoutSlots.useLayoutSlots
local t1 = {
	chevron = nil,
	radio = ListItemInputType.Radio,
	toggle = ListItemInputType.Toggle,
	checkbox = ListItemInputType.Checkbox
}

local function ListNodeLoading(t2: {[any]: any}) -- line: 69
	-- upvalues: React (copy), Eyebrow (copy), TextWithTranslation (copy), View (copy), Skeleton (copy), EnumsRadius (copy)
	local body = t2.body
	local title = t2.title
	local eyebrow = t2.eyebrow
	local tokens = t2.tokens

	return React.createElement(body, nil, {
		Eyebrow = eyebrow and React.createElement(Eyebrow, {
			eyebrow = eyebrow,
			layoutOrder = 0
		}),
		Title = React.createElement(TextWithTranslation, {
			input = title,
			tag = "size-full-0 auto-y text-heading-medium",
			layoutOrder = 1
		}),
		SkeletonContainer = React.createElement(View, {
			tag = "col size-full-0 auto-y gap-medium",
			LayoutOrder = 2
		}, {
			Skeleton1 = React.createElement(Skeleton, {
				radius = EnumsRadius.Medium,
				Size = UDim2.new(1, 0, 0, tokens.Size.Size_600)
			}),
			Skeleton2 = React.createElement(Skeleton, {
				radius = EnumsRadius.Medium,
				Size = UDim2.new(1, 0, 0, tokens.Size.Size_600)
			}),
			Skeleton3 = React.createElement(Skeleton, {
				radius = EnumsRadius.Medium,
				Size = UDim2.new(1, 0, 0, tokens.Size.Size_600)
			}),
			Skeleton4 = React.createElement(Skeleton, {
				radius = EnumsRadius.Medium,
				Size = UDim2.new(1, 0, 0, tokens.Size.Size_600)
			}),
			Skeleton5 = React.createElement(Skeleton, {
				radius = EnumsRadius.Medium,
				Size = UDim2.new(1, 0, 0, tokens.Size.Size_600)
			})
		})
	})
end
local function ListNodeError(t3: {[any]: any}) -- line: 117
	-- upvalues: useArTranslation (copy), React (copy), Eyebrow (copy), TextWithTranslation (copy), Button (copy), ButtonVariant (copy), Foundation (copy)
	local translateIntoString = useArTranslation().translateIntoString

	return React.createElement(t3.body, nil, {
		Eyebrow = t3.eyebrow and React.createElement(Eyebrow, {
			eyebrow = t3.eyebrow,
			layoutOrder = 0
		}),
		Title = React.createElement(TextWithTranslation, {
			input = t3.title,
			tag = "size-full-0 auto-y text-heading-medium",
			layoutOrder = 1
		}),
		ErrorText = React.createElement(TextWithTranslation, {
			input = translateIntoString(t3.errorText),
			tag = "size-full-0 auto-y text-body-small",
			layoutOrder = 2
		}),
		RetryButton = React.createElement(Button, {
			text = translateIntoString(t3.retryButtonText),
			variant = ButtonVariant.Standard,
			fillBehavior = Foundation.Enums.FillBehavior.Fit,
			onActivated = t3.retry,
			LayoutOrder = 3
		})
	})
end

return React.memo(function(t4: {[any]: any}) --[[ ListNode ]] -- line: 156
	-- upvalues: useTokens (copy), React (copy), useArTranslation (copy), useAbuseReportAnalytics (copy), useListLoader (copy), useLayoutSlots (copy), scrollToItem (copy), TelemetryEventType (copy), Dash (copy), ListNodeLoading (copy), ListNodeError (copy), Empty (copy), Eyebrow (copy), TextWithTranslation (copy), View (copy), List (copy), IconName (copy), t1 (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local v39 = useTokens()
	local v40, v41 = React.useState(t4.initialValue or nil)
	local translateIntoString = useArTranslation().translateIntoString
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local v44 = React.useRef(nil)
	local v45, v46 = React.useState(false)
	local v47, v48 = React.useState(false)
	local v49 = React.useRef(false)
	local v50 = React.useRef(false)
	local v51 = useListLoader(t4.items)
	local loading = v51.loading
	local error = v51.error
	local retry = v51.retry
	local data = v51.data
	local v56 = useLayoutSlots()
	local Body = v56.Body
	local Actions = v56.Actions

	React.useEffect(function() -- line: 178
		-- upvalues: v44 (copy), v46 (copy), v48 (copy)
		local current = v44.current

		if not current then
			return
		end

		local ScrollingFrame = current:FindFirstChildWhichIsA("ScrollingFrame", true)

		if not ScrollingFrame then
			return
		end

		local function checkScrollbar() -- line: 191
			-- upvalues: ScrollingFrame (copy), v46 (copy)
			local v77 = ScrollingFrame.AbsoluteCanvasSize.Y > ScrollingFrame.AbsoluteWindowSize.Y

			v46(v77)
		end

		local v68 = ScrollingFrame.AbsoluteCanvasSize.Y > ScrollingFrame.AbsoluteWindowSize.Y

		v46(v68)

		local connection = ScrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkScrollbar)
		local connection2 = ScrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkScrollbar)
		local connection3 = ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ onScroll ]] -- line: 196
			-- upvalues: ScrollingFrame (copy), v48 (copy)
			if ScrollingFrame.CanvasPosition.Y > 0 then
				v48(true)
			end
		end)

		return function() -- line: 209
			-- upvalues: connection (copy), connection2 (copy), connection3 (copy)
			connection:Disconnect()
			connection2:Disconnect()
			connection3:Disconnect()
		end
	end, { loading })

	local v59 = React.useRef({})
	local v60 = React.useRef(nil)

	React.useEffect(function() -- line: 219
		-- upvalues: v40 (copy), v60 (copy), v59 (copy), scrollToItem (copy), v44 (copy)
		if v40 then
			v60.current = v59.current[v40]
			scrollToItem(v44, v60)

			return
		end

		v60.current = nil
	end, { v40 })
	React.useEffect(function() -- line: 228
		-- upvalues: error (copy), v49 (copy), sendEvent (copy), TelemetryEventType (copy)
		if error and not v49.current then
			v49.current = true
			sendEvent({
				sub_event_type = TelemetryEventType.Error,
				error_detail = {
					error_message = "list: async load failed: " .. error
				}
			})
		end
	end, {
		error,
		sendEvent
	})
	React.useEffect(function() -- line: 238
		-- upvalues: loading (copy), error (copy), data (copy), v50 (copy), sendEvent (copy), TelemetryEventType (copy)
		if not loading and not error and ((data == nil or #data == 0) and not v50.current) then
			v50.current = true
			sendEvent({
				sub_event_type = TelemetryEventType.EmptyState
			})
		end
	end, {
		loading,
		error,
		data,
		sendEvent
	})

	local v61 = t4.variant or "radio"
	local v62 = v61 == "chevron"
	local v63 = React.useCallback(function(s1: string) -- line: 255
		-- upvalues: data (copy), v41 (copy), Dash (copy), sendEvent (copy), TelemetryEventType (copy), v45 (copy), v47 (copy)
		if not data then
			return
		end

		v41(s1)

		local n1 = 0

		Dash.forEach(data, function(p1, p2) -- line: 263
			-- upvalues: s1 (copy), n1 (ref)
			if p1.id == s1 then
				n1 = p2

				return
			end
		end)
		sendEvent({
			sub_event_type = TelemetryEventType.SelectItem,
			select_item_detail = {
				selected_index = n1,
				list_length = #data,
				has_scroll = v45,
				did_scroll = v47
			}
		})
	end, {
		sendEvent,
		v45,
		v47,
		data
	})
	local v64 = React.useCallback(function() -- line: 280
		-- upvalues: data (copy), Dash (copy), v40 (copy), t4 (copy)
		if not data then
			return
		end

		local v74 = Dash.find(data, function(p3) -- line: 285
			-- upvalues: v40 (copy)
			return p3.id == v40
		end)

		if t4.onNext then
			t4.onNext(v40, v74)
		end
	end, {
		data,
		t4.onNext,
		v40
	})

	if loading then
		return React.createElement(ListNodeLoading, {
			body = Body,
			title = t4.title,
			eyebrow = t4.eyebrow,
			tokens = v39
		})
	end

	if error then
		return React.createElement(ListNodeError, {
			body = Body,
			title = t4.title,
			eyebrow = t4.eyebrow,
			errorText = t4.errorText,
			retryButtonText = t4.retryButtonText,
			tokens = v39,
			retry = retry
		})
	end

	return React.createElement(React.Fragment, nil, {
		Content = React.createElement(Body, {
			ref = v44
		}, if data ~= nil and #data ~= 0 then {
			Eyebrow = React.createElement(Eyebrow, {
				eyebrow = t4.eyebrow,
				layoutOrder = 0
			}),
			Title = React.createElement(TextWithTranslation, {
				input = t4.title,
				tag = "size-full-0 auto-y text-heading-medium",
				layoutOrder = 1
			}),
			ItemListContainer = React.createElement(View, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 2
			}, {
				ItemList = React.createElement(List.Root, {
					hasDivider = {
						hasDivider = true,
						isInset = false
					},
					isContained = {
						isContained = false,
						hasMargin = true
					}
				}, { Dash.map(data, function(t5: {[any]: any}, n2: number) -- line: 349
					-- upvalues: React (copy), List (copy), IconName (copy), translateIntoString (copy), v62 (copy), t4 (copy), v63 (copy), t1 (copy), v61 (copy), v40 (copy), v59 (copy)
					return React.createElement(List.Item, {
						leading = if type(t5.leading) ~= "string" then t5.leading else IconName[t5.leading],
						title = translateIntoString(t5.label),
						description = if not t5.description then nil else translateIntoString(t5.description),
						onActivated = {
							onActivated = not v62 and function() -- line: 365
								-- upvalues: v63 (copy), t5 (copy)
								v63(t5.id)
							end or function() -- line: 360
								-- upvalues: t4 (copy), t5 (copy)
								if t4.onNext then
									t4.onNext(t5.id, t5)
								end
							end,
							inputType = t1[v61],
							isChecked = v40 == t5.id
						},
						LayoutOrder = n2,
						ref = function(p4) --[[ ref ]] -- line: 372
							-- upvalues: v59 (copy), t5 (copy)
							v59.current[t5.id] = p4
						end
					})
				end) })
			})
		} else {
			Empty = React.createElement(Empty)
		}),
		Actions = if not t4.onNext or (v62 or v40 == nil) then nil else React.createElement(Actions, nil, {
			Button = React.createElement(Button, {
				text = translateIntoString(t4.nextButtonText),
				variant = ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				isLoading = t4.isSubmitting,
				isDisabled = t4.isSubmitting,
				onActivated = v64
			})
		})
	})
end)
