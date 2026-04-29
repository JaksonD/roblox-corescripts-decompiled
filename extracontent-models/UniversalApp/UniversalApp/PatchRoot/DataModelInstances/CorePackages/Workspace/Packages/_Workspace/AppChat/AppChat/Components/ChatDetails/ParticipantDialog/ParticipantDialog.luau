local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent

require(AppChat.types)

local Foundation = require(AppChatParent.Foundation)
local Logger = require(script.Parent.Logger)
local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local memo = React.memo
local useLayerCollector = require(AppChatParent.UIBlox).Core.Layout.LayerCollector.useLayerCollector
local useTelemetry = require(AppChat.Telemetry.useTelemetry)
local ChatDetailsTelemetryEvents = require(AppChat.Components.ChatDetails.ChatDetailsTelemetryEvents)
local ChatDialogTelemetryLayer = require(AppChat.Telemetry.Layers.ChatDialogTelemetryLayer)
local Menu = Foundation.Menu
local PopoverAlign = Foundation.Enums.PopoverAlign
local PopoverSide = Foundation.Enums.PopoverSide
local InputSize = Foundation.Enums.InputSize
local uDim = UDim.new(0, 400)
local t1 = {
	conversationId = nil,
	participantId = nil,
	anchorRef = nil,
	showRemoveUserButton = false,
	showViewProfileButton = true,
	showChatButton = false,
	showTrustedFriendButton = false,
	isWideMode = false,
	unitTestScreenSize = nil,
	viewProfileText = "localizedText.ViewProfile",
	chatText = "localizedText.Chat",
	reportUserText = "localizedText.ReportUser",
	removeFromGroupText = "localizedText.RemoveFromGroup",
	trustedFriendText = "localizedText.AddTrustedFriend",
	isTrustedFriendButtonDisabled = false,
	openViewProfile = function(_) --[[ openViewProfile ]] -- line: 73
		-- upvalues: Logger (copy)
		Logger:warning("openViewProfile was not passed to ParticipantDialog")
	end,
	openChat = function(...) --[[ openChat ]] -- line: 76
		-- upvalues: Logger (copy)
		Logger:warning("openChat was not passed to ParticipantDialog")
	end,
	openReportUser = function(...) --[[ openReportUser ]] -- line: 79
		-- upvalues: Logger (copy)
		Logger:warning("openReportUser was not passed to ParticipantDialog")
	end,
	openRemoveUserDialog = function(...) --[[ openRemoveUserDialog ]] -- line: 82
		-- upvalues: Logger (copy)
		Logger:warning("openRemoveUserDialog was not passed to ParticipantDialog")
	end,
	openTrustedFriend = function(...) --[[ openTrustedFriend ]] -- line: 85
		-- upvalues: Logger (copy)
		Logger:warning("openTrustedFriend was not passed to ParticipantDialog")
	end,
	onDismiss = function(_) --[[ onDismiss ]] -- line: 88
		-- upvalues: Logger (copy)
		Logger:warning("onDismiss was not passed to ParticipantDialog")
	end
}

