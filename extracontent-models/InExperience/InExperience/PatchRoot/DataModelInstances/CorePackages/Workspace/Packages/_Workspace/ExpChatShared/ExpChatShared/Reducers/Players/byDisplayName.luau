local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_List_0 = require(l_Parent_0.llama).List;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v6 = require(l_Actions_0.PlayerAdded);
local v7 = require(l_Actions_0.PlayerRemoved);
return v2.createReducer({}, {
    [v6.name] = function(v8, v9) --[[ Line: 16 ]]
        -- upvalues: l_Dictionary_0 (copy), l_List_0 (copy)
        local v10 = string.lower(v9.displayName);
        return l_Dictionary_0.join(v8, {
            [v10] = l_List_0.append(v8[v10] or {}, v9.userId)
        });
    end, 
    [v7.name] = function(v11, v12) --[[ Line: 23 ]]
        -- upvalues: l_Dictionary_0 (copy), l_List_0 (copy)
        return l_Dictionary_0.map(v11, function(v13) --[[ Line: 24 ]]
            -- upvalues: l_List_0 (ref), v12 (copy)
            return l_List_0.removeValue(v13, v12.userId);
        end);
    end
});