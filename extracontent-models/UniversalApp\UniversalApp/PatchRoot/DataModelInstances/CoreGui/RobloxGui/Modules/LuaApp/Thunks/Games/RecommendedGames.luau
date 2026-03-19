local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_SetNetworkingErrorToast_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_parseAndAddGameInfos_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).parseAndAddGameInfos;
local l_GameInfoModel_0 = require(l_CorePackages_0.Workspace.Packages.GameModels).GameInfoModel;
local l_TopicContentsEntryModel_0 = require(l_CorePackages_0.Workspace.Packages.TopicContentsRodux).TopicContentsEntryModel;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v9 = require(l_Modules_0.LuaApp.Actions.Games.SetRecommendedGameEntries);
local v10 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GameGetRecommendedGames);
local v11 = {};
local function v13(v12) --[[ Line: 18 ]] --[[ Name: fetchKeymapper ]]
    return "RecommendedGames" .. v12;
end;
v11.Fetch = function(v14, v15, v16) --[[ Line: 22 ]] --[[ Name: Fetch ]]
    -- upvalues: l_PerformFetch_0 (copy), v10 (copy), l_TopicContentsEntryModel_0 (copy), v1 (copy), l_parseAndAddGameInfos_0 (copy), l_GameInfoModel_0 (copy), v9 (copy), v2 (copy), l_SetNetworkingErrorToast_0 (copy)
    assert(type(v15) == "string", "RecommendedGames thunk expects universeId to be a string");
    assert(type(v16) == "table", "RecommendedGames thunk expects argTable to be a table");
    return l_PerformFetch_0.Single("RecommendedGames" .. v15, function(v17) --[[ Line: 26 ]]
        -- upvalues: v10 (ref), v14 (copy), v15 (copy), v16 (copy), l_TopicContentsEntryModel_0 (ref), v1 (ref), l_parseAndAddGameInfos_0 (ref), l_GameInfoModel_0 (ref), v9 (ref), v2 (ref), l_SetNetworkingErrorToast_0 (ref)
        return v10(v14, v15, v16):andThen(function(v18) --[[ Line: 27 ]]
            -- upvalues: v15 (ref), l_TopicContentsEntryModel_0 (ref), v1 (ref), l_parseAndAddGameInfos_0 (ref), v14 (ref), v17 (copy), l_GameInfoModel_0 (ref), v9 (ref), v2 (ref)
            local v19 = {};
            local l_responseBody_0 = v18.responseBody;
            if #l_responseBody_0.games == 0 then
                warn("Found no recommended games related to universe", v15);
            end;
            local function v26(v21, v22) --[[ Line: 36 ]] --[[ Name: forEachGameInfo ]]
                -- upvalues: l_TopicContentsEntryModel_0 (ref), v1 (ref), v19 (copy)
                l_TopicContentsEntryModel_0.fromGamesApiData(v21):match(function(v23) --[[ Line: 40 ]]
                    -- upvalues: v1 (ref), v22 (copy), v19 (ref)
                    local v24 = v1.Dictionary.join(v22, v23);
                    table.insert(v19, v24);
                end):matchError(function(v25) --[[ Line: 44 ]]
                    warn(v25);
                end);
            end;
            l_parseAndAddGameInfos_0(v14, v17, l_responseBody_0.games, l_GameInfoModel_0.fromGamesApi, v26);
            v17:dispatch(v9(v15, v19));
            return v2.resolve(v18);
        end, function(v27) --[[ Line: 54 ]]
            -- upvalues: v17 (copy), l_SetNetworkingErrorToast_0 (ref), v2 (ref)
            v17:dispatch(l_SetNetworkingErrorToast_0(v27));
            return v2.reject(v27);
        end);
    end);
end;
v11.GetFetchingStatus = function(v28, v29) --[[ Line: 61 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v28, "RecommendedGames" .. v29);
end;
v11.KeyMapper = v13;
return v11;