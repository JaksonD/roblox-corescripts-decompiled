local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local v3 = require(l_Parent_0.Cryo);
return function(v4) --[[ Line: 7 ]] --[[ Name: record2svCompletion ]]
    -- upvalues: v2 (copy), v3 (copy)
    if v4 == nil or v4 == "0" then
        return false;
    else
        local v5 = v2.getPreviousAccountsList();
        local v6 = v5[v4];
        if v6 then
            v5[v4] = v3.Dictionary.join(v6, {
                signInTimestamp = os.time()
            });
            v2.setPreviousAccountsList(v5);
            return true;
        else
            return false;
        end;
    end;
end;