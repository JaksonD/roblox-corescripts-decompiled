local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.PlayerAdded);
local v6 = require(l_Actions_0.PlayerRemoved);
return v2.createReducer({}, {
    [v5.name] = function(v7, v8) --[[ Line: 19 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v7, {
            [v8.userId] = {
                userId = v8.userId, 
                username = v8.username, 
                displayName = v8.displayName
            }
        });
    end, 
    [v6.name] = function(v9, v10) --[[ Line: 29 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.removeKey(v9, v10.userId);
    end
});