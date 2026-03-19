local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_INTERVENTION_TYPES_0 = require(l_Parent_0.NotApprovedPageState).Constants.INTERVENTION_TYPES;
local v3 = require(l_Parent_0.MockableProxyServices);
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v5, v6, v7) --[[ Line: 20 ]] --[[ Name: canReactivate ]]
    -- upvalues: v3 (copy), l_INTERVENTION_TYPES_0 (copy)
    if v7 ~= "" then
        return true;
    else
        local v8 = v3.Workspace:GetServerTimeNow() * 1000;
        local v9 = DateTime.fromIsoDate(v6);
        local v10 = v9 and v9.UnixTimestampMillis < v8;
        if v5 == l_INTERVENTION_TYPES_0.Warning then
            return true;
        elseif v5 == l_INTERVENTION_TYPES_0.Banned and v10 then
            return true;
        else
            return false;
        end;
    end;
end;