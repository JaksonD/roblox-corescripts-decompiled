local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Signals);
local v5 = require(l_Parent_0.SignalsExperimental);
local l_DataStatus_0 = require(l_script_FirstAncestor_0.DataHydrationTypes).DataStatus;
local l_getLocalPlayerUserId_0 = require(l_script_FirstAncestor_0.DataHydrationUtils).getLocalPlayerUserId;
local l_FFlagLuaAppDataHydrationDataCacheReplaceItem_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDataHydrationDataCacheReplaceItem;
local v9 = game:DefineFastFlag("LuaAppDataCacheBatch", false);
local v10 = game:DefineFastInt("LuaAppDefaultDataTtlSec", 3600);
local v11 = game:DefineFastInt("LuaAppDefaultFailedDataTtlSec", 60);
return function(v12, v13) --[[ Line: 27 ]] --[[ Name: createDataCache ]]
    -- upvalues: v10 (copy), v11 (copy), v4 (copy), l_DataStatus_0 (copy), v9 (copy), v5 (copy), v3 (copy), l_getLocalPlayerUserId_0 (copy), l_Players_0 (copy), l_FFlagLuaAppDataHydrationDataCacheReplaceItem_0 (copy)
    local v14 = v12 or v10;
    local v15 = v13 or v11;
    local v16 = {};
    local v17 = {};
    local v18 = {};
    local v19 = {};
    local function v25(v20) --[[ Line: 38 ]] --[[ Name: getOrCreateSignals ]]
        -- upvalues: v16 (ref), v17 (ref), v4 (ref), v18 (ref), l_DataStatus_0 (ref)
        if v16[v20] == nil or v17[v20] == nil then
            v16[v20] = {};
            local v21 = v16[v20];
            local l_v17_0 = v17;
            local v23, v24 = v4.createSignal(nil);
            v21.data = v23;
            l_v17_0[v20] = v24;
            v21 = v16[v20];
            l_v17_0 = v18;
            v23, v24 = v4.createSignal(l_DataStatus_0.NotReady);
            v21.status = v23;
            l_v17_0[v20] = v24;
        end;
        return v16[v20], v17[v20];
    end;
    local function v32(v26, v27) --[[ Line: 50 ]] --[[ Name: getItem ]]
        -- upvalues: v25 (copy), v19 (ref), l_DataStatus_0 (ref)
        local v28 = v25(v26);
        local v29 = true;
        if v19[v26] and os.clock() < v19[v26] then
            local v30 = v28.data(false);
            local v31 = v28.status(false);
            if v30 ~= nil or v31 == l_DataStatus_0.Failed then
                if v27 then
                    return v28, (v27(v30));
                else
                    v29 = false;
                end;
            end;
        end;
        return v28, v29;
    end;
    local function v41(v33, v34) --[[ Line: 72 ]] --[[ Name: getItems ]]
        -- upvalues: v32 (copy)
        local v35 = {};
        local v36 = {};
        if not v33 then
            return v35, v36;
        else
            for _, v38 in v33 do
                local v39, v40 = v32(v38, v34);
                v35[v38] = v39;
                v36[v38] = v40;
            end;
            return v35, v36;
        end;
    end;
    local function v53(v42) --[[ Line: 91 ]] --[[ Name: replaceItems ]]
        -- upvalues: v14 (copy), v9 (ref), v25 (copy), v18 (ref), l_DataStatus_0 (ref), v19 (ref), v5 (ref)
        local v43 = os.clock() + v14;
        if v9 then
            local function v48() --[[ Line: 95 ]] --[[ Name: batchUpdate ]]
                -- upvalues: v42 (copy), v25 (ref), v18 (ref), l_DataStatus_0 (ref), v19 (ref), v43 (copy)
                for v44, v45 in v42 do
                    local _, v47 = v25(v44);
                    v47(v45);
                    v18[v44](l_DataStatus_0.Ready);
                    v19[v44] = v43;
                end;
            end;
            v5.batch(v48);
            return;
        else
            for v49, v50 in v42 do
                local _, v52 = v25(v49);
                v52(v50);
                v18[v49](l_DataStatus_0.Ready);
                v19[v49] = v43;
            end;
            return;
        end;
    end;
    local function v67(v54) --[[ Line: 114 ]] --[[ Name: updateItems ]]
        -- upvalues: v14 (copy), v9 (ref), v25 (copy), v3 (ref), v18 (ref), l_DataStatus_0 (ref), v19 (ref), v5 (ref)
        local v55 = os.clock() + v14;
        if v9 then
            local function v61() --[[ Line: 118 ]] --[[ Name: batchUpdate ]]
                -- upvalues: v54 (copy), v25 (ref), v3 (ref), v18 (ref), l_DataStatus_0 (ref), v19 (ref), v55 (copy)
                for v56, v57 in v54 do
                    local v58, v59 = v25(v56);
                    local v60 = v58.data(false);
                    v59(if v60 and type(v60) == "table" and type(v57) == "table" then v3.Dictionary.union(v60, v57) else v57);
                    v18[v56](l_DataStatus_0.Ready);
                    v19[v56] = v55;
                end;
            end;
            v5.batch(v61);
            return;
        else
            for v62, v63 in v54 do
                local v64, v65 = v25(v62);
                local v66 = v64.data(false);
                v65(if v66 and type(v66) == "table" and type(v63) == "table" then v3.Dictionary.union(v66, v63) else v63);
                v18[v62](l_DataStatus_0.Ready);
                v19[v62] = v55;
            end;
            return;
        end;
    end;
    local function v73(v68, v69) --[[ Line: 152 ]] --[[ Name: updateItem ]]
        -- upvalues: v25 (copy), v3 (ref), v18 (ref), l_DataStatus_0 (ref), v19 (ref), v14 (copy)
        local v70, v71 = v25(v68);
        local v72 = v70.data(false);
        v71(if v72 and type(v72) == "table" and type(v69) == "table" then v3.Dictionary.union(v72, v69) else v69);
        v18[v68](l_DataStatus_0.Ready);
        v19[v68] = os.clock() + v14;
    end;
    local function v78(v74, v75) --[[ Line: 166 ]] --[[ Name: replaceItem ]]
        -- upvalues: v25 (copy), v18 (ref), l_DataStatus_0 (ref), v19 (ref), v14 (copy)
        local _, v77 = v25(v74);
        v77(v75);
        v18[v74](l_DataStatus_0.Ready);
        v19[v74] = os.clock() + v14;
    end;
    local function v81(v79) --[[ Line: 177 ]] --[[ Name: resetFailedItem ]]
        -- upvalues: v16 (ref), l_DataStatus_0 (ref), v18 (ref)
        local v80 = v16[v79];
        if v80 and v80.status(false) == l_DataStatus_0.Failed then
            v18[v79](l_DataStatus_0.NotReady);
        end;
    end;
    local function v86(v82) --[[ Line: 184 ]] --[[ Name: resetFailedItems ]]
        -- upvalues: v16 (ref), l_DataStatus_0 (ref), v18 (ref)
        for _, v84 in v82 do
            local v85 = v16[v84];
            if v85 and v85.status(false) == l_DataStatus_0.Failed then
                v18[v84](l_DataStatus_0.NotReady);
            end;
        end;
    end;
    local function v94(v87) --[[ Line: 190 ]] --[[ Name: markItemsAsFailed ]]
        -- upvalues: v15 (copy), v9 (ref), v18 (ref), l_DataStatus_0 (ref), v19 (ref), v5 (ref)
        local v88 = os.clock() + v15;
        if v9 then
            local function v91() --[[ Line: 193 ]] --[[ Name: batchUpdate ]]
                -- upvalues: v87 (copy), v18 (ref), l_DataStatus_0 (ref), v19 (ref), v88 (copy)
                for _, v90 in v87 do
                    if v18[v90] then
                        v18[v90](l_DataStatus_0.Failed);
                    end;
                    v19[v90] = v88;
                end;
            end;
            v5.batch(v91);
            return;
        else
            for _, v93 in v87 do
                if v18[v93] then
                    v18[v93](l_DataStatus_0.Failed);
                end;
                v19[v93] = v88;
            end;
            return;
        end;
    end;
    local function v95() --[[ Line: 212 ]] --[[ Name: clear ]]
        -- upvalues: v19 (ref), v16 (ref), v17 (ref), v18 (ref)
        v19 = {};
        v16 = {};
        v17 = {};
        v18 = {};
    end;
    local v96 = l_getLocalPlayerUserId_0();
    local v98 = l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 220 ]]
        -- upvalues: l_getLocalPlayerUserId_0 (ref), v96 (ref), v95 (copy)
        local v97 = l_getLocalPlayerUserId_0();
        if v97 ~= v96 then
            v96 = v97;
            v95();
        end;
    end);
    local function v99() --[[ Line: 228 ]] --[[ Name: dispose ]]
        -- upvalues: v98 (ref), v95 (copy)
        if v98 then
            v98:Disconnect();
            v98 = nil;
        end;
        v95();
    end;
    return {
        getItem = v32, 
        getItems = v41, 
        updateItems = v67, 
        updateItem = v73, 
        replaceItems = v53, 
        replaceItem = if l_FFlagLuaAppDataHydrationDataCacheReplaceItem_0 then v78 else nil, 
        markItemsAsFailed = v94, 
        resetFailedItem = v81, 
        resetFailedItems = v86, 
        clear = v95, 
        dispose = v99
    };
end;