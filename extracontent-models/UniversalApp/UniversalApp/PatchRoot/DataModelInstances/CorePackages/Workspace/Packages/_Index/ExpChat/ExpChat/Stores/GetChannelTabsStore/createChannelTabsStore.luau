local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(l_Parent_0.tutils);
local l_createSignal_0 = v1.createSignal;
local l_createComputed_0 = v1.createComputed;
local function v14(v5) --[[ Line: 38 ]] --[[ Name: reorderTabs ]]
    local v6 = table.clone(v5);
    local v7 = {};
    for _, v9 in pairs(v6) do
        table.insert(v7, v9);
    end;
    table.sort(v7, function(v10, v11) --[[ Line: 47 ]]
        return v10.tabIndex < v11.tabIndex;
    end);
    for v12, v13 in ipairs(v7) do
        v6[v13.name] = {
            name = v13.name, 
            tabIndex = v12, 
            HasUnreadMessages = v13.HasUnreadMessages
        };
    end;
    return v6;
end;
local function _(v15, v16) --[[ Line: 63 ]] --[[ Name: insertTabAndReorder ]]
    -- upvalues: v14 (copy)
    local v17 = table.clone(v15);
    v17[v16.name] = v16;
    return (v14(v17));
end;
local function _(v19, v20) --[[ Line: 73 ]] --[[ Name: removeTabAndReorder ]]
    -- upvalues: v14 (copy)
    local v21 = table.clone(v19);
    v21[v20.name] = nil;
    return (v14(v21));
