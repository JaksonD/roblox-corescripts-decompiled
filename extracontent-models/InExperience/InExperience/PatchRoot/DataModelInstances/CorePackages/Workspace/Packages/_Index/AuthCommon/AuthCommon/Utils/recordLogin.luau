local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local v1 = require(l_script_FirstAncestor_0.Models.LoginResult);
local v2 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local _ = require(l_script_FirstAncestor_0.Utils.PreviousAccountEntry);
local v4 = require(l_script_FirstAncestor_0.Utils.prunePreviousAccountsList);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.Cryo);
return function(v7, v8, v9) --[[ Line: 10 ]] --[[ Name: recordLogin ]]
    -- upvalues: v2 (copy), v1 (copy), v6 (copy), v4 (copy)
    if v7.user.id == nil or v7.user.id == "0" then
        return false;
    elseif v7.user.name == nil or v7.user.name == "" then
        return false;
    else
        local v10 = v2.getPreviousAccountsList();
        local l_v9_0 = v9;
        if l_v9_0 == nil then
            l_v9_0 = v7.user.name;
        end;
        local v12 = os.time();
        local v13 = v1.hasTwoStepData(v7);
        if v13 then
            v12 = nil;
        end;
        local v14 = {
            userId = v7.user.id, 
            userIdentifier = l_v9_0, 
            loginMethod = v8, 
            username = v7.user.name, 
            signInTimestamp = v12, 
            showInAccountPicker = true
        };
        local v15 = v10[v7.user.id];
        if v15 ~= nil then
            if not v13 then
                v14.signOutTimestamp = v6.None;
            end;
            v10[v7.user.id] = v6.Dictionary.join(v15, v14);
        else
            v10[v7.user.id] = v14;
        end;
        v2.setPreviousAccountsList(v10);
        v4();
        return true;
    end;
end;