local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatParent = ExpChat.Parent
local Signals = require(ExpChatParent.Signals)
local tutils = require(ExpChatParent.tutils)
local ExpChatShared = require(ExpChatParent.ExpChatShared)
local EngineFeatureExpChatGlobalChatEngineTelemetryEnabled = require(ExpChat.Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local GetFFlagTextChatEnableUniverseChatTabs = ExpChatShared.Flags.GetFFlagTextChatEnableUniverseChatTabs
local createSignal = Signals.createSignal
local createComputed = Signals.createComputed

local function reorderTabs(t1: {[any]: any}) -- line: 48
	local v12 = table.clone(t1)
	local t2 = {}

	for _, v in pairs(v12) do
		table.insert(t2, v)
	end

	table.sort(t2, function(p1, p2) -- line: 57
		return p1.tabIndex < p2.tabIndex
	end)

	for i, v in ipairs(t2) do
		v12[v.name] = {
			name = v.name,
			tabIndex = i,
			HasUnreadMessages = v.HasUnreadMessages
		}
	end

	return v12
end

return function() --[[ createChannelTabsStore ]] -- line: 93
	-- upvalues: createSignal (copy), createComputed (copy), tutils (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), reorderTabs (copy), EngineFeatureExpChatGlobalChatEngineTelemetryEnabled (copy)
	local t3 = {
		allChannelTabs = {},
		selectedTabName = nil
	}
	local v25, v26 = createSignal(t3)
	local v27 = createComputed(function(p3) -- line: 102
		-- upvalues: v25 (copy)
		return v25(p3).selectedTabName
	end)
	local v28 = createComputed(function(p4) -- line: 107
		-- upvalues: v25 (copy)
		local v33 = v25(p4)
		local t4 = {}

		for k, v in pairs(v33.allChannelTabs) do
			if v.HasUnreadMessages then
				t4[k] = true
			end
		end

		return t4
	end, tutils.deepEqual)

	return {
		getChannelTabsState = v25,
		getSelectedTabName = v27,
		getUnreadChannels = v28,
		handleIncomingOrOutgoingMessage = function(p5, b1: boolean, s1: string?) --[[ handleIncomingOrOutgoingMessage ]] -- line: 120
			-- upvalues: GetFFlagTextChatEnableUniverseChatTabs (copy), v26 (copy)
			if not GetFFlagTextChatEnableUniverseChatTabs() and not p5.TextChannel or b1 then
				return
			end

			local u40 = nil

			if GetFFlagTextChatEnableUniverseChatTabs() then
				if s1 then
					u40 = s1
				else
					if not p5.TextChannel then
						return
					end

					u40 = p5.TextChannel.Name
				end
			end

			v26(function(p6) -- line: 142
				-- upvalues: GetFFlagTextChatEnableUniverseChatTabs (copy), p5 (copy), u40 (ref)
				local v51 = table.clone(p6)

				if not GetFFlagTextChatEnableUniverseChatTabs() then
					local TextChannel = p5.TextChannel

					if TextChannel == nil then
						return p6
					end

					u40 = TextChannel.Name
				end

				if u40 == "RBXSystem" then
					u40 = "RBXGeneral"
				end

				if v51.allChannelTabs[u40] and u40 ~= v51.selectedTabName then
					v51.allChannelTabs = table.clone(v51.allChannelTabs)

					local v53 = table.clone(v51.allChannelTabs[u40])

					v53.HasUnreadMessages = true
					v51.allChannelTabs[u40] = v53
				end

				return v51
			end)
		end,
		setSelectedTab = function(s2: string) --[[ setSelectedTab ]] -- line: 182
			-- upvalues: v26 (copy)
			v26(function(p7) -- line: 183
				-- upvalues: s2 (copy)
				local v58 = table.clone(p7)

				v58.selectedTabName = s2

				if v58.allChannelTabs[s2] then
					v58.allChannelTabs = table.clone(v58.allChannelTabs)

					local v59 = table.clone(v58.allChannelTabs[s2])

					v59.HasUnreadMessages = false
					v58.allChannelTabs[s2] = v59
				end

				return v58
			end)
		end,
		setTargetChannel = function(p8, b2: boolean, s3: string?) --[[ setTargetChannel ]] -- line: 198
			-- upvalues: v26 (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), reorderTabs (copy), EngineFeatureExpChatGlobalChatEngineTelemetryEnabled (copy)
			v26(function(p9) -- line: 199
				-- upvalues: GetFFlagTextChatEnableUniverseChatTabs (copy), s3 (copy), p8 (copy), b2 (copy), reorderTabs (copy), EngineFeatureExpChatGlobalChatEngineTelemetryEnabled (copy)
				local n1 = 0

				for _, _ in pairs(p9.allChannelTabs) do
					n1 += 1
				end

				local v64 = table.clone(p9)

				if GetFFlagTextChatEnableUniverseChatTabs() and s3 then
					local v65 = if not p8 then s3 else p8.Name

					if v65 and v64.allChannelTabs[v65] then
						local v66 = v64.allChannelTabs[v65]
						local tabIndex = v66.tabIndex

						if b2 then
							local v68 = v64.allChannelTabs.RBXGeneral ~= nil
							local v69 = v64.allChannelTabs.RBXGlobal ~= nil

							tabIndex = if v66.name ~= "RBXGeneral" then if v66.name ~= "RBXGlobal" then if not v68 or not v69 then not v68 and not v69 and 1 or 2 else 3 else not v68 and 1 or 2 else 1
						end

						local t5 = {
							name = v66.name,
							tabIndex = tabIndex,
							HasUnreadMessages = false
						}
						local allChannelTabs = v64.allChannelTabs
						local v72 = table.clone(allChannelTabs)

						v72[v66.name] = nil

						local v73 = reorderTabs(v72)
						local v74 = v73

						if GetFFlagTextChatEnableUniverseChatTabs() and b2 and v66.name == "RBXGlobal" and tabIndex == 2 and v73.RBXGeneral ~= nil then
							v74 = table.clone(v73)

							for k, v in pairs(v73) do
								if k ~= "RBXGeneral" and tabIndex <= v.tabIndex then
									local v77 = table.clone(v)

									v77.tabIndex = v.tabIndex + 1
									v74[k] = v77
								end
							end
						end

						local v78 = table.clone(v74)

						v78[t5.name] = t5
						v64.allChannelTabs = reorderTabs(v78)
						v64.selectedTabName = v66.name

						return v64
					end

					v64.selectedTabName = v65 or ""

					return v64
				end

				if p8 and v64.allChannelTabs[p8.Name] then
					local v79 = v64.allChannelTabs[p8.Name]
					local tabIndex = v79.tabIndex

					if b2 then
						local v81 = v64.allChannelTabs.RBXGeneral ~= nil

						tabIndex = if v79.name ~= "RBXGeneral" then not v81 and 1 or 2 else 1
					end

					local t6 = {
						name = v79.name,
						tabIndex = tabIndex,
						HasUnreadMessages = false
					}
					local allChannelTabs = v64.allChannelTabs
					local v84 = table.clone(allChannelTabs)

					v84[v79.name] = nil

					local v85 = reorderTabs(v84)
					local v86 = table.clone(v85)

					v86[t6.name] = t6
					v64.allChannelTabs = reorderTabs(v86)
					v64.selectedTabName = v79.name

					return v64
				end

				if EngineFeatureExpChatGlobalChatEngineTelemetryEnabled then
					if p8 then
						v64.selectedTabName = p8.Name

						return v64
					end

					if not GetFFlagTextChatEnableUniverseChatTabs() then
						v64.selectedTabName = nil

						return v64
					end
				else
					v64.selectedTabName = if not p8 then nil else p8.Name
				end

				return v64
			end)
		end,
		addChannelTab = function(s4: string, n2: number) --[[ addChannelTab ]] -- line: 300
			-- upvalues: v26 (copy), GetFFlagTextChatEnableUniverseChatTabs (copy)
			v26(function(p10) -- line: 301
				-- upvalues: n2 (copy), GetFFlagTextChatEnableUniverseChatTabs (copy), s4 (copy)
				local v88 = table.clone(p10)

				v88.allChannelTabs = table.clone(v88.allChannelTabs)

				local v89 = n2

				if GetFFlagTextChatEnableUniverseChatTabs() and s4 == "RBXGlobal" then
					v89 = not v88.allChannelTabs.RBXGeneral and 1 or 2
				end

				v88.allChannelTabs[s4] = {
					name = s4,
					tabIndex = v89,
					HasUnreadMessages = false
				}

				if GetFFlagTextChatEnableUniverseChatTabs() then
					if not v88.selectedTabName then
						v88.selectedTabName = if not v88.allChannelTabs.RBXGeneral then s4 else "RBXGeneral"

						return v88
					end

					if s4 == "RBXGeneral" and v88.selectedTabName == "RBXGlobal" then
						v88.selectedTabName = "RBXGeneral"

						return v88
					end
				elseif not v88.selectedTabName then
					v88.selectedTabName = s4
				end

				return v88
			end)
		end,
		removeChannelTab = function(s5: string) --[[ removeChannelTab ]] -- line: 330
			-- upvalues: v26 (copy)
			v26(function(p11) -- line: 331
				-- upvalues: s5 (copy)
				local v91 = table.clone(p11)

				v91.allChannelTabs = table.clone(v91.allChannelTabs)
				v91.allChannelTabs[s5] = nil

				if v91.selectedTabName == s5 then
					local n3 = 1e999
					local v93 = nil

					for k, v in pairs(v91.allChannelTabs) do
						if n3 > v.tabIndex then
							n3 = v.tabIndex
							v93 = k
						end
					end

					v91.selectedTabName = v93
				end

				return v91
			end)
		end,
		handleChannelRemoved = function(p12) --[[ handleChannelRemoved ]] -- line: 355
			-- upvalues: v26 (copy), reorderTabs (copy)
			v26(function(p13) -- line: 356
				-- upvalues: p12 (copy), reorderTabs (copy)
				local v97 = p13.allChannelTabs[p12.Name]

				if v97 == nil then
					return p13
				end

				local v98 = table.clone(p13)
				local allChannelTabs = v98.allChannelTabs
				local v100 = table.clone(allChannelTabs)

				v100[v97.name] = nil
				v98.allChannelTabs = reorderTabs(v100)

				if v97.name == v98.selectedTabName then
					v98.selectedTabName = if not v98.allChannelTabs.RBXGeneral then nil else "RBXGeneral"
				end

				if v98.selectedTabName and v98.allChannelTabs[v98.selectedTabName] then
					v98.allChannelTabs = table.clone(v98.allChannelTabs)

					local v101 = table.clone(v98.allChannelTabs[v98.selectedTabName])

					v101.HasUnreadMessages = false
					v98.allChannelTabs[v98.selectedTabName] = v101
				end

				return v98
			end)
		end,
		markChannelUnread = function(s6: string) --[[ markChannelUnread ]] -- line: 169
			-- upvalues: v26 (copy)
			v26(function(p14) -- line: 170
				-- upvalues: s6 (copy)
				local v55 = table.clone(p14)

				if v55.allChannelTabs[s6] and s6 ~= v55.selectedTabName then
					v55.allChannelTabs = table.clone(v55.allChannelTabs)

					local v56 = table.clone(v55.allChannelTabs[s6])

					v56.HasUnreadMessages = true
					v55.allChannelTabs[s6] = v56
				end

				return v55
			end)
		end
	}
end