end;
return function() --[[ Line: 83 ]] --[[ Name: createChannelTabsStore ]]
    -- upvalues: l_createSignal_0 (copy), l_createComputed_0 (copy), v2 (copy), v14 (copy)
    local v23 = {
        allChannelTabs = {}, 
        selectedTabName = nil
    };
    local v24, v25 = l_createSignal_0(v23);
    local v27 = l_createComputed_0(function(v26) --[[ Line: 92 ]]
        -- upvalues: v24 (copy)
        return v24(v26).selectedTabName;
    end);
    local v33 = l_createComputed_0(function(v28) --[[ Line: 97 ]]
        -- upvalues: v24 (copy)
        local v29 = v24(v28);
        local v30 = {};
        for v31, v32 in pairs(v29.allChannelTabs) do
            if v32.HasUnreadMessages then
                v30[v31] = true;
            end;
        end;
        return v30;
    end, v2.deepEqual);
    local function v40(v34, v35) --[[ Line: 110 ]] --[[ Name: handleIncomingOrOutgoingMessage ]]
        -- upvalues: v25 (copy)
        if not v34.TextChannel or v35 then
            return;
        else
            v25(function(v36) --[[ Line: 115 ]]
                -- upvalues: v34 (copy)
                local v37 = table.clone(v36);
                local l_Name_0 = v34.TextChannel.Name;
                if l_Name_0 == "RBXSystem" then
                    l_Name_0 = "RBXGeneral";
                end;
                if v37.allChannelTabs[l_Name_0] and l_Name_0 ~= v37.selectedTabName then
                    v37.allChannelTabs = table.clone(v37.allChannelTabs);
                    local v39 = table.clone(v37.allChannelTabs[l_Name_0]);
                    v39.HasUnreadMessages = true;
                    v37.allChannelTabs[l_Name_0] = v39;
                end;
                return v37;
            end);
            return;
        end;
    end;
    local function v45(v41) --[[ Line: 136 ]] --[[ Name: setSelectedTab ]]
        -- upvalues: v25 (copy)
        v25(function(v42) --[[ Line: 137 ]]
            -- upvalues: v41 (copy)
            local v43 = table.clone(v42);
            v43.selectedTabName = v41;
            if v43.allChannelTabs[v41] then
                v43.allChannelTabs = table.clone(v43.allChannelTabs);
                local v44 = table.clone(v43.allChannelTabs[v41]);
                v44.HasUnreadMessages = false;
                v43.allChannelTabs[v41] = v44;
            end;
            return v43;
        end);
    end;
    local function v59(v46, v47) --[[ Line: 152 ]] --[[ Name: setTargetChannel ]]
        -- upvalues: v25 (copy), v14 (ref)
        v25(function(v48) --[[ Line: 153 ]]
            -- upvalues: v46 (copy), v47 (copy), v14 (ref)
            local v49 = 0;
            for _, _ in pairs(v48.allChannelTabs) do
                v49 = v49 + 1;
            end;
            local v52 = table.clone(v48);
            if v46 and v52.allChannelTabs[v46.Name] then
                local v53 = v52.allChannelTabs[v46.Name];
                local l_tabIndex_0 = v53.tabIndex;
                if v47 then
                    l_tabIndex_0 = v52.allChannelTabs.RBXGeneral ~= nil and v53.name ~= "RBXGeneral" and 2 or 1;
                end;
                local v55 = {
                    name = v53.name, 
                    tabIndex = l_tabIndex_0, 
                    HasUnreadMessages = false
                };
                local l_allChannelTabs_0 = v52.allChannelTabs;
                local v57 = table.clone(l_allChannelTabs_0);
                v57[v53.name] = nil;
                local v58 = v14(v57);
                l_allChannelTabs_0 = table.clone(v58);
                l_allChannelTabs_0[v55.name] = v55;
                v52.allChannelTabs = v14(l_allChannelTabs_0);
                v52.selectedTabName = v53.name;
                return v52;
            else
                v52.selectedTabName = if v46 then v46.Name else nil;
                return v52;
            end;
        end);
    end;
    local function v64(v60, v61) --[[ Line: 187 ]] --[[ Name: addChannelTab ]]
        -- upvalues: v25 (copy)
        v25(function(v62) --[[ Line: 188 ]]
            -- upvalues: v60 (copy), v61 (copy)
            local v63 = table.clone(v62);
            v63.allChannelTabs = table.clone(v63.allChannelTabs);
            v63.allChannelTabs[v60] = {
                name = v60, 
                tabIndex = v61, 
                HasUnreadMessages = false
            };
            if not v63.selectedTabName then
                v63.selectedTabName = v60;
            end;
            return v63;
        end);
    end;
    local function v72(v65) --[[ Line: 206 ]] --[[ Name: removeChannelTab ]]
        -- upvalues: v25 (copy)
        v25(function(v66) --[[ Line: 207 ]]
            -- upvalues: v65 (copy)
            local v67 = table.clone(v66);
            v67.allChannelTabs = table.clone(v67.allChannelTabs);
            v67.allChannelTabs[v65] = nil;
            if v67.selectedTabName == v65 then
                local v68 = 1e999;
                local v69 = nil;
                for v70, v71 in pairs(v67.allChannelTabs) do
                    if v71.tabIndex < v68 then
                        v68 = v71.tabIndex;
                        v69 = v70;
                    end;
                end;
                v67.selectedTabName = v69;
            end;
            return v67;
        end);
    end;
    local function v80(v73) --[[ Line: 231 ]] --[[ Name: handleChannelRemoved ]]
        -- upvalues: v25 (copy), v14 (ref)
        v25(function(v74) --[[ Line: 232 ]]
            -- upvalues: v73 (copy), v14 (ref)
            local v75 = v74.allChannelTabs[v73.Name];
            if v75 == nil then
                return v74;
            else
                local v76 = table.clone(v74);
                local l_allChannelTabs_1 = v76.allChannelTabs;
                local v78 = table.clone(l_allChannelTabs_1);
                v78[v75.name] = nil;
                v76.allChannelTabs = v14(v78);
                if v75.name == v76.selectedTabName then
                    v76.selectedTabName = v76.allChannelTabs.RBXGeneral and "RBXGeneral" or nil;
                end;
                if v76.selectedTabName and v76.allChannelTabs[v76.selectedTabName] then
                    v76.allChannelTabs = table.clone(v76.allChannelTabs);
                    local v79 = table.clone(v76.allChannelTabs[v76.selectedTabName]);
                    v79.HasUnreadMessages = false;
                    v76.allChannelTabs[v76.selectedTabName] = v79;
                end;
                return v76;
            end;
        end);
    end;
    return {
        getChannelTabsState = v24, 
        getSelectedTabName = v27, 
        getUnreadChannels = v33, 
        handleIncomingOrOutgoingMessage = v40, 
        setSelectedTab = v45, 
        setTargetChannel = v59, 
        addChannelTab = v64, 
        removeChannelTab = v72, 
        handleChannelRemoved = v80
    };
end;