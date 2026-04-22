local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(l_Parent_0.tutils);
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = require(l_Parent_0.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs;
local l_createSignal_0 = v1.createSignal;
local l_createComputed_0 = v1.createComputed;
local function v15(v6) --[[ Line: 46 ]] --[[ Name: reorderTabs ]]
    local v7 = table.clone(v6);
    local v8 = {};
    for _, v10 in pairs(v7) do
        table.insert(v8, v10);
    end;
    table.sort(v8, function(v11, v12) --[[ Line: 55 ]]
        return v11.tabIndex < v12.tabIndex;
    end);
    for v13, v14 in ipairs(v8) do
        v7[v14.name] = {
            name = v14.name, 
            tabIndex = v13, 
            HasUnreadMessages = v14.HasUnreadMessages
        };
    end;
    return v7;
end;
local function _(v16, v17) --[[ Line: 71 ]] --[[ Name: insertTabAndReorder ]]
    -- upvalues: v15 (copy)
    local v18 = table.clone(v16);
    v18[v17.name] = v17;
    return (v15(v18));
end;
local function _(v20, v21) --[[ Line: 81 ]] --[[ Name: removeTabAndReorder ]]
    -- upvalues: v15 (copy)
    local v22 = table.clone(v20);
    v22[v21.name] = nil;
    return (v15(v22));
end;
return function() --[[ Line: 91 ]] --[[ Name: createChannelTabsStore ]]
    -- upvalues: l_createSignal_0 (copy), l_createComputed_0 (copy), v2 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), v15 (copy)
    local v24 = {
        allChannelTabs = {}, 
        selectedTabName = nil
    };
    local v25, v26 = l_createSignal_0(v24);
    local v28 = l_createComputed_0(function(v27) --[[ Line: 100 ]]
        -- upvalues: v25 (copy)
        return v25(v27).selectedTabName;
    end);
    local v34 = l_createComputed_0(function(v29) --[[ Line: 105 ]]
        -- upvalues: v25 (copy)
        local v30 = v25(v29);
        local v31 = {};
        for v32, v33 in pairs(v30.allChannelTabs) do
            if v33.HasUnreadMessages then
                v31[v32] = true;
            end;
        end;
        return v31;
    end, v2.deepEqual);
    local function v43(v35, v36, v37) --[[ Line: 118 ]] --[[ Name: handleIncomingOrOutgoingMessage ]]
        -- upvalues: l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v26 (copy)
        if not l_GetFFlagTextChatEnableUniverseChatTabs_0() and not v35.TextChannel or v36 then
            return;
        else
            local v38 = nil;
            if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
                if v37 then
                    v38 = v37;
                elseif v35.TextChannel then
                    v38 = v35.TextChannel.Name;
                else
                    return;
                end;
            end;
            v26(function(v39) --[[ Line: 140 ]]
                -- upvalues: l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v35 (copy), v38 (ref)
                local v40 = table.clone(v39);
                if not l_GetFFlagTextChatEnableUniverseChatTabs_0() then
                    local l_TextChannel_0 = v35.TextChannel;
                    if l_TextChannel_0 == nil then
                        return v39;
                    else
                        v38 = l_TextChannel_0.Name;
                    end;
                end;
                if v38 == "RBXSystem" then
                    v38 = "RBXGeneral";
                end;
                if v40.allChannelTabs[v38] and v38 ~= v40.selectedTabName then
                    v40.allChannelTabs = table.clone(v40.allChannelTabs);
                    local v42 = table.clone(v40.allChannelTabs[v38]);
                    v42.HasUnreadMessages = true;
                    v40.allChannelTabs[v38] = v42;
                end;
                return v40;
            end);
            return;
        end;
    end;
    local function v48(v44) --[[ Line: 167 ]] --[[ Name: markChannelUnread ]]
        -- upvalues: v26 (copy)
        v26(function(v45) --[[ Line: 168 ]]
            -- upvalues: v44 (copy)
            local v46 = table.clone(v45);
            if v46.allChannelTabs[v44] and v44 ~= v46.selectedTabName then
                v46.allChannelTabs = table.clone(v46.allChannelTabs);
                local v47 = table.clone(v46.allChannelTabs[v44]);
                v47.HasUnreadMessages = true;
                v46.allChannelTabs[v44] = v47;
            end;
            return v46;
        end);
    end;
    local function v53(v49) --[[ Line: 180 ]] --[[ Name: setSelectedTab ]]
        -- upvalues: v26 (copy)
        v26(function(v50) --[[ Line: 181 ]]
            -- upvalues: v49 (copy)
            local v51 = table.clone(v50);
            v51.selectedTabName = v49;
            if v51.allChannelTabs[v49] then
                v51.allChannelTabs = table.clone(v51.allChannelTabs);
                local v52 = table.clone(v51.allChannelTabs[v49]);
                v52.HasUnreadMessages = false;
                v51.allChannelTabs[v49] = v52;
            end;
            return v51;
        end);
    end;
    local function v82(v54, v55, v56) --[[ Line: 196 ]] --[[ Name: setTargetChannel ]]
        -- upvalues: v26 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v15 (ref)
        v26(function(v57) --[[ Line: 197 ]]
            -- upvalues: l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v56 (copy), v54 (copy), v55 (copy), v15 (ref)
            local v58 = 0;
            for _, _ in pairs(v57.allChannelTabs) do
                v58 = v58 + 1;
            end;
            local v61 = table.clone(v57);
            if l_GetFFlagTextChatEnableUniverseChatTabs_0() and v56 then
                local v62 = if v54 then v54.Name else v56;
                if v62 and v61.allChannelTabs[v62] then
                    local v63 = v61.allChannelTabs[v62];
                    local l_tabIndex_0 = v63.tabIndex;
                    if v55 then
                        local v65 = v61.allChannelTabs.RBXGeneral ~= nil;
                        local v66 = v61.allChannelTabs.RBXGlobal ~= nil;
                        l_tabIndex_0 = v63.name == "RBXGeneral" and 1 or if v63.name == "RBXGlobal" then v65 and 2 or 1 else v65 and v66 and 3 or (v65 or v66) and 2 or 1;
                    end;
                    local v67 = {
                        name = v63.name, 
                        tabIndex = l_tabIndex_0, 
                        HasUnreadMessages = false
                    };
                    local l_allChannelTabs_0 = v61.allChannelTabs;
                    local v69 = table.clone(l_allChannelTabs_0);
                    v69[v63.name] = nil;
                    local v70 = v15(v69);
                    l_allChannelTabs_0 = v70;
                    if l_GetFFlagTextChatEnableUniverseChatTabs_0() and v55 and v63.name == "RBXGlobal" and l_tabIndex_0 == 2 and v70.RBXGeneral ~= nil then
                        l_allChannelTabs_0 = table.clone(v70);
                        for v71, v72 in pairs(v70) do
                            if v71 ~= "RBXGeneral" and l_tabIndex_0 <= v72.tabIndex then
                                local v73 = table.clone(v72);
                                v73.tabIndex = v72.tabIndex + 1;
                                l_allChannelTabs_0[v71] = v73;
                            end;
                        end;
                    end;
                    local v74 = table.clone(l_allChannelTabs_0);
                    v74[v67.name] = v67;
                    v61.allChannelTabs = v15(v74);
                    v61.selectedTabName = v63.name;
                    return v61;
                else
                    v61.selectedTabName = v62 or "";
                    return v61;
                end;
            elseif v54 and v61.allChannelTabs[v54.Name] then
                local v75 = v61.allChannelTabs[v54.Name];
                local l_tabIndex_1 = v75.tabIndex;
                if v55 then
                    local v77 = v61.allChannelTabs.RBXGeneral ~= nil;
                    l_tabIndex_1 = v75.name == "RBXGeneral" and 1 or v77 and 2 or 1;
                end;
                local v78 = {
                    name = v75.name, 
                    tabIndex = l_tabIndex_1, 
                    HasUnreadMessages = false
                };
                local l_allChannelTabs_1 = v61.allChannelTabs;
                local v80 = table.clone(l_allChannelTabs_1);
                v80[v75.name] = nil;
                local v81 = v15(v80);
                l_allChannelTabs_1 = table.clone(v81);
                l_allChannelTabs_1[v78.name] = v78;
                v61.allChannelTabs = v15(l_allChannelTabs_1);
                v61.selectedTabName = v75.name;
                return v61;
            else
                v61.selectedTabName = if v54 then v54.Name else nil;
                return v61;
            end;
        end);
    end;
    local function v88(v83, v84) --[[ Line: 290 ]] --[[ Name: addChannelTab ]]
        -- upvalues: v26 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref)
        v26(function(v85) --[[ Line: 291 ]]
            -- upvalues: v84 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v83 (copy)
            local v86 = table.clone(v85);
            v86.allChannelTabs = table.clone(v86.allChannelTabs);
            local l_v84_0 = v84;
            if l_GetFFlagTextChatEnableUniverseChatTabs_0() and v83 == "RBXGlobal" then
                l_v84_0 = v86.allChannelTabs.RBXGeneral and 2 or 1;
            end;
            v86.allChannelTabs[v83] = {
                name = v83, 
                tabIndex = l_v84_0, 
                HasUnreadMessages = false
            };
            if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
                if not v86.selectedTabName then
                    v86.selectedTabName = v86.allChannelTabs.RBXGeneral and "RBXGeneral" or v83;
                    return v86;
                elseif v83 == "RBXGeneral" and v86.selectedTabName == "RBXGlobal" then
                    v86.selectedTabName = "RBXGeneral";
                    return v86;
                end;
            elseif not v86.selectedTabName then
                v86.selectedTabName = v83;
            end;
            return v86;
        end);
    end;
    local function v96(v89) --[[ Line: 320 ]] --[[ Name: removeChannelTab ]]
        -- upvalues: v26 (copy)
        v26(function(v90) --[[ Line: 321 ]]
            -- upvalues: v89 (copy)
            local v91 = table.clone(v90);
            v91.allChannelTabs = table.clone(v91.allChannelTabs);
            v91.allChannelTabs[v89] = nil;
            if v91.selectedTabName == v89 then
                local v92 = 1e999;
                local v93 = nil;
                for v94, v95 in pairs(v91.allChannelTabs) do
                    if v95.tabIndex < v92 then
                        v92 = v95.tabIndex;
                        v93 = v94;
                    end;
                end;
                v91.selectedTabName = v93;
            end;
            return v91;
        end);
    end;
    local function v104(v97) --[[ Line: 345 ]] --[[ Name: handleChannelRemoved ]]
        -- upvalues: v26 (copy), v15 (ref)
        v26(function(v98) --[[ Line: 346 ]]
            -- upvalues: v97 (copy), v15 (ref)
            local v99 = v98.allChannelTabs[v97.Name];
            if v99 == nil then
                return v98;
            else
                local v100 = table.clone(v98);
                local l_allChannelTabs_2 = v100.allChannelTabs;
                local v102 = table.clone(l_allChannelTabs_2);
                v102[v99.name] = nil;
                v100.allChannelTabs = v15(v102);
                if v99.name == v100.selectedTabName then
                    v100.selectedTabName = v100.allChannelTabs.RBXGeneral and "RBXGeneral" or nil;
                end;
                if v100.selectedTabName and v100.allChannelTabs[v100.selectedTabName] then
                    v100.allChannelTabs = table.clone(v100.allChannelTabs);
                    local v103 = table.clone(v100.allChannelTabs[v100.selectedTabName]);
                    v103.HasUnreadMessages = false;
                    v100.allChannelTabs[v100.selectedTabName] = v103;
                end;
                return v100;
            end;
        end);
    end;
    return {
        getChannelTabsState = v25, 
        getSelectedTabName = v28, 
        getUnreadChannels = v34, 
        handleIncomingOrOutgoingMessage = v43, 
        setSelectedTab = v53, 
        setTargetChannel = v82, 
        addChannelTab = v88, 
        removeChannelTab = v96, 
        handleChannelRemoved = v104, 
        markChannelUnread = v48
    };
end;