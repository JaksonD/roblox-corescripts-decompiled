local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.DiscoveryUtils);
local l_logResponseError_0 = v3.logResponseError;
local l_DiscoveryEventErrorLogger_0 = v3.DiscoveryEventErrorLogger;
local v6 = require(l_script_FirstAncestor_0.createDataCache);
local v7 = require(l_script_FirstAncestor_0.createDataResolver);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v9 = require(script.Parent.fetchGameDetails);
local v10 = require(script.Parent.GameInfoStoreTypes);
local l_FFlagLuaAppInExperienceDetailsPrompt_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppInExperienceDetailsPrompt;
local l_FFlagLuaAppDataHydrationPlayerCountGameInfoStore_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDataHydrationPlayerCountGameInfoStore;
local l_GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds_0 = require(l_Parent_0.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds;
local l_FFlagLuaAppDataHydrationUpdateItem_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDataHydrationUpdateItem;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local v16 = if l_FFlagLuaAppInExperienceDetailsPrompt_0 then l_GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds_0() else nil;
return function() --[[ Line: 30 ]] --[[ Name: createGameInfoStore ]]
    -- upvalues: l_FFlagLuaAppInExperienceDetailsPrompt_0 (copy), v6 (copy), v16 (copy), v7 (copy), l_logResponseError_0 (copy), l_DiscoveryEventErrorLogger_0 (copy), v2 (copy), v9 (copy), v10 (copy), l_FFlagLuaAppDataHydrationPlayerCountGameInfoStore_0 (copy), l_FFlagLuaAppDataHydrationUpdateItem_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy)
    local v17 = if l_FFlagLuaAppInExperienceDetailsPrompt_0 then v6(v16) else v6();
    local v32 = v7({
        cache = v17, 
        logError = l_FFlagLuaAppInExperienceDetailsPrompt_0 and function(v18) --[[ Line: 37 ]]
            -- upvalues: l_logResponseError_0 (ref), l_DiscoveryEventErrorLogger_0 (ref)
            if type(v18) == "table" then
                if v18.responseCode then
                    l_logResponseError_0("v1/games/universeIds", {
                        StatusCode = tonumber(v18.responseCode)
                    });
                end;
                if v18.errorType and v18.errorMessage then
                    l_DiscoveryEventErrorLogger_0.reportError(v18.errorType, v18.errorMessage, v18.customFields);
                    return;
                end;
            else
                l_DiscoveryEventErrorLogger_0.reportError("FetchGameDetailsError", (tostring(v18)));
            end;
        end or nil, 
        fetchFn = function(v19) --[[ Line: 55 ]] --[[ Name: fetchFn ]]
            -- upvalues: v2 (ref), v9 (ref), l_FFlagLuaAppInExperienceDetailsPrompt_0 (ref), v10 (ref), l_FFlagLuaAppDataHydrationPlayerCountGameInfoStore_0 (ref)
            local v20 = v2.keys(v19);
            return v9(v20):andThen(function(v21) --[[ Line: 60 ]]
                -- upvalues: l_FFlagLuaAppInExperienceDetailsPrompt_0 (ref), v20 (copy), v10 (ref), l_FFlagLuaAppDataHydrationPlayerCountGameInfoStore_0 (ref), v2 (ref)
                if l_FFlagLuaAppInExperienceDetailsPrompt_0 then
                    if not v21 or not v21.responseBody then
                        error({
                            responseCode = v21 and v21.responseCode, 
                            errorType = "FetchGameDetailsResponseError", 
                            errorMessage = v21 and "Missing response body" or "No response", 
                            customFields = {
                                universeIds = v20
                            }
                        });
                    end;
                else
                    if not v21 then
                        error("No response");
                    end;
                    if not v21.responseBody or not v21.responseBody.data then
                        error((("Response Code: %*"):format(v21.reponseCode)));
                    end;
                end;
                if l_FFlagLuaAppInExperienceDetailsPrompt_0 then
                    local v22, v23 = v10.gameInfoResponseValidator(v21.responseBody);
                    if not v22 then
                        error({
                            responseCode = v21.responseCode, 
                            errorType = "FetchGameDetailsResponseInvalidInterface", 
                            errorMessage = v23, 
                            customFields = {
                                universeIds = v20
                            }
                        });
                    end;
                end;
                local v24 = {};
                local l_data_0 = v21.responseBody.data;
                if l_FFlagLuaAppInExperienceDetailsPrompt_0 then
                    for _, v27 in l_data_0 do
                        if v27 then
                            v24[tostring(v27.id)] = {
                                name = v27.name, 
                                rootPlaceId = tostring(v27.rootPlaceId), 
                                universeId = tostring(v27.id), 
                                description = v27.description, 
                                creator = if v27.creator then {
                                    id = tostring(v27.creator.id), 
                                    name = v27.creator.name, 
                                    hasVerifiedBadge = v27.creator.hasVerifiedBadge
                                } else nil, 
                                playerCount = if l_FFlagLuaAppDataHydrationPlayerCountGameInfoStore_0 then v27.playing else nil
                            };
                        end;
                    end;
                    for _, v29 in v20 do
                        if not v24[tostring(v29)] then
                            v24[tostring(v29)] = {
                                isUnavailable = true
                            };
                        end;
                    end;
                    return v24;
                else
                    v2.forEach(l_data_0, function(v30) --[[ Line: 123 ]]
                        -- upvalues: v24 (copy), l_FFlagLuaAppDataHydrationPlayerCountGameInfoStore_0 (ref)
                        v24[tostring(v30.id)] = {
                            name = v30.name, 
                            rootPlaceId = tostring(v30.rootPlaceId), 
                            universeId = tostring(v30.id), 
                            playerCount = if l_FFlagLuaAppDataHydrationPlayerCountGameInfoStore_0 then v30.playing else nil
                        };
                    end);
                    return v24;
                end;
            end):catch(function(v31) --[[ Line: 137 ]]
                error(v31);
            end);
        end
    });
    local function v33() --[[ Line: 143 ]] --[[ Name: clear ]]
        -- upvalues: l_FFlagLuaAppInExperienceDetailsPrompt_0 (ref), v17 (copy), v32 (copy)
        if not l_FFlagLuaAppInExperienceDetailsPrompt_0 then
            v17.clear();
            v32.clear();
        end;
    end;
    local function v34() --[[ Line: 150 ]] --[[ Name: dispose ]]
        -- upvalues: l_FFlagLuaAppInExperienceDetailsPrompt_0 (ref), v17 (copy), v32 (copy)
        if not l_FFlagLuaAppInExperienceDetailsPrompt_0 then
            v17.dispose();
            v32.dispose();
        end;
    end;
    return {
        fetchGameInfo = v32.fetchItem, 
        fetchGameInfos = v32.fetchItems, 
        getGameInfo = v32.getCachedItem, 
        getGameInfos = v32.getCachedItems, 
        getAndFetchGameInfo = v32.getAndFetchItem, 
        getAndFetchGameInfos = v32.getAndFetchItems, 
        updateGameInfo = if l_FFlagLuaAppDataHydrationUpdateItem_0 then v17.updateItem else nil, 
        updateGameInfos = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v17.updateItems else nil, 
        clear = if l_FFlagLuaAppInExperienceDetailsPrompt_0 then v32.clear else v33, 
        dispose = if l_FFlagLuaAppInExperienceDetailsPrompt_0 then v32.dispose else v34
    };
end;