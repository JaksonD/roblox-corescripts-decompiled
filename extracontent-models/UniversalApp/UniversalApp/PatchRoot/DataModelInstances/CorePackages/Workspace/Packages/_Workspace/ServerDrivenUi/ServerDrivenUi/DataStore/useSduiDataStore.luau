local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.SduiCoreSystem);
local v4 = require(l_script_FirstAncestor_0.DataStore.useSduiSocialData);
return function() --[[ Line: 12 ]] --[[ Name: useSduiDataStore ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v5 = v4();
    return v2.useMemo(function() --[[ Line: 15 ]]
        -- upvalues: v5 (copy)
        return {
            social = v5
        };
    end, {
        v5
    });
end;