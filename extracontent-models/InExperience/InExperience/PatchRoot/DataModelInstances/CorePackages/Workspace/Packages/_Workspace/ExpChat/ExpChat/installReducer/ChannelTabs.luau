local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v4 = require(l_Parent_0.ExpChatShared);
local v5 = v4.Logger:new("ExpChat/Reducers/" .. script.Name);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v7 = require(l_Actions_0.LocalTextChannelParticipantAdded);
local l_LocalTextChannelParticipantRemoved_0 = v4.Actions.LocalTextChannelParticipantRemoved;
local l_TextChannelRemoved_0 = v4.Actions.TextChannelRemoved;
local l_TargetTextChannelPropertyChanged_0 = v4.Actions.TargetTextChannelPropertyChanged;
local v11 = require(l_Actions_0.IncomingMessageReceived);
local v12 = require(l_Actions_0.UniverseChatSystemMessageAdded);
local v13 = require(l_Actions_0.UniverseChatChannelAdded);
local l_UniverseChatChannelSelected_0 = v4.Actions.UniverseChatChannelSelected;
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = v4.Flags.GetFFlagTextChatEnableUniverseChatTabs;
local v16 = require(l_Actions_0.ChannelTabsConfigurationEnabled);
local v17 = {
    allChannelTabs = {}, 
    selectedTabName = nil, 
    channelTabsConfigurationEnabled = false
};
local function v24(v18, v19) --[[ Line: 39 ]] --[[ Name: insertTabAndReorder ]]
    -- upvalues: l_Dictionary_0 (copy)
    local v20 = {
        [v19.Name] = v19
    };
    for v21, v22 in v18 do
        local v23 = v22.TabIndex < v19.TabIndex and v22.TabIndex or v22.TabIndex + 1;
        v20 = l_Dictionary_0.join(v20, {
            [v21] = l_Dictionary_0.set(v18[v21], "TabIndex", v23)
        });
    end;
    return v20;
end;
local function v31(v25, v26) --[[ Line: 57 ]] --[[ Name: removeTabAndReorder ]]
    -- upvalues: l_Dictionary_0 (copy)
    if v26 == nil then
        return v25;
    else
        local v27 = {};
        for v28, v29 in v25 do
            if v28 ~= v26.Name then
                local v30 = v29.TabIndex < v26.TabIndex and v29.TabIndex or v29.TabIndex - 1;
                v27 = l_Dictionary_0.join(v27, {
                    [v28] = l_Dictionary_0.set(v25[v28], "TabIndex", v30)
                });
            end;
        end;
        return v27;
    end;
end;
local function v37(v32, v33) --[[ Line: 81 ]] --[[ Name: onChannelRemoved ]]
    -- upvalues: v31 (copy), l_Dictionary_0 (copy)
    local v34 = v32.allChannelTabs[v33.Name];
    if v34 == nil then
        return v32;
    else
        local v35 = v31(v32.allChannelTabs, v34);
        local v36 = if v34.Name == v32.selectedTabName then v35.RBXGeneral and "RBXGeneral" or nil else v32.selectedTabName;
        return {
            allChannelTabs = if v36 and v35[v36] then l_Dictionary_0.join(v35, {
                [v36] = l_Dictionary_0.join(v35[v36], {
                    HasUnreadMessages = false
                })
            }) else v35, 
            selectedTabName = v36, 
            channelTabsConfigurationEnabled = v32.channelTabsConfigurationEnabled
        };
    end;
