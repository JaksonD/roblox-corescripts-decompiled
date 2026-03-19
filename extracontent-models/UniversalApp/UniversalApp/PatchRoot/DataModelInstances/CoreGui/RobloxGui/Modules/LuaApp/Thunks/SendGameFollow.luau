local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.FollowingsPostFollow);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.FollowingsDeleteFollow);
local v5 = require(l_Modules_0.LuaApp.Actions.SetGameFollow);
local v6 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v8 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v9 = require(l_Modules_0.LuaApp.Enum.ToastType);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v12 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount);
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local function _(v14, v15) --[[ Line: 17 ]] --[[ Name: translateString ]]
    -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v17 = l_Localization_0.new(l_RobloxLocaleId_0);
    v17:SetLocale(l_RobloxLocaleId_0);
    return v17:Format(v14, v15);
end;
local function v19(v20, v21, v22, v23, v24, v25) --[[ Line: 25 ]] --[[ Name: SendGameFollow ]]
    -- upvalues: l_PerformFetch_0 (copy), v8 (copy), v9 (copy), v2 (copy), v12 (copy), v5 (copy), v3 (copy), l_GameInfosReducer_0 (copy), l_LocalizationService_0 (copy), l_Localization_0 (copy), v19 (copy), v6 (copy), v4 (copy)
    if type(v21) ~= "string" then
        error("SendGameFollow thunk expects universeId to be a string");
    end;
    if type(v22) ~= "boolean" then
        error("SendGameFollow thunk expects isFollowed to be a boolean");
    end;
    return l_PerformFetch_0.Single("SendGameFollow" .. v21, function(v26) --[[ Line: 40 ]]
        -- upvalues: v23 (copy), v25 (copy), v24 (copy), v22 (copy), v8 (ref), v9 (ref), v2 (ref), v12 (ref), v5 (ref), v21 (copy), v3 (ref), v20 (copy), l_GameInfosReducer_0 (ref), l_LocalizationService_0 (ref), l_Localization_0 (ref), v19 (ref), v6 (ref), v4 (ref)
        local l_LocalUserId_0 = v26:getState().LocalUserId;
        if v23 then
            local v28 = v25 or 0;
            local v29 = v24 or 0;
            if v22 then
                if v28 <= v29 then
                    v26:dispatch(v8({
                        toastType = v9.GameFollowError, 
                        toastMessage = "Feature.GameFollows.TooltipNotificationsLimitReached"
                    }));
                    return v2.resolve();
                else
                    v26:dispatch(v12(v29 + 1));
                end;
            else
                v26:dispatch(v12(v29 - 1));
            end;
            v26:dispatch(v5(v21, v22));
        end;
        if v22 then
            return v3(v20, l_LocalUserId_0, v21):andThen(function(v30) --[[ Line: 65 ]]
                -- upvalues: v26 (copy), v21 (ref), v23 (ref), l_GameInfosReducer_0 (ref), v8 (ref), v9 (ref), l_LocalizationService_0 (ref), l_Localization_0 (ref), v2 (ref), v19 (ref), v20 (ref), v24 (ref), v25 (ref)
                if v26:getState().GameFollowings[v21].isFollowed then
                    if v23 then
                        local v31 = v26:getState().Personalization[l_GameInfosReducer_0.key][v21];
                        local v32 = v31 and v31.name or "";
                        local l_v26_0 = v26;
                        local l_v8_0 = v8;
                        local v35 = {
                            toastType = v9.NotificationsTurnedOn
                        };
                        local v36 = {
                            experienceName = v32
                        };
                        local l_RobloxLocaleId_1 = l_LocalizationService_0.RobloxLocaleId;
                        local v38 = l_Localization_0.new(l_RobloxLocaleId_1);
                        v38:SetLocale(l_RobloxLocaleId_1);
                        v35.toastMessage = v38:Format("Feature.GameFollows.TooltipTurnedOnNotifications", v36);
                        v35.isLocalized = true;
                        l_v26_0:dispatch(l_v8_0(v35));
                    end;
                    return v2.resolve(v30);
                else
                    return v19(v20, v21, false, v23, v24, v25);
                end;
            end, function(v39) --[[ Line: 91 ]]
                -- upvalues: v26 (copy), v5 (ref), v21 (ref), v24 (ref), v12 (ref), v8 (ref), v9 (ref), v23 (ref), v6 (ref), v2 (ref)
                v26:dispatch(v5(v21, false));
                local v40 = v24 or 0;
                v26:dispatch(v12(v40));
                if v39.StatusCode == 400 then
                    v26:dispatch(v8({
                        toastType = v9.GameFollowError, 
                        toastMessage = v23 and "Feature.GameFollows.TooltipNotificationsLimitReached" or "Feature.GameFollows.TooltipFollowLimitReached"
                    }));
                else
                    v26:dispatch(v6(v39));
                end;
                return v2.reject(v39);
            end);
        else
            return v4(v20, l_LocalUserId_0, v21):andThen(function(v41) --[[ Line: 110 ]]
                -- upvalues: v26 (copy), v21 (ref), v23 (ref), l_GameInfosReducer_0 (ref), v8 (ref), v9 (ref), l_LocalizationService_0 (ref), l_Localization_0 (ref), v2 (ref), v19 (ref), v20 (ref), v24 (ref), v25 (ref)
                if not v26:getState().GameFollowings[v21].isFollowed then
                    if v23 then
                        local v42 = v26:getState().Personalization[l_GameInfosReducer_0.key][v21];
                        local v43 = v42 and v42.name or "";
                        local l_v26_1 = v26;
                        local l_v8_1 = v8;
                        local v46 = {
                            toastType = v9.NotificationsTurnedOff
                        };
                        local v47 = {
                            experienceName = v43
                        };
                        local l_RobloxLocaleId_2 = l_LocalizationService_0.RobloxLocaleId;
                        local v49 = l_Localization_0.new(l_RobloxLocaleId_2);
                        v49:SetLocale(l_RobloxLocaleId_2);
                        v46.toastMessage = v49:Format("Feature.GameFollows.TooltipTurnedOffNotifications", v47);
                        v46.isLocalized = true;
                        l_v26_1:dispatch(l_v8_1(v46));
                    end;
                    return v2.resolve(v41);
                else
                    return v19(v20, v21, true, v23, v24, v25);
                end;
            end, function(v50) --[[ Line: 136 ]]
                -- upvalues: v26 (copy), v5 (ref), v21 (ref), v24 (ref), v12 (ref), v6 (ref), v2 (ref)
                v26:dispatch(v5(v21, true));
                local v51 = v24 or 0;
                v26:dispatch(v12(v51));
                v26:dispatch(v6(v50));
                return v2.reject(v50);
            end);
        end;
    end);
end;
return v19;