local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.AddReverseNudgeToxicUser);
local v6 = require(l_Actions_0.RemoveReverseNudgeToxicUser);
return v2.createReducer({}, {
    [v5.name] = function(v7, v8) --[[ Line: 16 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v7, {
            [v8.toxicUserId] = v8.reverseNudgeType
        });
    end, 
    [v6.name] = function(v9, v10) --[[ Line: 20 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.removeKey(v9, v10.toxicUserId);
    end
});