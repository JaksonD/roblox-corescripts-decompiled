local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Set_0 = require(l_Parent_0.llama).Set;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.UserMuted);
local v6 = require(l_Actions_0.UserUnmuted);
return v2.createReducer({}, {
    [v5.name] = function(v7, v8) --[[ Line: 16 ]]
        -- upvalues: l_Set_0 (copy)
        return l_Set_0.add(v7, v8.userId);
    end, 
    [v6.name] = function(v9, v10) --[[ Line: 20 ]]
        -- upvalues: l_Set_0 (copy)
        return l_Set_0.subtract(v9, v10.userId);
    end
});