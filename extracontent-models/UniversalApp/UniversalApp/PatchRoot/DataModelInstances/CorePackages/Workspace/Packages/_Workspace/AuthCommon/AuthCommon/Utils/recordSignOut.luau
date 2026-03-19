local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local v1 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local _ = require(l_script_FirstAncestor_0.Utils.PreviousAccountEntry);
local v3 = require(l_script_FirstAncestor_0.Thunks.User);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_script_FirstAncestor_0.Utils.prunePreviousAccountsList);
return function(v7, v8) --[[ Line: 16 ]] --[[ Name: recordSignOut ]]
    -- upvalues: v3 (copy), v1 (copy), v5 (copy), v6 (copy)
    local v9 = nil;
    local v10 = v8 or true;
    if not v7 then
        local v11 = v3.fromLocalStorage();
        if v11 == nil or v11.userId == -1 then
            return;
        elseif v11.username == nil or v11.username == "" then
            return;
        else
            v9 = v11;
        end;
    else
        v9 = {
            userId = v7.user_id, 
            username = v7.username, 
            displayName = v7.display_name
        };
    end;
    local v12 = v1.getPreviousAccountsList();
    local v13 = tostring(v9.userId);
    local v14 = v12[v13];
    if v14 then
        v12[v13] = v5.Dictionary.join(v14, {
            userId = v13, 
            username = v9.username, 
            displayName = if v9.displayName and v9.displayName ~= "nil" then v9.displayName else "", 
            signOutTimestamp = os.time(), 
            showInAccountPicker = v10
        });
        v1.setPreviousAccountsList(v12);
        v6();
        return true;
    else
        v12[v13] = {
            userId = v13, 
            username = v9.username, 
            userIdentifier = v9.username, 
            loginMethod = nil, 
            signInTimestamp = nil, 
            displayName = if v9.displayName and v9.displayName ~= "nil" then v9.displayName else "", 
            signOutTimestamp = os.time(), 
            showInAccountPicker = v10
        };
        v1.setPreviousAccountsList(v12);
        v6();
        return true;
    end;
end;