local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Models.User);
local v3 = require(l_script_FirstAncestor_0.Enum.WebPresenceMap);
local l_ConvertUniverseIdToString_0 = require(l_Parent_0.SharedFlags).ConvertUniverseIdToString;
game:DefineFastFlag("LuaAppFixActiveGameLoadingCheck", false);
return function(v5, v6) --[[ Line: 10 ]]
    -- upvalues: l_ConvertUniverseIdToString_0 (copy), v3 (copy), v2 (copy)
    local v7 = {};
    if game:GetFastFlag("LuaAppFixActiveGameLoadingCheck") and not v6:getState().UniversePlaceInfos then
        return v7;
    else
        for _, v9 in pairs(v5) do
            local v10 = l_ConvertUniverseIdToString_0(v9.universeId);
            if v3[v9.userPresenceType] == v2.PresenceType.IN_GAME and not v6:getState().UniversePlaceInfos[v10] then
                table.insert(v7, v9.placeId);
            end;
        end;
        return v7;
    end;
end;