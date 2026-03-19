local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Thunk);
local v2 = require(l_Parent_0.Services.Analytics);
local v3 = require(l_Parent_0.Actions.SetTryingOnInfo);
local v4 = require(l_Parent_0.Thunks.SendCounter);
local v5 = require(l_Parent_0.Constants);
local v6 = {
    v2
};
return function(v7, v8, v9, v10, v11) --[[ Line: 18 ]] --[[ Name: TryOnItem ]]
    -- upvalues: v1 (copy), v6 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    return v1.new(script.Name, v6, function(v12, v13) --[[ Line: 19 ]]
        -- upvalues: v2 (ref), v10 (copy), v11 (copy), v8 (copy), v3 (ref), v7 (copy), v9 (copy), v4 (ref), v5 (ref)
        local v14 = v13[v2];
        local v15 = nil;
        local v16 = nil;
        if v10 then
            v15 = "Bundle";
            v16 = v11;
        else
            v15 = "Asset";
            v16 = v8;
        end;
        v14.reportTryOnButtonClicked(v15, v16);
        v12:dispatch(v3(v7, v8, v9));
        v12:dispatch(v4(v5.Counters.TryOnButtonClicked));
    end);
end;