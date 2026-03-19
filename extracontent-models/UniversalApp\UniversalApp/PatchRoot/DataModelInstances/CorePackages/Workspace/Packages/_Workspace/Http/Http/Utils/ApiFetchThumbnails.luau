local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.ArgCheck);
local l_PromiseUtilities_0 = require(l_Parent_0.AppCommonLib).Utils.PromiseUtilities;
local v5 = require(script.Parent.FetchSubdividedThumbnails);
local v6 = require(l_script_FirstAncestor_0.PerformFetch);
local function _(v7) --[[ Line: 15 ]] --[[ Name: convertToId ]]
    return (tostring(v7));
end;
local v9 = {};
local function v14(v10) --[[ Line: 21 ]]
    local l_targetId_0 = v10.targetId;
    local v12 = v10.iconSize and "." .. v10.iconSize or "";
    local v13 = v10.requestName and "." .. v10.requestName or "";
    return "luaapp.thumbnails." .. tostring(l_targetId_0) .. v12 .. v13;
end;
v9.KeyMapper = v14;
local function v19(v15, v16) --[[ Line: 30 ]] --[[ Name: subdivideIdsArray ]]
    -- upvalues: v2 (copy)
    local v17 = {};
    for v18 = 1, #v15, v16 do
        table.insert(v17, (v2.List.getRange(v15, v18, v18 + v16 - 1)));
    end;
    return v17;
end;
v9.Fetch = function(v20, v21, v22, v23, v24, v25, v26) --[[ Line: 39 ]] --[[ Name: Fetch ]]
    -- upvalues: v3 (copy), v19 (copy), v5 (copy), v14 (copy), l_PromiseUtilities_0 (copy)
    local v27 = v22 or "150x150";
    v3.isType(v21, "table", "targetIds");
    v3.isType(v23, "string", "requestName");
    v3.isNonNegativeNumber(#v21, "targetIds count");
    local v28 = {};
    local v29 = {};
    for _, v31 in pairs(v21) do
        table.insert(v28, {
            targetId = v31, 
            iconSize = v27, 
            requestName = v23
        });
    end;
    local v32 = v19(v28, 100);
    for _, v34 in ipairs(v32) do
        table.insert(v29, v26:dispatch(v5.Fetch(v20, v34, v14, v23, v24, v25)));
    end;
    return l_PromiseUtilities_0.Batch(v29);
end;
v9.GetFetchingStatus = function(v35, v36, v37, v38) --[[ Line: 75 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: v6 (copy)
    local l_GetStatus_0 = v6.GetStatus;
    local l_v35_0 = v35;
    local v41 = {
        targetId = v36, 
        requestName = v38, 
        iconSize = v37
    };
    local l_targetId_1 = v41.targetId;
    local v43 = v41.iconSize and "." .. v41.iconSize or "";
    local v44 = v41.requestName and "." .. v41.requestName or "";
    return l_GetStatus_0(l_v35_0, "luaapp.thumbnails." .. tostring(l_targetId_1) .. v43 .. v44);
end;
return v9;