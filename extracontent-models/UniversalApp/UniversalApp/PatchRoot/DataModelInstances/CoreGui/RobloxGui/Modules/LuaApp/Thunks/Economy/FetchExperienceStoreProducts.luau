local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamePasses);
local v2 = require(l_Modules_0.LuaApp.Thunks.DeveloperProduct.ApiFetchGameDeveloperProducts);
local v3 = require(l_Modules_0.LuaApp.Thunks.Subscription.ApiFetchGameSubscriptionProducts);
return function(v4, v5) --[[ Line: 13 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    if type(v5) ~= "string" then
        error(string.format("FetchExperienceStoreProducts thunk expects universeId to be a string. Got type: '%s', value: '%s'", type(v5), (tostring(v5))));
    end;
    return function(v6) --[[ Line: 24 ]]
        -- upvalues: v1 (ref), v4 (copy), v5 (copy), v3 (ref), v2 (ref)
        v6:dispatch(v1(v4, v5));
        v6:dispatch(v3(v4, v5));
        local v7 = v6:getState();
        local l_GameDetailsV2_0 = v7.GameDetailsV2;
        local v9 = l_GameDetailsV2_0 and l_GameDetailsV2_0[v5];
        if not v9 or not v9.rootPlaceId then
            local l_GameDetails_0 = v7.GameDetails;
            v9 = l_GameDetails_0 and l_GameDetails_0[v5];
        end;
        if v9 and v9.rootPlaceId and v7.LocalUserId then
            v6:dispatch(v2(v4, v5, v9.rootPlaceId, v7.LocalUserId));
        end;
    end;
end;