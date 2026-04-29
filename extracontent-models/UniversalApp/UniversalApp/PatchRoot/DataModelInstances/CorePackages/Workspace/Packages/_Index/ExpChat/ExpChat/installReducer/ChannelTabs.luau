local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatParent = ExpChat.Parent
local Rodux = require(ExpChatParent.Rodux)
local Dictionary = require(ExpChatParent.llama).Dictionary
local ExpChatShared = require(ExpChatParent.ExpChatShared)
local v6 = ExpChatShared.Logger:new("ExpChat/Reducers/" .. script.Name)
local Actions = ExpChat.Actions
local LocalTextChannelParticipantAdded = require(Actions.LocalTextChannelParticipantAdded)
local LocalTextChannelParticipantRemoved = ExpChatShared.Actions.LocalTextChannelParticipantRemoved
local TextChannelRemoved = ExpChatShared.Actions.TextChannelRemoved
local TargetTextChannelPropertyChanged = ExpChatShared.Actions.TargetTextChannelPropertyChanged
local IncomingMessageReceived = require(Actions.IncomingMessageReceived)
local UniverseChatSystemMessageAdded = require(Actions.UniverseChatSystemMessageAdded)
local UniverseChatChannelAdded = require(Actions.UniverseChatChannelAdded)
local UniverseChatChannelSelected = ExpChatShared.Actions.UniverseChatChannelSelected
local GetFFlagTextChatEnableUniverseChatTabs = ExpChatShared.Flags.GetFFlagTextChatEnableUniverseChatTabs
local GetFFlagExpChatSuppressWelcomeMessageTabUnread = ExpChatShared.Flags.GetFFlagExpChatSuppressWelcomeMessageTabUnread
local ChannelTabsConfigurationEnabled = require(Actions.ChannelTabsConfigurationEnabled)
local shouldSuppressUnreadForTabMetadata = require(ExpChat.shouldSuppressUnreadForTabMetadata)
local t1 = {
	allChannelTabs = {},
	selectedTabName = nil,
	channelTabsConfigurationEnabled = false
}

local function insertTabAndReorder(t2: {[any]: any}, t3: {[any]: any}) -- line: 42
	-- upvalues: Dictionary (copy)
	local t4 = {
		[t3.Name] = t3
	}

	for v27, v28 in t2 do
		local v29 = v28.TabIndex < t3.TabIndex and v28.TabIndex or v28.TabIndex + 1

		t4 = Dictionary.join(t4, {
			[v27] = Dictionary.set(t2[v27], "TabIndex", v29)
		})
	end

	return t4
end
local function removeTabAndReorder(t5: {[any]: any}, t6: {[any]: any}) -- line: 60
	-- upvalues: Dictionary (copy)
	if t6 == nil then
		return t5
	end

	local t7 = {}

	for v33, v34 in t5 do
		if v33 ~= t6.Name then
			local v35 = v34.TabIndex < t6.TabIndex and v34.TabIndex or v34.TabIndex - 1

			t7 = Dictionary.join(t7, {
				[v33] = Dictionary.set(t5[v33], "TabIndex", v35)
			})
		end
	end

	return t7
end
local function onChannelRemoved(t8: {[any]: any}, p1) -- line: 84
	-- upvalues: removeTabAndReorder (copy), Dictionary (copy)
	local v38 = t8.allChannelTabs[p1.Name]

	if v38 == nil then
		return t8
	end

	local v39 = removeTabAndReorder(t8.allChannelTabs, v38)
	local v40 = if v38.Name ~= t8.selectedTabName then t8.selectedTabName else if not v39.RBXGeneral then nil else "RBXGeneral"

	return {
		allChannelTabs = if not (v40 and v39[v40]) then v39 else Dictionary.join(v39, {
			[v40] = Dictionary.join(v39[v40], {
				HasUnreadMessages = false
			})
		}),
		selectedTabName = v40,
		channelTabsConfigurationEnabled = t8.channelTabsConfigurationEnabled
	}
end

