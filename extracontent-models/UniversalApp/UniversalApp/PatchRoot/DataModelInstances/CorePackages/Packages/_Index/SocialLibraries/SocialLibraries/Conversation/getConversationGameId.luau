local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_UserModel_0 = require(l_script_FirstAncestor_0.dependencies).UserModel;
return function(v2, v3, v4) --[[ Line: 7 ]]
    -- upvalues: l_UserModel_0 (copy)
    if v2.pinnedGame and v2.pinnedGame.universeId then
        return (tostring(v2.pinnedGame.universeId));
    else
        local v5 = {};
        local l_pairs_0 = pairs;
        local v7 = v2.participants or {};
        for _, v9 in l_pairs_0(v7) do
            local v10 = v4[v9];
            if v10 ~= nil and v9 ~= v3 and v10.presence == l_UserModel_0.PresenceType.IN_GAME and v10.rootPlaceId then
                v5[v10.rootPlaceId] = v5[v10.rootPlaceId] or 0;
                v5[v10.rootPlaceId] = v5[v10.rootPlaceId] + 1;
            end;
        end;
        l_pairs_0 = nil;
        v7 = 0;
        for v11, v12 in pairs(v5) do
            if v7 < v12 then
                l_pairs_0 = v11;
                v7 = v12;
            end;
        end;
        return l_pairs_0 and tostring(l_pairs_0) or nil;
    end;
end;