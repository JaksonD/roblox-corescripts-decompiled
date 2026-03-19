local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Thunk);
local v2 = require(l_Parent_0.Services.Analytics);
local v3 = require(l_Parent_0.UtilityFunctions);
local v4 = require(l_Parent_0.Thunks.SendCounter);
local v5 = require(l_Parent_0.Constants);
local v6 = {
    v2
};
return function(v7) --[[ Line: 18 ]] --[[ Name: ReportOpenDetailsPage ]]
    -- upvalues: v1 (copy), v6 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    return v1.new(script.Name, v6, function(v8, v9) --[[ Line: 19 ]]
        -- upvalues: v2 (ref), v7 (copy), v3 (ref), v4 (ref), v5 (ref)
        local v10 = v9[v2];
        local v11 = v7 and v7.parentBundleId ~= nil;
        local v12 = nil;
        local v13 = nil;
        if v11 then
            v12 = "Bundle";
            v13 = v3.getBundleId(v7);
        else
            v12 = "Asset";
            v13 = v7.assetId;
        end;
        v10.reportItemDetailPageOpened(v12, v13);
        v8:dispatch(v4(v5.Counters.ItemDetailPageOpened));
    end);
end;