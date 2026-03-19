local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxCall");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_CallStateModel_0 = require(l_script_FirstAncestor_0.Models).CallStateModel;
local l_UpdateCall_0 = require(l_script_FirstAncestor_0.Actions).UpdateCall;
local _ = require(script.Parent.Parent.roduxCallTypes);
return function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_UpdateCall_0 (copy), l_CallStateModel_0 (copy)
    return v2.createReducer(nil, {
        [l_UpdateCall_0.name] = function(_, v7) --[[ Line: 13 ]]
            -- upvalues: l_CallStateModel_0 (ref)
            local l_call_0 = v7.payload.call;
            return l_CallStateModel_0.format(l_call_0);
        end
    });
end;