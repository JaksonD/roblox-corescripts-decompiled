local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local SocialLibraries = require(AppChat.SocialLibraries)
local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local memo = React.memo
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local Logger = require(script.Parent.Logger)
local presenceSortComparator = SocialLibraries.Utils.presenceSortComparator
local SortedList = SocialLibraries.Components.SortedList
local ParticipantEntryRightFrame = require(script.Parent.ParticipantEntryRightFrame)
local ParticipantEntry = require(script.Parent.ParticipantEntry)
local FFlagAppChatShowInvitedStatusInParticipantList = require(AppChat.Flags).FFlagAppChatShowInvitedStatusInParticipantList
local FFlagDebugAppChatEnableDomLocators = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocators = require(AppChat.Utils.DomLocators)
local getFFlagAppChatParticipantDialogFoundationMenu = require(AppChat.Flags.getFFlagAppChatParticipantDialogFoundationMenu)
local t1 = {
	entries = {},
	entryHeight = 64,
	onEntryActivated = function(_, _) --[[ onEntryActivated ]] -- line: 38
		-- upvalues: Logger (copy)
		Logger:warning("onEntryActivated was not passed to ParticipantList")
	end,
	pendingKey = "Feature.Chat.Label.Pending",
	invitedKey = "Feature.SettingsHub.Label.Invited",
	sortComparator = presenceSortComparator,
	LayoutOrder = 0
}

function ParticipantList(t2: {[any]: any}) -- line: 51
	-- upvalues: Cryo (copy), t1 (copy), getFFlagAppChatParticipantDialogFoundationMenu (copy), React (copy), useLocalization (copy), FFlagAppChatShowInvitedStatusInParticipantList (copy), ParticipantEntry (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy), ParticipantEntryRightFrame (copy), SortedList (copy)
	local v21 = Cryo.Dictionary.join(t1, t2)
	local v22 = v21.onEntryActivated or t1.onEntryActivated
	local v23 = getFFlagAppChatParticipantDialogFoundationMenu()
	local u24 = nil

	if v23 then
		u24 = React.useRef({})
	end

	local v25 = useLocalization({
		pendingLabelText = v21.pendingKey,
		invitedLabelText = v21.invitedKey
	})
	local t3 = {}

	for _, v in pairs(v21.entries) do
		local t4 = {}
		local v30 = not v.isLocalUser
		local v31 = v.metadata and v.metadata.isPending

		if v30 or v31 then
			local t5 = {
				labelText = if not v31 then nil else v25.pendingLabelText,
				shouldShowDots = v30,
				testId = if not FFlagDebugAppChatEnableDomLocators or not v30 then nil else DomLocators.chatDetailsParticipantMoreButton(v.displayName)
			}

			if v23 and v30 then
				local str = tostring(v.id)
				local v34

				if u24 == nil then
					v34 = nil
				else
					if u24.current[str] == nil then
						u24.current[str] = React.createRef()
					end

					v34 = u24.current[str]
				end

				local v35 = v34

				t5.dotsRef = v35

				function t5.onDotsActivated() -- line: 120
					-- upvalues: v22 (copy), v (copy), v35 (copy)
					v22(v, v35)
				end
			else
				t5.dotsRef = nil
				t5.onDotsActivated = nil
			end

			t4.children = {
				rightFrame = React.createElement(ParticipantEntryRightFrame, t5)
			}
		end

		table.insert(t3, Cryo.Dictionary.join(t4, v))
	end

	return React.createElement(SortedList, {
		entries = t3,
		entryHeight = v21.entryHeight,
		renderEntry = function(p3, _) -- line: 77
			-- upvalues: FFlagAppChatShowInvitedStatusInParticipantList (copy), v25 (copy), v23 (copy), u24 (ref), React (copy), v21 (copy), v22 (copy), ParticipantEntry (copy)
			local v39 = FFlagAppChatShowInvitedStatusInParticipantList and (p3.metadata and p3.metadata.isInvited)
			local str = tostring(p3.id)
			local t6 = {
				userId = p3.id,
				statusText = if not v39 then nil else v25.invitedLabelText
			}

			if v23 then
				local v42

				if u24 == nil then
					v42 = nil
				else
					if u24.current[str] == nil then
						u24.current[str] = React.createRef()
					end

					v42 = u24.current[str]
				end

				local v43 = v42

				t6.onActivated = str ~= v21.activeParticipantId and function() -- line: 90
					-- upvalues: v22 (copy), p3 (copy), v43 (copy)
					v22(p3, v43)
				end or nil
			else
				function t6.onActivated() -- line: 94
					-- upvalues: v22 (copy), p3 (copy)
					v22(p3, nil)
				end
			end

			return React.createElement(ParticipantEntry, t6, p3.children)
		end,
		sortComparator = v21.sortComparator,
		LayoutOrder = v21.LayoutOrder
	})
end

return memo(ParticipantList)
