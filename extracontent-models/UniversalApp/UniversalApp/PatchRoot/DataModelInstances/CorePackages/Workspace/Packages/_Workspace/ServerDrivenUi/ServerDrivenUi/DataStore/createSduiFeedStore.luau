local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.DataStore.SduiFeedStoreTypes);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_FFlagSduiGetItemCollectionKeys_0 = require(l_script_FirstAncestor_0.Flags).FFlagSduiGetItemCollectionKeys;
local l_FFlagLuaAppRfySignalApportioning_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppRfySignalApportioning;
local v7 = game:DefineFastFlag("LuaAppNilApportionedItems", false);
local l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning;
local v9 = game:DefineFastInt("SduiCreateSduiFeedStoreLogDelayMs", 1000) / 1000;
return function() --[[ Line: 25 ]] --[[ Name: createSduiFeedStore ]]
    -- upvalues: v2 (copy), l_FFlagSduiGetItemCollectionKeys_0 (copy), l_FFlagLuaAppRfySignalApportioning_0 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (copy), v9 (copy), l_DiscoveryEventErrorLogger_0 (copy), v7 (copy)
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13, v14 = v2.createSignal({});
    local v15, v16 = v2.createSignal(0);
    local v17 = nil;
    local v18 = nil;
    if l_FFlagSduiGetItemCollectionKeys_0 then
        local v19, v20 = v2.createSignal({});
        v17 = v19;
        v18 = v20;
    end;
    local function _(v21, v22) --[[ Line: 57 ]] --[[ Name: createItemCollectionSignal ]]
        -- upvalues: v2 (ref), v10 (copy)
        local v23, v24 = v2.createSignal(v22);
        v10[v21] = {
            get = v23, 
            set = v24
        };
        return v10[v21];
    end;
    local function v31(v26, v27) --[[ Line: 66 ]] --[[ Name: getItemCollection ]]
        -- upvalues: v10 (copy), v2 (ref)
        local v28 = v10[v26];
        if v28 == nil then
            if v27 then
                local v29, v30 = v2.createSignal(nil);
                v10[v26] = {
                    get = v29, 
                    set = v30
                };
                v28 = v10[v26];
            else
                error((("createSduiFeedStore missing item collection for feedItemKey %*"):format(v26)));
            end;
        end;
        return v28.get;
    end;
    local function v35(v32) --[[ Line: 81 ]] --[[ Name: getFirstItemCollectionWithFilter ]]
        -- upvalues: v10 (copy)
        for _, v34 in v10 do
            if v32(v34.get(false)) then
                return v34.get;
            end;
        end;
        return nil;
    end;
    local function v42(v36) --[[ Line: 93 ]] --[[ Name: setItemCollections ]]
        -- upvalues: v10 (copy), v2 (ref)
        for v37, v38 in v36 do
            if v10[v37] then
                v10[v37].set(v38);
            else
                local v39, v40 = v2.createSignal(v38);
                v10[v37] = {
                    get = v39, 
                    set = v40
                };
                local _ = v10[v37];
            end;
        end;
    end;
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    local v46 = nil;
    if l_FFlagLuaAppRfySignalApportioning_0 then
        local v49 = l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 and function(v47, v48) --[[ Line: 106 ]]
            if v48 then
                return v47 .. "_" .. v48;
            else
                return v47;
            end;
        end or nil;
        local l_v49_0 = v49 --[[ copy: 17 -> 21 ]];
        local function v64(v51, v52, v53) --[[ Line: 115 ]] --[[ Name: createApportioningDataSignals ]]
            -- upvalues: l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), l_v49_0 (copy), v2 (ref), v11 (copy), v12 (copy)
            local v54 = if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then l_v49_0(v51, v53) else v51;
            local v55, v56 = v2.createSignal(v52.items);
            local v57, v58 = v2.createSignal(v52.gridApportioningMetadata);
            local v59 = {
                getItems = v55, 
                setItems = v56, 
                getGridApportioningMetadata = v57, 
                setGridApportioningMetadata = v58, 
                scheduledCapacityUpdates = {}, 
                isCapacityUpdateScheduled = false, 
                capacityUpdateCoroutine = nil
            };
            local v60, v61 = v2.createSignal(v59);
            v11[v54] = {
                get = v60, 
                set = v61
            };
            if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then
                local v62 = v12[v51] and v12[v51].previousKey;
                local v63 = v12[v51] and v12[v51].currentKey;
                if v62 then
                    v11[v62] = nil;
                end;
                v12[v51] = {
                    previousKey = v63, 
                    currentKey = v54
                };
            end;
        end;
        local function v68(v65, v66) --[[ Line: 163 ]]
            -- upvalues: l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), l_v49_0 (copy), v11 (copy), v64 (copy)
            local v67 = if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then l_v49_0(v65, v66) else v65;
            if not v11[v67] then
                v64(v65, {
                    items = {}, 
                    gridApportioningMetadata = {}
                }, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v66 else nil);
            end;
            return v11[v67].get;
        end;
        v43 = function(v69, v70) --[[ Line: 181 ]] --[[ Name: setApportioningData ]]
            -- upvalues: l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), l_v49_0 (copy), v11 (copy), v64 (copy)
            for v71, v72 in v69 do
                local v73 = if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then l_v49_0(v71, v70) else v71;
                if v11[v73] then
                    local v74 = v11[v73].get(false);
                    v74.setItems(v72.items);
                    v74.setGridApportioningMetadata(v72.gridApportioningMetadata);
                    v74.scheduledCapacityUpdates = {};
                    v74.isCapacityUpdateScheduled = false;
                    if v74.capacityUpdateCoroutine then
                        task.cancel(v74.capacityUpdateCoroutine);
                        v74.capacityUpdateCoroutine = nil;
                    end;
                else
                    v64(v71, v72, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v70 else nil);
                end;
            end;
        end;
        local function v87(v75, v76) --[[ Line: 216 ]] --[[ Name: updateGridApportioningMetadata ]]
            -- upvalues: v68 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), l_v49_0 (copy), v9 (ref), v11 (copy), l_DiscoveryEventErrorLogger_0 (ref)
            local v77 = v68(v75, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v76 else nil)(false);
            local v78 = v77.getGridApportioningMetadata(false);
            local l_scheduledCapacityUpdates_0 = v77.scheduledCapacityUpdates;
            if #v78 == 0 then
                local v80 = if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then l_v49_0(v75, v76) else v75;
                task.delay(v9, function() --[[ Line: 232 ]]
                    -- upvalues: v11 (ref), v80 (copy), l_DiscoveryEventErrorLogger_0 (ref)
                    local v81 = v11[v80].get(false);
                    if #(v81 and v81.getGridApportioningMetadata(false) or {}) == 0 then
                        l_DiscoveryEventErrorLogger_0.reportError("ApportioningEmptyGridMetadata", ("Apportioning grid metadata is empty for %* in updateGridApportioningMetadata"):format(v80), {
                            apportioningKey = v80
                        });
                    end;
                end);
                return;
            else
                local v82 = 1;
                local v83 = {};
                for _, v85 in v78 do
                    local v86 = nil;
                    v86 = if l_scheduledCapacityUpdates_0[v85.sortIndex] then l_scheduledCapacityUpdates_0[v85.sortIndex] else v85.capacity;
                    table.insert(v83, {
                        sortIndex = v85.sortIndex, 
                        startingItemIndex = v82, 
                        capacity = v86
                    });
                    v82 = v82 + v86;
                end;
                v77.setGridApportioningMetadata(v83);
                return;
            end;
        end;
        v44 = function(v88, v89, v90, v91) --[[ Line: 272 ]] --[[ Name: updateApportioningCapacity ]]
            -- upvalues: v68 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), v87 (copy)
            local v92 = v68(v88, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v91 else nil)(false);
            v92.scheduledCapacityUpdates[v89] = v90;
            if not v92.isCapacityUpdateScheduled then
                v92.isCapacityUpdateScheduled = true;
                v92.capacityUpdateCoroutine = task.defer(function() --[[ Line: 287 ]]
                    -- upvalues: v87 (ref), v88 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), v91 (copy), v92 (copy)
                    v87(v88, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v91 else nil);
                    v92.scheduledCapacityUpdates = {};
                    v92.isCapacityUpdateScheduled = false;
                    v92.capacityUpdateCoroutine = nil;
                end);
            end;
        end;
        v45 = function(v93, v94, v95) --[[ Line: 299 ]] --[[ Name: getSingleGridApportioningMetadata ]]
            -- upvalues: v2 (ref), v68 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), v9 (ref), l_v49_0 (copy), v11 (copy), l_DiscoveryEventErrorLogger_0 (ref)
            return v2.createComputed(function(v96) --[[ Line: 300 ]]
                -- upvalues: v68 (ref), v93 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), v95 (copy), v9 (ref), l_v49_0 (ref), v11 (ref), l_DiscoveryEventErrorLogger_0 (ref), v94 (copy)
                local v97 = v68(v93, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v95 else nil)(v96).getGridApportioningMetadata(v96);
                if #v97 == 0 then
                    task.delay(v9, function() --[[ Line: 311 ]]
                        -- upvalues: l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), l_v49_0 (ref), v93 (ref), v95 (ref), v11 (ref), l_DiscoveryEventErrorLogger_0 (ref), v94 (ref)
                        local v98 = if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then l_v49_0(v93, v95) else v93;
                        local v99 = v11[v98].get(false);
                        if #(v99 and v99.getGridApportioningMetadata(false) or {}) == 0 then
                            l_DiscoveryEventErrorLogger_0.reportError("ApportioningEmptyGridMetadata", ("Apportioning grid metadata is empty for %* in getSingleGridApportioningMetadata"):format(v98), {
                                apportioningKey = v98, 
                                sortIndex = v94
                            });
                        end;
                    end);
                    return nil;
                else
                    for _, v101 in v97 do
                        if v101.sortIndex == v94 then
                            return v101;
                        end;
                    end;
                    return nil;
                end;
            end);
        end;
        v46 = function(v102, v103, v104) --[[ Line: 342 ]] --[[ Name: getApportionedItems ]]
            -- upvalues: v2 (ref), v68 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), v45 (ref), l_v49_0 (copy), v9 (ref), v11 (copy), l_DiscoveryEventErrorLogger_0 (ref), v7 (ref)
            return v2.createComputed(function(v105) --[[ Line: 343 ]]
                -- upvalues: v68 (ref), v102 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), v104 (copy), v45 (ref), v103 (copy), l_v49_0 (ref), v9 (ref), v11 (ref), l_DiscoveryEventErrorLogger_0 (ref), v7 (ref)
                local v106 = v68(v102, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v104 else nil)(v105);
                local v107 = v106.getItems(v105);
                local v108 = v45(v102, v103, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v104 else nil)(v105);
                if #v107 == 0 and #v106.getGridApportioningMetadata(false) == 0 then
                    local v109 = if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then l_v49_0(v102, v104) else v102;
                    task.delay(v9, function() --[[ Line: 361 ]]
                        -- upvalues: v11 (ref), v109 (copy), l_DiscoveryEventErrorLogger_0 (ref), v103 (ref)
                        local v110 = v11[v109].get(false);
                        local v111 = v110 and v110.getItems(false) or {};
                        local v112 = v110 and v110.getGridApportioningMetadata(false) or {};
                        if #v111 == 0 and #v112 == 0 then
                            l_DiscoveryEventErrorLogger_0.reportError("ApportioningEmptyData", ("All apportioning data is empty for %* in getApportionedItems"):format(v109), {
                                apportioningKey = v109, 
                                sortIndex = v103
                            });
                        end;
                    end);
                    if v7 then
                        return nil;
                    else
                        return {};
                    end;
                elseif not v108 then
                    local v113 = nil;
                    task.delay(v9, function() --[[ Line: 382 ]]
                        -- upvalues: l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), l_v49_0 (ref), v102 (ref), v104 (ref), v45 (ref), v103 (ref), v11 (ref), v113 (ref), l_DiscoveryEventErrorLogger_0 (ref)
                        local v114 = if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then l_v49_0(v102, v104) else v102;
                        if not v45(v102, v103, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v104 else nil)(false) then
                            local v115 = v11[v114].get(false);
                            local v116 = v115 and v115.getGridApportioningMetadata(false) or {};
                            local v117 = {};
                            for _, v119 in v116 do
                                table.insert(v117, v119.sortIndex);
                            end;
                            v113 = if #v117 > 0 then table.concat(v117, ",") else "none";
                            l_DiscoveryEventErrorLogger_0.reportError("ApportioningSortIndexNotFound", ("Sort index %* not found in apportioning data for %*"):format(v103, v114), {
                                apportioningKey = v114, 
                                sortIndex = v103, 
                                availableSortIndices = v113
                            });
                        end;
                    end);
                    return {};
                else
                    local l_startingItemIndex_0 = v108.startingItemIndex;
                    local v121 = math.min(l_startingItemIndex_0 + v108.capacity - 1, #v107);
                    local v122 = {};
                    for v123 = l_startingItemIndex_0, v121 do
                        table.insert(v122, v107[v123]);
                    end;
                    return v122;
                end;
            end);
        end;
    end;
    local function v128(v124, v125) --[[ Line: 431 ]] --[[ Name: updateData ]]
        -- upvalues: v14 (copy), v16 (copy), v42 (copy), l_FFlagSduiGetItemCollectionKeys_0 (ref), v18 (ref), l_FFlagLuaAppRfySignalApportioning_0 (ref), v43 (ref), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref)
        if v124.templates then
            v14(v124.templates);
        end;
        if v124.dataUpdatedTimestamp then
            v16(v124.dataUpdatedTimestamp);
        end;
        if v124.itemCollections then
            v42(v124.itemCollections);
            if l_FFlagSduiGetItemCollectionKeys_0 then
                local v126 = {};
                for v127 in v124.itemCollections do
                    table.insert(v126, v127);
                end;
                v18(v126);
            end;
        end;
        if l_FFlagLuaAppRfySignalApportioning_0 and v124.apportioningData then
            v43(v124.apportioningData, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v125 else nil);
        end;
    end;
    return {
        getFirstItemCollectionWithFilter = v35, 
        getItemCollection = v31, 
        getTemplates = v13, 
        getDataUpdatedTimestamp = v15, 
        getItemCollectionKeys = if l_FFlagSduiGetItemCollectionKeys_0 then v17 else nil, 
        updateApportioningCapacity = if l_FFlagLuaAppRfySignalApportioning_0 then v44 else nil, 
        getSingleGridApportioningMetadata = if l_FFlagLuaAppRfySignalApportioning_0 then v45 else nil, 
        getApportionedItems = if l_FFlagLuaAppRfySignalApportioning_0 then v46 else nil, 
        updateData = v128
    };
end;