local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Signals);
local v5 = require(l_Parent_0.SignalsExperimental);
local l_DataStatus_0 = require(l_script_FirstAncestor_0.DataHydrationTypes).DataStatus;
local l_getLocalPlayerUserId_0 = require(l_script_FirstAncestor_0.DataHydrationUtils).getLocalPlayerUserId;
local v8 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppDataHydrationDataCacheUpdateItem_0 = v8.FFlagLuaAppDataHydrationDataCacheUpdateItem;
local l_FFlagLuaAppDataHydrationDataCacheReplaceItem_0 = v8.FFlagLuaAppDataHydrationDataCacheReplaceItem;
local v11 = game:DefineFastFlag("LuaAppDataCacheBatch", false);
local v12 = game:DefineFastInt("LuaAppDefaultDataTtlSec", 3600);
local v13 = game:DefineFastInt("LuaAppDefaultFailedDataTtlSec", 60);
return function(v14, v15) --[[ Line: 28 ]] --[[ Name: createDataCache ]]
    -- upvalues: v12 (copy), v13 (copy), v4 (copy), l_DataStatus_0 (copy), v11 (copy), v5 (copy), v3 (copy), l_getLocalPlayerUserId_0 (copy), l_Players_0 (copy), l_FFlagLuaAppDataHydrationDataCacheUpdateItem_0 (copy), l_FFlagLuaAppDataHydrationDataCacheReplaceItem_0 (copy)
    local v16 = v14 or v12;
    local v17 = v15 or v13;
    local v18 = {};
    local v19 = {};
    local v20 = {};
    local v21 = {};
    local function v27(v22) --[[ Line: 39 ]] --[[ Name: getOrCreateSignals ]]
        -- upvalues: v18 (ref), v19 (ref), v4 (ref), v20 (ref), l_DataStatus_0 (ref)
        if v18[v22] == nil or v19[v22] == nil then
            v18[v22] = {};
            local v23 = v18[v22];
            local l_v19_0 = v19;
            local v25, v26 = v4.createSignal(nil);
            v23.data = v25;
            l_v19_0[v22] = v26;
            v23 = v18[v22];
            l_v19_0 = v20;
            v25, v26 = v4.createSignal(l_DataStatus_0.NotReady);
            v23.status = v25;
            l_v19_0[v22] = v26;
        end;
        return v18[v22], v19[v22];
    end;
    local function v34(v28, v29) --[[ Line: 51 ]] --[[ Name: getItem ]]
        -- upvalues: v27 (copy), v21 (ref), l_DataStatus_0 (ref)
        local v30 = v27(v28);
        local v31 = true;
        if v21[v28] and os.clock() < v21[v28] then
            local v32 = v30.data(false);
            local v33 = v30.status(false);
            if v32 ~= nil or v33 == l_DataStatus_0.Failed then
                if v29 then
                    return v30, (v29(v32));
                else
                    v31 = false;
                end;
            end;
        end;
        return v30, v31;
    end;
    local function v43(v35, v36) --[[ Line: 73 ]] --[[ Name: getItems ]]
        -- upvalues: v34 (copy)
        local v37 = {};
        local v38 = {};
        if not v35 then
            return v37, v38;
        else
            for _, v40 in v35 do
                local v41, v42 = v34(v40, v36);
                v37[v40] = v41;
                v38[v40] = v42;
            end;
            return v37, v38;
        end;
    end;
    local function v55(v44) --[[ Line: 92 ]] --[[ Name: replaceItems ]]
        -- upvalues: v16 (copy), v11 (ref), v27 (copy), v20 (ref), l_DataStatus_0 (ref), v21 (ref), v5 (ref)
        local v45 = os.clock() + v16;
        if v11 then
            local function v50() --[[ Line: 96 ]] --[[ Name: batchUpdate ]]
                -- upvalues: v44 (copy), v27 (ref), v20 (ref), l_DataStatus_0 (ref), v21 (ref), v45 (copy)
                for v46, v47 in v44 do
                    local _, v49 = v27(v46);
                    v49(v47);
                    v20[v46](l_DataStatus_0.Ready);
                    v21[v46] = v45;
                end;
            end;
            v5.batch(v50);
            return;
        else
            for v51, v52 in v44 do
                local _, v54 = v27(v51);
                v54(v52);
                v20[v51](l_DataStatus_0.Ready);
                v21[v51] = v45;
            end;
            return;
        end;
    end;
    local function v69(v56) --[[ Line: 115 ]] --[[ Name: updateItems ]]
        -- upvalues: v16 (copy), v11 (ref), v27 (copy), v3 (ref), v20 (ref), l_DataStatus_0 (ref), v21 (ref), v5 (ref)
        local v57 = os.clock() + v16;
        if v11 then
            local function v63() --[[ Line: 119 ]] --[[ Name: batchUpdate ]]
                -- upvalues: v56 (copy), v27 (ref), v3 (ref), v20 (ref), l_DataStatus_0 (ref), v21 (ref), v57 (copy)
                for v58, v59 in v56 do
                    local v60, v61 = v27(v58);
                    local v62 = v60.data(false);
                    v61(if v62 and type(v62) == "table" and type(v59) == "table" then v3.Dictionary.union(v62, v59) else v59);
                    v20[v58](l_DataStatus_0.Ready);
                    v21[v58] = v57;
                end;
            end;
            v5.batch(v63);
            return;
        else
            for v64, v65 in v56 do
                local v66, v67 = v27(v64);
                local v68 = v66.data(false);
                v67(if v68 and type(v68) == "table" and type(v65) == "table" then v3.Dictionary.union(v68, v65) else v65);
                v20[v64](l_DataStatus_0.Ready);
                v21[v64] = v57;
            end;
            return;
        end;
    end;
    local function v75(v70, v71) --[[ Line: 153 ]] --[[ Name: updateItem ]]
        -- upvalues: v27 (copy), v3 (ref), v20 (ref), l_DataStatus_0 (ref), v21 (ref), v16 (copy)
        local v72, v73 = v27(v70);
        local v74 = v72.data(false);
        v73(if v74 and type(v74) == "table" and type(v71) == "table" then v3.Dictionary.union(v74, v71) else v71);
        v20[v70](l_DataStatus_0.Ready);
        v21[v70] = os.clock() + v16;
    end;
    local function v80(v76, v77) --[[ Line: 167 ]] --[[ Name: replaceItem ]]
        -- upvalues: v27 (copy), v20 (ref), l_DataStatus_0 (ref), v21 (ref), v16 (copy)
        local _, v79 = v27(v76);
        v79(v77);
        v20[v76](l_DataStatus_0.Ready);
        v21[v76] = os.clock() + v16;
    end;
    local function v88(v81) --[[ Line: 175 ]] --[[ Name: markItemsAsFailed ]]
        -- upvalues: v17 (copy), v11 (ref), v20 (ref), l_DataStatus_0 (ref), v21 (ref), v5 (ref)
        local v82 = os.clock() + v17;
        if v11 then
            local function v85() --[[ Line: 178 ]] --[[ Name: batchUpdate ]]
                -- upvalues: v81 (copy), v20 (ref), l_DataStatus_0 (ref), v21 (ref), v82 (copy)
                for _, v84 in v81 do
                    if v20[v84] then
                        v20[v84](l_DataStatus_0.Failed);
                    end;
                    v21[v84] = v82;
                end;
            end;
            v5.batch(v85);
            return;
        else
            for _, v87 in v81 do
                if v20[v87] then
                    v20[v87](l_DataStatus_0.Failed);
                end;
                v21[v87] = v82;
            end;
            return;
        end;
    end;
    local function v89() --[[ Line: 197 ]] --[[ Name: clear ]]
        -- upvalues: v21 (ref), v18 (ref), v19 (ref), v20 (ref)
        v21 = {};
        v18 = {};
        v19 = {};
        v20 = {};
    end;
    local v90 = l_getLocalPlayerUserId_0();
    local v92 = l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 205 ]]
        -- upvalues: l_getLocalPlayerUserId_0 (ref), v90 (ref), v89 (copy)
        local v91 = l_getLocalPlayerUserId_0();
        if v91 ~= v90 then
            v90 = v91;
            v89();
        end;
    end);
    local function v93() --[[ Line: 213 ]] --[[ Name: dispose ]]
        -- upvalues: v92 (ref), v89 (copy)
        if v92 then
            v92:Disconnect();
            v92 = nil;
        end;
        v89();
    end;
    return {
        getItem = v34, 
        getItems = v43, 
        updateItems = v69, 
        updateItem = if l_FFlagLuaAppDataHydrationDataCacheUpdateItem_0 then v75 else nil, 
        replaceItems = v55, 
        replaceItem = if l_FFlagLuaAppDataHydrationDataCacheReplaceItem_0 then v80 else nil, 
        markItemsAsFailed = v88, 
        clear = v89, 
        dispose = v93
    };
end;