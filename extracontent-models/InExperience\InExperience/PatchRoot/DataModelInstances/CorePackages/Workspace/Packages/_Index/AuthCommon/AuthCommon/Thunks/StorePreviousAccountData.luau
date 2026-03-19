local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local v1 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local v2 = require(l_script_FirstAncestor_0.Thunks.User);
return function() --[[ Line: 5 ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v3 = v2.fromLocalStorage();
    if v3 == nil or v3.userId == -1 then
        return;
    elseif v3.username == nil or v3.username == "" then
        return;
    else
        local v4 = v1.getPreviousAccountsList();
        v4[tostring(v3.userId)] = {
            username = v3.username, 
            displayName = if v3.displayName and v3.displayName ~= "nil" then v3.displayName else "", 
            timestamp = os.time()
        };
        v1.setPreviousAccountsList(v4);
        v1.flush();
        return;
    end;
end;