return Rodux.createReducer(t1, {
	[ChannelTabsConfigurationEnabled.name] = function(t9: {[any]: any}, p2) -- line: 110
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabs (copy), Dictionary (copy)
		if not GetFFlagTextChatEnableUniverseChatTabs() then
			return t9
		end

		return Dictionary.join(t9, {
			channelTabsConfigurationEnabled = p2.enabled
		})
	end,
	[LocalTextChannelParticipantAdded.name] = function(t10: {[any]: any}, p3) -- line: 119
		-- upvalues: v6 (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), insertTabAndReorder (copy), Dictionary (copy)
		local textChannelName = p3.textChannel.Name

		v6:trace("LocalTextChannelParticipantAdded dispatched: {}", textChannelName)

		if t10.allChannelTabs[textChannelName] ~= nil or textChannelName == "RBXSystem" then
			return t10
		end

		if GetFFlagTextChatEnableUniverseChatTabs() and not t10.channelTabsConfigurationEnabled and textChannelName ~= "RBXGeneral" then
			return t10
		end

		local n1

		if textChannelName == "RBXGeneral" then
			n1 = 1
		elseif GetFFlagTextChatEnableUniverseChatTabs() and textChannelName == "RBXGlobal" then
			n1 = not t10.allChannelTabs.RBXGeneral and 1 or 2
		else
			local v47 = t10.allChannelTabs.RBXGeneral ~= nil
			local v48 = GetFFlagTextChatEnableUniverseChatTabs() and t10.allChannelTabs.RBXGlobal ~= nil

			n1 = (not v47 and 0 or 1) + 1 + (not v48 and 0 or 1)
		end

		local t11 = {
			Name = textChannelName,
			HasUnreadMessages = false,
			TabIndex = n1
		}
		local v50 = insertTabAndReorder(t10.allChannelTabs, t11)

		if GetFFlagTextChatEnableUniverseChatTabs() then
			local selectedTabName = t10.selectedTabName

			if selectedTabName == "RBXGlobal" and textChannelName == "RBXGeneral" then
				selectedTabName = "RBXGeneral"
			end

			return Dictionary.join(t10, {
				allChannelTabs = v50,
				selectedTabName = selectedTabName
			})
		end

		return Dictionary.join(t10, {
			allChannelTabs = v50
		})
	end,
	[LocalTextChannelParticipantRemoved.name] = function(t12: {[any]: any}, p4) -- line: 170
		-- upvalues: v6 (copy), onChannelRemoved (copy)
		v6:trace("LocalTextChannelParticipantRemoved dispatched: {}", p4.textChannel.Name)

		return (onChannelRemoved(t12, p4.textChannel))
	end,
	[TextChannelRemoved.name] = function(t13: {[any]: any}, p5) -- line: 178
		-- upvalues: v6 (copy), onChannelRemoved (copy)
		v6:trace("TextChannelRemoved dispatched: {}", p5.textChannel.Name)

		return (onChannelRemoved(t13, p5.textChannel))
	end,
	[TargetTextChannelPropertyChanged.name] = function(t14: {[any]: any}, p6) -- line: 183
		-- upvalues: v6 (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), Dictionary (copy), insertTabAndReorder (copy), removeTabAndReorder (copy)
		v6:trace("TargetTextChannelPropertyChanged dispatched")

		if p6.textChannel and t14.allChannelTabs[p6.textChannel.Name] then
			local v58 = t14.allChannelTabs[p6.textChannel.Name]
			local TabIndex = v58.TabIndex

			if p6.shouldReorderTabs then
				if v58.Name == "RBXGeneral" then
					TabIndex = 1
				elseif GetFFlagTextChatEnableUniverseChatTabs() and v58.Name == "RBXGlobal" then
					TabIndex = not t14.allChannelTabs.RBXGeneral and 1 or 2
				else
					local v60 = t14.allChannelTabs.RBXGeneral ~= nil
					local v61 = GetFFlagTextChatEnableUniverseChatTabs() and t14.allChannelTabs.RBXGlobal ~= nil

					TabIndex = (not v60 and 0 or 1) + 1 + (not v61 and 0 or 1)
				end
			end

			local v62 = Dictionary.join(v58, {
				HasUnreadMessages = false,
				TabIndex = TabIndex
			})

			return Dictionary.join(t14, {
				allChannelTabs = insertTabAndReorder(removeTabAndReorder(t14.allChannelTabs, v58), v62),
				selectedTabName = v58.Name
			})
		end

		if GetFFlagTextChatEnableUniverseChatTabs() and not t14.channelTabsConfigurationEnabled then
			return t14
		end

		return Dictionary.join(t14, {
			selectedTabName = if not p6.textChannel then nil else p6.textChannel.Name
		})
	end,
	[IncomingMessageReceived.name] = function(t15: {[any]: any}, p7) -- line: 228
		-- upvalues: v6 (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), GetFFlagExpChatSuppressWelcomeMessageTabUnread (copy), shouldSuppressUnreadForTabMetadata (copy), Dictionary (copy)
		v6:trace("IncomingMessageReceived dispatched")

		local channelNameOverride = nil

		if GetFFlagTextChatEnableUniverseChatTabs() and p7.channelNameOverride then
			channelNameOverride = p7.channelNameOverride
		elseif p7.textChatMessage.TextChannel then
			channelNameOverride = p7.textChatMessage.TextChannel.Name

			if p7.textChatMessage.TextChannel.Name == "RBXSystem" then
				channelNameOverride = "RBXGeneral"
			end
		end

		local v66 = t15.allChannelTabs[channelNameOverride]

		if v66 == nil then
			return t15
		end

		if p7.isSenderLocalPlayer or v66.Name == t15.selectedTabName then
			return t15
		end

		if GetFFlagExpChatSuppressWelcomeMessageTabUnread() and shouldSuppressUnreadForTabMetadata(p7.textChatMessage.Metadata) then
			return t15
		end

		return Dictionary.join(t15, {
			allChannelTabs = Dictionary.join(t15.allChannelTabs, {
				[v66.Name] = Dictionary.join(v66, {
					HasUnreadMessages = true
				})
			})
		})
	end,
	[UniverseChatSystemMessageAdded.name] = function(t16: {[any]: any}, p8) -- line: 269
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabs (copy), GetFFlagExpChatSuppressWelcomeMessageTabUnread (copy), shouldSuppressUnreadForTabMetadata (copy), Dictionary (copy)
		if not GetFFlagTextChatEnableUniverseChatTabs() then
			return t16
		end

		local channelNameOverride = p8.channelNameOverride
		local v70 = t16.allChannelTabs[channelNameOverride]

		if v70 == nil then
			return t16
		end

		if v70.Name == t16.selectedTabName then
			return t16
		end

		if GetFFlagExpChatSuppressWelcomeMessageTabUnread() and shouldSuppressUnreadForTabMetadata(p8.metadata or "") then
			return t16
		end

		return Dictionary.join(t16, {
			allChannelTabs = Dictionary.join(t16.allChannelTabs, {
				[v70.Name] = Dictionary.join(v70, {
					HasUnreadMessages = true
				})
			})
		})
	end,
	[UniverseChatChannelAdded.name] = function(t17: {[any]: any}, p9) -- line: 300
		-- upvalues: v6 (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), insertTabAndReorder (copy), Dictionary (copy)
		v6:trace("UniverseChatChannelAdded dispatched: {}", p9.channelName)

		if t17.allChannelTabs[p9.channelName] ~= nil then
			return t17
		end

		local tabIndex = p9.tabIndex

		if GetFFlagTextChatEnableUniverseChatTabs() and p9.channelName == "RBXGlobal" then
			tabIndex = not t17.allChannelTabs.RBXGeneral and 1 or 2
		end

		local t18 = {
			Name = p9.channelName,
			HasUnreadMessages = false,
			TabIndex = tabIndex
		}
		local v75 = insertTabAndReorder(t17.allChannelTabs, t18)
		local selectedTabName

		if GetFFlagTextChatEnableUniverseChatTabs() then
			selectedTabName = t17.selectedTabName

			if selectedTabName == nil then
				selectedTabName = if not v75.RBXGeneral then p9.channelName else "RBXGeneral"
			end
		else
			selectedTabName = t17.selectedTabName or p9.channelName
		end

		return Dictionary.join(t17, {
			allChannelTabs = v75,
			selectedTabName = selectedTabName
		})
	end,
	[UniverseChatChannelSelected.name] = function(t19: {[any]: any}, p10) -- line: 335
		-- upvalues: v6 (copy), Dictionary (copy)
		v6:trace("UniverseChatChannelSelected dispatched: {}", p10.channelName)

		local v79 = t19.allChannelTabs[p10.channelName]

		if v79 == nil then
			return Dictionary.join(t19, {
				selectedTabName = p10.channelName
			})
		end

		return Dictionary.join(t19, {
			allChannelTabs = Dictionary.join(t19.allChannelTabs, {
				[p10.channelName] = Dictionary.join(v79, {
					HasUnreadMessages = false
				})
			}),
			selectedTabName = p10.channelName
		})
	end
})