end;
return v2.createReducer(v17, {
    [v16.name] = function(v38, v39) --[[ Line: 107 ]]
        -- upvalues: l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), l_Dictionary_0 (copy)
        if not l_GetFFlagTextChatEnableUniverseChatTabs_0() then
            return v38;
        else
            return l_Dictionary_0.join(v38, {
                channelTabsConfigurationEnabled = v39.enabled
            });
        end;
    end, 
    [v7.name] = function(v40, v41) --[[ Line: 116 ]]
        -- upvalues: v5 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), v24 (copy), l_Dictionary_0 (copy)
        local l_Name_0 = v41.textChannel.Name;
        v5:trace("LocalTextChannelParticipantAdded dispatched: {}", l_Name_0);
        if v40.allChannelTabs[l_Name_0] ~= nil or l_Name_0 == "RBXSystem" then
            return v40;
        elseif l_GetFFlagTextChatEnableUniverseChatTabs_0() and not v40.channelTabsConfigurationEnabled and l_Name_0 ~= "RBXGeneral" then
            return v40;
        else
            local v43 = nil;
            if l_Name_0 == "RBXGeneral" then
                v43 = 1;
            elseif l_GetFFlagTextChatEnableUniverseChatTabs_0() and l_Name_0 == "RBXGlobal" then
                v43 = v40.allChannelTabs.RBXGeneral and 2 or 1;
            else
                local v44 = v40.allChannelTabs.RBXGeneral ~= nil;
                local v45 = l_GetFFlagTextChatEnableUniverseChatTabs_0() and v40.allChannelTabs.RBXGlobal ~= nil;
                v43 = (v44 and 1 or 0) + 1 + (v45 and 1 or 0);
            end;
            local v46 = {
                Name = l_Name_0, 
                HasUnreadMessages = false, 
                TabIndex = v43
            };
            local v47 = v24(v40.allChannelTabs, v46);
            if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
                local l_selectedTabName_0 = v40.selectedTabName;
                if l_selectedTabName_0 == "RBXGlobal" and l_Name_0 == "RBXGeneral" then
                    l_selectedTabName_0 = "RBXGeneral";
                end;
                return l_Dictionary_0.join(v40, {
                    allChannelTabs = v47, 
                    selectedTabName = l_selectedTabName_0
                });
            else
                return l_Dictionary_0.join(v40, {
                    allChannelTabs = v47
                });
            end;
        end;
    end, 
    [l_LocalTextChannelParticipantRemoved_0.name] = function(v49, v50) --[[ Line: 167 ]]
        -- upvalues: v5 (copy), v37 (copy)
        v5:trace("LocalTextChannelParticipantRemoved dispatched: {}", v50.textChannel.Name);
        return (v37(v49, v50.textChannel));
    end, 
    [l_TextChannelRemoved_0.name] = function(v51, v52) --[[ Line: 175 ]]
        -- upvalues: v5 (copy), v37 (copy)
        v5:trace("TextChannelRemoved dispatched: {}", v52.textChannel.Name);
        return (v37(v51, v52.textChannel));
    end, 
    [l_TargetTextChannelPropertyChanged_0.name] = function(v53, v54) --[[ Line: 180 ]]
        -- upvalues: v5 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), l_Dictionary_0 (copy), v24 (copy), v31 (copy)
        v5:trace("TargetTextChannelPropertyChanged dispatched");
        if v54.textChannel and v53.allChannelTabs[v54.textChannel.Name] then
            local v55 = v53.allChannelTabs[v54.textChannel.Name];
            local l_TabIndex_0 = v55.TabIndex;
            if v54.shouldReorderTabs then
                if v55.Name == "RBXGeneral" then
                    l_TabIndex_0 = 1;
                elseif l_GetFFlagTextChatEnableUniverseChatTabs_0() and v55.Name == "RBXGlobal" then
                    l_TabIndex_0 = v53.allChannelTabs.RBXGeneral and 2 or 1;
                else
                    local v57 = v53.allChannelTabs.RBXGeneral ~= nil;
                    local v58 = l_GetFFlagTextChatEnableUniverseChatTabs_0() and v53.allChannelTabs.RBXGlobal ~= nil;
                    l_TabIndex_0 = (v57 and 1 or 0) + 1 + (v58 and 1 or 0);
                end;
            end;
            local v59 = l_Dictionary_0.join(v55, {
                HasUnreadMessages = false, 
                TabIndex = l_TabIndex_0
            });
            return l_Dictionary_0.join(v53, {
                allChannelTabs = v24(v31(v53.allChannelTabs, v55), v59), 
                selectedTabName = v55.Name
            });
        elseif l_GetFFlagTextChatEnableUniverseChatTabs_0() and not v53.channelTabsConfigurationEnabled then
            return v53;
        else
            return l_Dictionary_0.join(v53, {
                selectedTabName = if v54.textChannel then v54.textChannel.Name else nil
            });
        end;
    end, 
    [v11.name] = function(v60, v61) --[[ Line: 225 ]]
        -- upvalues: v5 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), l_Dictionary_0 (copy)
        v5:trace("IncomingMessageReceived dispatched");
        local v62 = nil;
        if l_GetFFlagTextChatEnableUniverseChatTabs_0() and v61.channelNameOverride then
            v62 = v61.channelNameOverride;
        elseif v61.textChatMessage.TextChannel then
            v62 = v61.textChatMessage.TextChannel.Name;
            if v61.textChatMessage.TextChannel.Name == "RBXSystem" then
                v62 = "RBXGeneral";
            end;
        end;
        local v63 = v60.allChannelTabs[v62];
        if v63 == nil then
            return v60;
        elseif v61.isSenderLocalPlayer or v63.Name == v60.selectedTabName then
            return v60;
        else
            return l_Dictionary_0.join(v60, {
                allChannelTabs = l_Dictionary_0.join(v60.allChannelTabs, {
                    [v63.Name] = l_Dictionary_0.join(v63, {
                        HasUnreadMessages = true
                    })
                })
            });
        end;
    end, 
    [v12.name] = function(v64, v65) --[[ Line: 259 ]]
        -- upvalues: l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), l_Dictionary_0 (copy)
        if not l_GetFFlagTextChatEnableUniverseChatTabs_0() then
            return v64;
        else
            local l_channelNameOverride_0 = v65.channelNameOverride;
            local v67 = v64.allChannelTabs[l_channelNameOverride_0];
            if v67 == nil then
                return v64;
            elseif v67.Name == v64.selectedTabName then
                return v64;
            else
                return l_Dictionary_0.join(v64, {
                    allChannelTabs = l_Dictionary_0.join(v64.allChannelTabs, {
                        [v67.Name] = l_Dictionary_0.join(v67, {
                            HasUnreadMessages = true
                        })
                    })
                });
            end;
        end;
    end, 
    [v13.name] = function(v68, v69) --[[ Line: 283 ]]
        -- upvalues: v5 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), v24 (copy), l_Dictionary_0 (copy)
        v5:trace("UniverseChatChannelAdded dispatched: {}", v69.channelName);
        if v68.allChannelTabs[v69.channelName] ~= nil then
            return v68;
        else
            local l_tabIndex_0 = v69.tabIndex;
            if l_GetFFlagTextChatEnableUniverseChatTabs_0() and v69.channelName == "RBXGlobal" then
                l_tabIndex_0 = v68.allChannelTabs.RBXGeneral and 2 or 1;
            end;
            local v71 = {
                Name = v69.channelName, 
                HasUnreadMessages = false, 
                TabIndex = l_tabIndex_0
            };
            local v72 = v24(v68.allChannelTabs, v71);
            local v73 = nil;
            if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
                v73 = v68.selectedTabName;
                if v73 == nil then
                    v73 = v72.RBXGeneral and "RBXGeneral" or v69.channelName;
                end;
            else
                v73 = v68.selectedTabName or v69.channelName;
            end;
            return l_Dictionary_0.join(v68, {
                allChannelTabs = v72, 
                selectedTabName = v73
            });
        end;
    end, 
    [l_UniverseChatChannelSelected_0.name] = function(v74, v75) --[[ Line: 318 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy)
        v5:trace("UniverseChatChannelSelected dispatched: {}", v75.channelName);
        local v76 = v74.allChannelTabs[v75.channelName];
        if v76 == nil then
            return l_Dictionary_0.join(v74, {
                selectedTabName = v75.channelName
            });
        else
            return l_Dictionary_0.join(v74, {
                allChannelTabs = l_Dictionary_0.join(v74.allChannelTabs, {
                    [v75.channelName] = l_Dictionary_0.join(v76, {
                        HasUnreadMessages = false
                    })
                }), 
                selectedTabName = v75.channelName
            });
        end;
    end
});