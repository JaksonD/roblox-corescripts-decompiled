local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGameIsFavorite);
local v9 = require(l_Modules_0.LuaApp.Thunks.ApiFetchGameFollowingStatus);
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local v11 = require(l_Modules_0.LuaApp.Flags.FFlagUseImprovedGameProtocolMessages);
local v12 = v2.PureComponent:extend("ReturnFromGameReceiver");
v12.init = function(v13) --[[ Line: 23 ]] --[[ Name: init ]]
    -- upvalues: l_MessageBus_0 (copy), v6 (copy), v11 (copy)
    v13.launchedUniverseId = nil;
    v13.reloadFavoriteAndFollowing = function() --[[ Line: 26 ]]
        -- upvalues: v13 (copy)
        local l_networking_0 = v13.props.networking;
        local l_launchedUniverseId_0 = v13.launchedUniverseId;
        return v13.props.fetchFavoriteAndFollowingData(l_networking_0, l_launchedUniverseId_0);
    end;
    v13.returnedFromGame = function() --[[ Line: 32 ]]
        -- upvalues: v13 (copy)
        if v13.props.onGameReturned then
            v13.props.onGameReturned(v13.launchedUniverseId);
        end;
        v13:reloadFavoriteAndFollowing();
    end;
    v13.subscriber = l_MessageBus_0.Subscriber.new();
    v13.subscriber:subscribe({
        mid = l_MessageBus_0.getMessageId("Game", "onGameLeave"), 
        validateParams = v6.table
    }, function(v16) --[[ Line: 43 ]]
        -- upvalues: v11 (ref), v13 (copy)
        if v11 then
            v13.launchedUniverseId = nil;
            if v13.props.games then
                for v17, v18 in pairs(v13.props.games) do
                    if v18.placeId == tostring(v16.placeId) then
                        v13.launchedUniverseId = tostring(v17);
                    end;
                end;
            end;
        end;
        if v13.launchedUniverseId then
            v13:returnedFromGame();
            v13.launchedUniverseId = nil;
        end;
    end);
    if not v11 then
        v13.subscriber:subscribe({
            mid = l_MessageBus_0.getMessageId("Game", "launch"), 
            validateParams = v6.table
        }, function(v19) --[[ Line: 64 ]]
            -- upvalues: v13 (copy)
            if v19.placeId then
                v13.launchedUniverseId = nil;
                if v13.props.games then
                    for v20, v21 in pairs(v13.props.games) do
                        if v21.placeId == tostring(v19.placeId) then
                            v13.launchedUniverseId = tostring(v20);
                            return;
                        end;
                    end;
                end;
                if v13.props.gameDetails then
                    for v22, v23 in pairs(v13.props.gameDetails) do
                        if v23.rootPlaceId == tostring(v19.placeId) then
                            v13.launchedUniverseId = tostring(v22);
                            return;
                        end;
                    end;
                end;
            end;
        end);
    end;
end;
v12.render = function(_) --[[ Line: 94 ]] --[[ Name: render ]]

end;
v12 = l_RoactServices_0.connect({
    networking = v7
})(v12);
return v3.connect(function(v25) --[[ Line: 100 ]]
    -- upvalues: l_GameInfosReducer_0 (copy)
    return {
        games = v25.Personalization[l_GameInfosReducer_0.key], 
        gameDetails = v25.GameDetails
    };
end, function(v26) --[[ Line: 106 ]]
    -- upvalues: v8 (copy), v9 (copy)
    return {
        fetchFavoriteAndFollowingData = function(v27, v28) --[[ Line: 108 ]] --[[ Name: fetchFavoriteAndFollowingData ]]
            -- upvalues: v26 (copy), v8 (ref), v9 (ref)
            v26(v8(v27, v28));
            v26(v9(v27, v28));
        end
    };
end)(v12);