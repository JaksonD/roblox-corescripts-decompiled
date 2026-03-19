local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local v1 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
return function(v4, v5) --[[ Line: 7 ]] --[[ Name: updateLoginEntryData ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v6 = v1.getPreviousAccountsList();
    local v7 = v6[v4];
    if v7 then
        v6[v4] = v3.Dictionary.join(v7, v5);
    end;
    v1.setPreviousAccountsList(v6);
    return true;
end;