local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Immutable);
local l_ConvertUniverseIdToString_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).ConvertUniverseIdToString;
local l_ReceivedUserPresence_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Actions.ReceivedUserPresence;
local v5 = require(l_Modules_0.LuaApp.Models.User);
return function(v6, v7) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), l_ReceivedUserPresence_0 (copy), v5 (copy), l_ConvertUniverseIdToString_0 (copy)
    v6 = v6 or {};
    local function _(v8, v9) --[[ Line: 13 ]] --[[ Name: RemoveUserIdFromMap ]]
        -- upvalues: v6 (ref), v2 (ref)
        if v9 then
            local v10 = v6[tostring(v9)];
            if v10 then
                v6 = v2.Set(v6, tostring(v9), v2.RemoveFromDictionary(v10, v8));
            end;
        end;
    end;
    local function v15(v12, v13) --[[ Line: 26 ]] --[[ Name: AddUserIdToMap ]]
        -- upvalues: v6 (ref), v2 (ref)
        local v14 = v6[v13] or {};
        v6 = v2.JoinDictionaries(v6, {
            [v13] = v2.JoinDictionaries(v14, {
                [v12] = v12
            })
        });
    end;
    if v7.type == l_ReceivedUserPresence_0.name then
        local v16 = tostring(v7.userId);
        local v17 = tostring(v7.previousUniverseId);
        if v7.presence == v5.PresenceType.IN_GAME then
            local v18 = l_ConvertUniverseIdToString_0(v7.universeId);
            if v17 and v18 ~= v17 and v17 then
                local v19 = v6[tostring(v17)];
                if v19 then
                    v6 = v2.Set(v6, tostring(v17), v2.RemoveFromDictionary(v19, v16));
                end;
            end;
            v15(v16, v18);
        elseif v17 then
            local v20 = v6[tostring(v17)];
            if v20 then
                v6 = v2.Set(v6, tostring(v17), v2.RemoveFromDictionary(v20, v16));
            end;
        end;
    end;
    return v6;
end;