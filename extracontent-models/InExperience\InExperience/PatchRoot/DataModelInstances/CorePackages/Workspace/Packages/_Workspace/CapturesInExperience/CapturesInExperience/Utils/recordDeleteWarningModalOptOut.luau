local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.Dash);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_Parent_0.Analytics.EventNames);
local v7 = require(l_Parent_0.Utils.getLocalUserId);
local v8 = require(l_Parent_0.Utils.getUserIdsFromString);
return function(v9) --[[ Line: 14 ]]
    -- upvalues: l_AppStorageService_0 (copy), v5 (copy), v8 (copy), v7 (copy), l_Players_0 (copy), v4 (copy), v6 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 15 ]]
        -- upvalues: l_AppStorageService_0 (ref), v5 (ref)
        return l_AppStorageService_0:GetItem(v5.DeleteWarningModalOptOutStorageKey);
    end);
    if not l_status_0 then
        return;
    else
        local v12 = v8(l_result_0);
        v12[v7(l_Players_0) or ""] = true;
        local v13 = table.concat(v4.keys(v12), ",");
        local l_status_1, _ = pcall(function() --[[ Line: 28 ]]
            -- upvalues: l_AppStorageService_0 (ref), v5 (ref), v13 (copy)
            l_AppStorageService_0:SetItem(v5.DeleteWarningModalOptOutStorageKey, v13);
            l_AppStorageService_0:Flush();
        end);
        if not l_status_1 then
            return;
        else
            v9.fireEvent(v6.CapturesDeleteWarningModalOptedOut);
            return;
        end;
    end;
end;