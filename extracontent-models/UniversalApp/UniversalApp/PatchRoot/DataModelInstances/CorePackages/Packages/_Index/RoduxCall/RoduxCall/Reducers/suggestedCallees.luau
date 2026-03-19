local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxCall");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_SuggestedCalleeModel_0 = require(l_script_FirstAncestor_0.Models).SuggestedCalleeModel;
local l_ClearSuggestedCallees_0 = require(l_script_FirstAncestor_0.Actions).ClearSuggestedCallees;
local _ = require(script.Parent.Parent.roduxCallTypes);
local v6 = {
    suggestedCallees = {}
};
return function(v7) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v6 (copy), l_SuggestedCalleeModel_0 (copy), l_ClearSuggestedCallees_0 (copy)
    local l_NetworkingCall_0 = v7.NetworkingCall;
    return v2.createReducer(v6, {
        [l_NetworkingCall_0.GetSuggestedCallees.Succeeded.name] = function(_, v10) --[[ Line: 14 ]]
            -- upvalues: l_SuggestedCalleeModel_0 (ref)
            local l_suggestedCallees_0 = v10.responseBody.suggestedCallees;
            local v12 = {};
            for _, v14 in ipairs(l_suggestedCallees_0) do
                assert(l_SuggestedCalleeModel_0.isValid(v14));
                local v15 = l_SuggestedCalleeModel_0.format(v14);
                v12[#v12 + 1] = v15;
            end;
            return {
                suggestedCallees = v12
            };
        end, 
        [l_ClearSuggestedCallees_0.name] = function(_, _) --[[ Line: 29 ]]
            -- upvalues: v6 (ref)
            return v6;
        end
    });
end;