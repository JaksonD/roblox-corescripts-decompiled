local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_script_FirstAncestor_0.Stores.createGroupsListStore);
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v6) --[[ Line: 31 ]] --[[ Name: useGroupsListData ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    local v7 = v2.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v4 (ref)
        return v4();
    end, {});
    local v8 = v3.useSignalState(v7.getState);
    v2.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: v6 (copy), v7 (copy)
        if not v6 or v6 == "" then
            v7.reset();
            return;
        else
            v7.fetchGroups(v6);
            return function() --[[ Line: 49 ]]
                -- upvalues: v7 (ref)
                v7.reset();
            end;
        end;
    end, {
        v7, 
        v6
    });
    return v8;
end;