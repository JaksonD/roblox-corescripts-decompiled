local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.Actions.SetDevSubs);
local v5 = require(l_Modules_0.LuaApp.Http.Requests.GetDevSubs);
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local v7 = require(l_Modules_0.LuaApp.Enum.DevSubStatus);
local v8 = require(l_Modules_0.LuaApp.Types.DevSubTypes);
local v9 = require(l_Modules_0.LuaApp.Models.DevSub);
local v10 = {};
local function v11(v12, v13, v14, v15, v16) --[[ Line: 20 ]] --[[ Name: getSubscriptionData ]]
    -- upvalues: v5 (copy), v8 (copy), v11 (copy)
    v15 = v15 or {
        subscriptions = {}, 
        games = {}, 
        plans = {}
    };
    return v5(v12, v13, v14, v16):andThen(function(v17) --[[ Line: 27 ]]
        -- upvalues: v8 (ref), v15 (ref), v11 (ref), v12 (copy), v13 (copy), v14 (copy)
        if not v8.SubscriptionsResponseCheck(v17.responseBody) then
            return nil, false;
        else
            for _, v19 in pairs(v17.responseBody.data) do
                v15.subscriptions[v19.id] = v19;
            end;
            for _, v21 in pairs(v17.responseBody.auxiliaryData.plans) do
                v15.plans[v21.id] = v21;
            end;
            for _, v23 in pairs(v17.responseBody.auxiliaryData.universes) do
                v15.games[v23.id] = v23;
            end;
            local l_nextPageCursor_0 = v17.responseBody.nextPageCursor;
            if l_nextPageCursor_0 then
                return v11(v12, v13, v14, v15, l_nextPageCursor_0);
            else
                return v15, true;
            end;
        end;
    end);
end;
local function _(v25, v26) --[[ Line: 53 ]] --[[ Name: getAllSubscriptionData ]]
    -- upvalues: v11 (copy), v7 (copy)
    return v11(v25, v26, v7.Active):andThen(function(v27) --[[ Line: 54 ]]
        -- upvalues: v11 (ref), v25 (copy), v26 (copy), v7 (ref)
        return v11(v25, v26, v7.Inactive, v27);
    end);
end;
v10.Fetch = function(v29) --[[ Line: 59 ]] --[[ Name: Fetch ]]
    -- upvalues: l_PerformFetch_0 (copy), v11 (copy), v7 (copy), v2 (copy), l_ApiFetchGameIcons_0 (copy), v9 (copy), v4 (copy)
    local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
    assert(l_LocalPlayer_0);
    local l_UserId_0 = l_LocalPlayer_0.UserId;
    return l_PerformFetch_0.Single("DevSubs", function(v32) --[[ Line: 64 ]]
        -- upvalues: v29 (copy), l_UserId_0 (copy), v11 (ref), v7 (ref), v2 (ref), l_ApiFetchGameIcons_0 (ref), v9 (ref), v4 (ref)
        local l_v29_0 = v29;
        local l_l_UserId_0_0 = l_UserId_0;
        return v11(l_v29_0, l_l_UserId_0_0, v7.Active):andThen(function(v35) --[[ Line: 54 ]]
            -- upvalues: v11 (ref), l_v29_0 (copy), l_l_UserId_0_0 (copy), v7 (ref)
            return v11(l_v29_0, l_l_UserId_0_0, v7.Inactive, v35);
        end):andThen(function(v36, v37) --[[ Line: 66 ]]
            -- upvalues: v2 (ref), v32 (copy), l_ApiFetchGameIcons_0 (ref), v29 (ref), v9 (ref), v4 (ref)
            if not v37 then
                return v2.resolve();
            else
                local v38 = {};
                for v39, _ in pairs(v36.games) do
                    table.insert(v38, v39);
                end;
                v32:dispatch(l_ApiFetchGameIcons_0(v29, v38));
                local v41 = {};
                for _, v43 in pairs(v36.subscriptions) do
                    v43.planData = v36.plans[v43.planId];
                    if v43.planData then
                        v43.gameData = v36.games[v43.planData.universeId];
                        if v43.gameData then
                            table.insert(v41, v9.fromJsonData(v43));
                        end;
                    end;
                end;
                v32:dispatch(v4(v41));
                return v2.resolve();
            end;
        end, function(v44) --[[ Line: 102 ]]
            -- upvalues: v2 (ref)
            return v2.reject(v44);
        end);
    end);
end;
v10.GetFetchingStatus = function(v45) --[[ Line: 108 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v45, "DevSubs");
end;
return v10;