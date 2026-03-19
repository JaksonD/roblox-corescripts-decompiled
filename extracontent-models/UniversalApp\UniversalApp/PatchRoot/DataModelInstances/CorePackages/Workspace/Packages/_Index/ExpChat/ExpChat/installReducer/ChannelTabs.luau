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
local v12 = {
    allChannelTabs = {}, 
    selectedTabName = nil
};
local function v19(v13, v14) --[[ Line: 30 ]] --[[ Name: insertTabAndReorder ]]
    -- upvalues: l_Dictionary_0 (copy)
    local v15 = {
        [v14.Name] = v14
    };
    for v16, v17 in v13 do
        local v18 = v17.TabIndex < v14.TabIndex and v17.TabIndex or v17.TabIndex + 1;
        v15 = l_Dictionary_0.join(v15, {
            [v16] = l_Dictionary_0.set(v13[v16], "TabIndex", v18)
        });
    end;
    return v15;
end;
local function v26(v20, v21) --[[ Line: 48 ]] --[[ Name: removeTabAndReorder ]]
    -- upvalues: l_Dictionary_0 (copy)
    if v21 == nil then
        return v20;
    else
        local v22 = {};
        for v23, v24 in v20 do
            if v23 ~= v21.Name then
                local v25 = v24.TabIndex < v21.TabIndex and v24.TabIndex or v24.TabIndex - 1;
                v22 = l_Dictionary_0.join(v22, {
                    [v23] = l_Dictionary_0.set(v20[v23], "TabIndex", v25)
                });
            end;
        end;
        return v22;
    end;
end;
local function v32(v27, v28) --[[ Line: 72 ]] --[[ Name: onChannelRemoved ]]
    -- upvalues: v26 (copy), l_Dictionary_0 (copy)
    local v29 = v27.allChannelTabs[v28.Name];
    if v29 == nil then
        return v27;
    else
        local v30 = v26(v27.allChannelTabs, v29);
        local v31 = if v29.Name == v27.selectedTabName then v30.RBXGeneral and "RBXGeneral" or nil else v27.selectedTabName;
        return {
            allChannelTabs = if v31 and v30[v31] then l_Dictionary_0.join(v30, {
                [v31] = l_Dictionary_0.join(v30[v31], {
                    HasUnreadMessages = false
                })
            }) else v30, 
            selectedTabName = v31
        };
    end;
end;
return v2.createReducer(v12, {
    [v7.name] = function(v33, v34) --[[ Line: 97 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy), v19 (copy)
        local l_Name_0 = v34.textChannel.Name;
        v5:trace("LocalTextChannelParticipantAdded dispatched: {}", l_Name_0);
        if v33.allChannelTabs[l_Name_0] ~= nil or l_Name_0 == "RBXSystem" then
            return v33;
        else
            local v36 = {
                Name = l_Name_0, 
                HasUnreadMessages = false, 
                TabIndex = v33.allChannelTabs.RBXGeneral ~= nil and l_Name_0 ~= "RBXGeneral" and 2 or 1
            };
            return l_Dictionary_0.join(v33, {
                allChannelTabs = v19(v33.allChannelTabs, v36)
            });
        end;
    end, 
    [l_LocalTextChannelParticipantRemoved_0.name] = function(v37, v38) --[[ Line: 117 ]]
        -- upvalues: v5 (copy), v32 (copy)
        v5:trace("LocalTextChannelParticipantRemoved dispatched: {}", v38.textChannel.Name);
        return (v32(v37, v38.textChannel));
    end, 
    [l_TextChannelRemoved_0.name] = function(v39, v40) --[[ Line: 125 ]]
        -- upvalues: v5 (copy), v32 (copy)
        v5:trace("TextChannelRemoved dispatched: {}", v40.textChannel.Name);
        return (v32(v39, v40.textChannel));
    end, 
    [l_TargetTextChannelPropertyChanged_0.name] = function(v41, v42) --[[ Line: 130 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy), v19 (copy), v26 (copy)
        v5:trace("TargetTextChannelPropertyChanged dispatched");
        if v42.textChannel and v41.allChannelTabs[v42.textChannel.Name] then
            local v43 = v41.allChannelTabs[v42.textChannel.Name];
            local l_TabIndex_0 = v43.TabIndex;
            if v42.shouldReorderTabs then
                l_TabIndex_0 = v41.allChannelTabs.RBXGeneral ~= nil and v43.Name ~= "RBXGeneral" and 2 or 1;
            end;
            local v45 = l_Dictionary_0.join(v43, {
                HasUnreadMessages = false, 
                TabIndex = l_TabIndex_0
            });
            return l_Dictionary_0.join(v41, {
                allChannelTabs = v19(v26(v41.allChannelTabs, v43), v45), 
                selectedTabName = v43.Name
            });
        else
            return l_Dictionary_0.join(v41, {
                selectedTabName = if v42.textChannel then v42.textChannel.Name else nil
            });
        end;
    end, 
    [v11.name] = function(v46, v47) --[[ Line: 163 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy)
        v5:trace("IncomingMessageReceived dispatched");
        local v48 = nil;
        if v47.textChatMessage.TextChannel then
            v48 = v47.textChatMessage.TextChannel.Name;
            if v47.textChatMessage.TextChannel.Name == "RBXSystem" then
                v48 = "RBXGeneral";
            end;
        end;
        local v49 = v46.allChannelTabs[v48];
        if v49 == nil then
            return v46;
        elseif v47.isSenderLocalPlayer or v49.Name == v46.selectedTabName then
            return v46;
        else
            return l_Dictionary_0.join(v46, {
                allChannelTabs = l_Dictionary_0.join(v46.allChannelTabs, {
                    [v49.Name] = l_Dictionary_0.join(v49, {
                        HasUnreadMessages = true
                    })
                })
            });
        end;
    end
});