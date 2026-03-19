local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.PlayerAdded);
local v6 = require(l_Actions_0.PlayerRemoved);
return v2.createReducer({}, {
    [v5.name] = function(v7, v8) --[[ Line: 15 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local v9 = string.lower(v8.username);
        return l_Dictionary_0.join(v7, {
            [v9] = v8.userId
        });
    end, 
    [v6.name] = function(v10, v11) --[[ Line: 22 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.filter(v10, function(v12) --[[ Line: 23 ]]
            -- upvalues: v11 (copy)
            return v12 ~= v11.userId;
        end);
    end
});