function ParticipantDialog(t2: {[any]: any}) -- line: 95
	-- upvalues: Cryo (copy), t1 (copy), useTelemetry (copy), ChatDialogTelemetryLayer (copy), React (copy), useLayerCollector (copy), Logger (copy), ChatDetailsTelemetryEvents (copy), PopoverSide (copy), Menu (copy), PopoverAlign (copy), InputSize (copy), uDim (copy), Foundation (copy)
	local v21 = Cryo.Dictionary.join(t1, t2)
	local v22 = useTelemetry(ChatDialogTelemetryLayer.Context)
	local v23 = React.useRef(nil)
	local v24 = useLayerCollector()
	local v25, v26 = React.useState(true)
	local conversationId = v21.conversationId
	local participantId = v21.participantId
	local showRemoveUserButton = v21.showRemoveUserButton
	local v30 = v21.unitTestScreenSize or v24.absoluteSize
	local v31 = if not v21.anchorRef or not v21.anchorRef.current then nil else v21.anchorRef
	local v32 = v21.onDismiss or function() -- line: 106
	end

	local function v33() -- line: 108
		-- upvalues: v26 (copy), v32 (copy)
		v26(false)
		v32()
	end

	local v34 = React.useRef(false)
	local t3 = {}

	if v21.showViewProfileButton then
		local function v36() -- line: 145
			-- upvalues: Logger (copy), participantId (copy), v21 (copy)
			Logger:info("User activated viewProfile | userId: {}", participantId)
			v21.openViewProfile(participantId)
		end

		table.insert(t3, {
			text = v21.viewProfileText,
			isDisabled = nil,
			onActivated = function() -- line: 130
				-- upvalues: v34 (copy), v26 (copy), v36 (copy)
				if v34.current then
					return
				end

				v34.current = true
				v26(false)

				if v36 then
					v36()
				end
			end
		})
	end

	if v21.showTrustedFriendButton then
		local trustedFriendText = v21.trustedFriendText

		local function v38() -- line: 152
			-- upvalues: Logger (copy), participantId (copy), v21 (copy)
			Logger:info("User activated openTrustedFriend | userId: {}", participantId)
			v21.openTrustedFriend(participantId)
		end

		local isTrustedFriendButtonDisabled = v21.isTrustedFriendButtonDisabled

		table.insert(t3, {
			text = trustedFriendText,
			isDisabled = isTrustedFriendButtonDisabled,
			onActivated = not isTrustedFriendButtonDisabled and function() -- line: 130
				-- upvalues: v34 (copy), v26 (copy), v38 (copy)
				if v34.current then
					return
				end

				v34.current = true
				v26(false)

				if v38 then
					v38()
				end
			end or function() --[[ onDisabledActivated ]] -- line: 120
			end
		})
	end

	if v21.showChatButton then
		local function v40() -- line: 159
			-- upvalues: Logger (copy), participantId (copy), v22 (copy), ChatDetailsTelemetryEvents (copy), v21 (copy)
			Logger:info("User activated openChat | userId: {}", participantId)
			v22.emit(ChatDetailsTelemetryEvents.ParticipantDialogChatClicked, {})
			v21.openChat(participantId)
		end

		table.insert(t3, {
			text = v21.chatText,
			isDisabled = nil,
			onActivated = function() -- line: 130
				-- upvalues: v34 (copy), v26 (copy), v40 (copy)
				if v34.current then
					return
				end

				v34.current = true
				v26(false)

				if v40 then
					v40()
				end
			end
		})
	end

	local function v41() -- line: 166
		-- upvalues: Logger (copy), participantId (copy), conversationId (copy), v22 (copy), ChatDetailsTelemetryEvents (copy), v21 (copy)
		Logger:info("User activated reportUser | userId: {}, conversationId: {}", participantId, conversationId)
		v22.emit(ChatDetailsTelemetryEvents.ParticipantDialogReportUserClicked, {})
		v21.openReportUser(participantId, conversationId)
	end

	table.insert(t3, {
		text = v21.reportUserText,
		isDisabled = nil,
		onActivated = function() -- line: 130
			-- upvalues: v34 (copy), v26 (copy), v41 (copy)
			if v34.current then
				return
			end

			v34.current = true
			v26(false)

			if v41 then
				v41()
			end
		end
	})

	if showRemoveUserButton then
		local function v42() -- line: 173
			-- upvalues: v21 (copy), participantId (copy), conversationId (copy)
			v21.openRemoveUserDialog(participantId, conversationId)
		end

		table.insert(t3, {
			text = v21.removeFromGroupText,
			isDisabled = nil,
			onActivated = function() -- line: 130
				-- upvalues: v34 (copy), v26 (copy), v42 (copy)
				if v34.current then
					return
				end

				v34.current = true
				v26(false)

				if v42 then
					v42()
				end
			end
		})
	end

	if v31 then
		local AbsolutePosition = v31.current.AbsolutePosition
		local AbsoluteSize = v31.current.AbsoluteSize
		local v45 = if not (AbsolutePosition.Y + AbsoluteSize.Y / 2 > v30.Y / 2) then PopoverSide.Bottom else PopoverSide.Top

		return (React.createElement(Menu, {
			align = PopoverAlign.End,
			anchorRef = v31,
			isOpen = v25,
			items = t3,
			onPressedOutside = v33,
			side = v45,
			size = InputSize.Medium,
			width = if not v21.isWideMode then nil else uDim
		}))
	end

	return React.createElement(Foundation.View, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1
	}, {
		MenuAnchor = React.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0.5, 0, 1, -10),
			Size = UDim2.fromOffset(400, 1),
			ref = v23
		}),
		Menu = React.createElement(Menu, {
			align = PopoverAlign.Center,
			anchorRef = v23,
			isOpen = v25,
			items = t3,
			onPressedOutside = v33,
			side = PopoverSide.Top,
			size = InputSize.Medium,
			width = if not v21.isWideMode then nil else uDim
		})
	})
end

return memo(ParticipantDialog)
