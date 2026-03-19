local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.context);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("Commands");
local _ = require(l_script_FirstAncestor_1.types);
local function v10(v6, v7) --[[ Line: 10 ]] --[[ Name: matchesAlias ]]
    for _, v9 in pairs(v6) do
        if string.find(v7, "^" .. v9 .. " ") then
            return true;
        end;
    end;
    return false;
end;
return function(v11, v12, v13) --[[ Line: 20 ]]
    -- upvalues: v2 (copy), v3 (copy), v10 (copy)
    return v2.try(function() --[[ Line: 21 ]]
        -- upvalues: v3 (ref), v11 (copy), v10 (ref), v13 (copy), v12 (copy), v2 (ref)
        assert(v3.store, "Store should exist");
        local v14 = v3.store:getState().AutoCastCommands[v11.name];
        if v10(v14, v13) then
            local v15 = v11.clientRun(v3.store, v12, v13);
            if v15 and string.find(v15.metadata, "Success") then
                return v2.resolve(v15);
            end;
        end;
        return v2.reject();
    end);
end;