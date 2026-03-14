local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local v4 = require(l_Parent_0.dependencies);
local l_callOnce_0 = v4.AppCommonLib.callOnce;
local l_tutils_0 = v4.tutils;
local l_Logger_0 = v4.Loggers.Logger;
local l_Cryo_0 = v4.Cryo;
local v9 = {};
local l_SharedFlags_0 = v4.SharedFlags;
local l_FFlagEnableAppRatingPromptLua_0 = l_SharedFlags_0.FFlagEnableAppRatingPromptLua;
local l_FFlagEnableAndroidAppRatingPromptLua_0 = l_SharedFlags_0.FFlagEnableAndroidAppRatingPromptLua;
game:DefineFastInt("RatingPromptMinNumFriends", 1);
game:DefineFastInt("RatingPromptMinDaysSinceFirstUse", 1);
game:DefineFastInt("RatingPromptMinNumLaunches", 10);
game:DefineFastInt("RatingPromptMinNumGamesPlayed", 1);
game:DefineFastInt("RatingPromptMinGameDurationSec", 600);
game:DefineFastInt("RatingPromptMinNumLaunchesSinceLastPrompt", 0);
game:DefineFastInt("RatingPromptMinNumDaysSinceLastPrompt", 1);
game:DefineFastFlag("RatingPromptCheckVersionRated", false);
v9.CurrentRatingPromptStats = {};
v9.GetAppRatingPromptEnabled = function() --[[ Line: 35 ]]
    -- upvalues: l_FFlagEnableAppRatingPromptLua_0 (copy), l_FFlagEnableAndroidAppRatingPromptLua_0 (copy)
    return (not not l_FFlagEnableAppRatingPromptLua_0 or l_FFlagEnableAndroidAppRatingPromptLua_0) and game:GetEngineFeature("AppRatingPromptEnabled") and game:GetService("AppRatingPromptService"):isAppRatingPromptAvailable();
end;
v9.GetAppRatingPromptService = function() --[[ Line: 41 ]]
    -- upvalues: l_FFlagEnableAppRatingPromptLua_0 (copy), l_FFlagEnableAndroidAppRatingPromptLua_0 (copy)
    return (not not l_FFlagEnableAppRatingPromptLua_0 or l_FFlagEnableAndroidAppRatingPromptLua_0) and game:GetEngineFeature("AppRatingPromptEnabled") and game:GetService("AppRatingPromptService") or nil;
end;
v9.GetMinimumNumFriends = function() --[[ Line: 52 ]]
    return game:GetFastInt("RatingPromptMinNumFriends");
end;
v9.GetMinDaysSinceFirstUse = function() --[[ Line: 56 ]]
    return game:GetFastInt("RatingPromptMinDaysSinceFirstUse");
end;
v9.GetMinNumLaunches = function() --[[ Line: 60 ]]
    return game:GetFastInt("RatingPromptMinNumLaunches");
end;
v9.GetMinNumGamesPlayed = function() --[[ Line: 64 ]]
    return game:GetFastInt("RatingPromptMinNumGamesPlayed");
end;
v9.GetMinGameDurationSec = function() --[[ Line: 68 ]]
    return game:GetFastInt("RatingPromptMinGameDurationSec");
end;
v9.GetMinNumLaunchesSinceLastPrompt = function() --[[ Line: 72 ]]
    return game:GetFastInt("RatingPromptMinNumLaunchesSinceLastPrompt");
end;
v9.GetMinNumDaysSinceLastPrompt = function() --[[ Line: 76 ]]
    return game:GetFastInt("RatingPromptMinNumDaysSinceLastPrompt");
end;
v9.GetCheckVersionRated = function() --[[ Line: 80 ]]
    return game:GetFastFlag("RatingPromptCheckVersionRated");
end;
v9.kAppRatingPromptStorageKey = "AppRatingPromptStats";
v9.kFirstUseDay = "firstUseDay";
v9.kNumLaunches = "numLaunches";
v9.kNumGamesPlayed = "numGamesPlayed";
v9.kLastTriggerTimestamp = "lastTriggerTimestamp";
v9.kLaunchesSinceLastPrompt = "launchesSinceLastPrompt";
v9.kSavedVersion = "savedVersion";
v9.kVersionAlreadyRated = "versionAlreadyRated";
v9.kPassedFriendsCheck = "passedFriendsCheck";
v9.defaultStatValues = {
    [v9.kFirstUseDay] = DateTime.now().UnixTimestamp, 
    [v9.kNumLaunches] = 0, 
    [v9.kNumGamesPlayed] = 0, 
    [v9.kLastTriggerTimestamp] = -1, 
    [v9.kLaunchesSinceLastPrompt] = 0, 
    [v9.kSavedVersion] = "0", 
    [v9.kVersionAlreadyRated] = false, 
    [v9.kPassedFriendsCheck] = false
};
v9.GetAppRatingPromptStats = function() --[[ Line: 111 ]]
    -- upvalues: v9 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy), l_Logger_0 (copy), l_tutils_0 (copy), l_Cryo_0 (copy)
    if game:GetEngineFeature("AppRatingPromptEnabled") then
        if next(v9.CurrentRatingPromptStats) == nil then
            local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(v9.kAppRatingPromptStorageKey);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 115 ]]
                -- upvalues: l_HttpService_0 (ref), l_l_AppStorageService_0_Item_0 (copy)
                return l_HttpService_0:JSONDecode(l_l_AppStorageService_0_Item_0);
            end);
            local v16 = {};
            if l_status_0 and type(l_result_0) == "table" then
                v16 = l_result_0;
            else
                l_Logger_0:warning("Error reading AppRatingPrompt stats, reinitializing to default values");
            end;
            local v17 = l_tutils_0.fieldCount(v16);
            v16 = l_Cryo_0.Dictionary.join(v9.defaultStatValues, v16);
            for v18, _ in pairs(v9.defaultStatValues) do
                if type(v16[v18]) ~= type(v9.defaultStatValues[v18]) then
                    v16[v18] = v9.defaultStatValues[v18];
                    l_Logger_0:warning(v18 .. " is of incorrect type, resetting to default value");
                end;
            end;
            v9.CurrentRatingPromptStats = v16;
            if l_tutils_0.fieldCount(v9.CurrentRatingPromptStats) ~= v17 then
                local v20 = l_HttpService_0:JSONEncode(v9.CurrentRatingPromptStats);
                l_AppStorageService_0:SetItem(v9.kAppRatingPromptStorageKey, v20);
                l_AppStorageService_0:Flush();
            end;
        end;
        return v9.CurrentRatingPromptStats;
    else
        return {};
    end;
end;
v9.SetAppRatingPromptStat = function(v21) --[[ Line: 147 ]]
    -- upvalues: v9 (copy), l_Logger_0 (copy), l_HttpService_0 (copy), l_AppStorageService_0 (copy)
    if next(v21) == nil then
        return;
    else
        if game:GetEngineFeature("AppRatingPromptEnabled") then
            local v22 = v9.GetAppRatingPromptStats();
            local v23 = false;
            for v24, _ in pairs(v21) do
                if v22[v24] ~= nil then
                    v22[v24] = v21[v24];
                    v23 = true;
                else
                    l_Logger_0:warning("SetAppRatingPromptStat: key not found in stats: " .. v24);
                end;
            end;
            if v23 then
                v9.CurrentRatingPromptStats = v22;
                local v26 = l_HttpService_0:JSONEncode(v9.CurrentRatingPromptStats);
                l_AppStorageService_0:SetItem(v9.kAppRatingPromptStorageKey, v26);
                l_AppStorageService_0:Flush();
            end;
        end;
        return;
    end;
end;
v9.IncrementValues = function(v27) --[[ Line: 172 ]]
    -- upvalues: v9 (copy), l_Logger_0 (copy), l_HttpService_0 (copy), l_AppStorageService_0 (copy)
    if next(v27) == nil then
        return;
    else
        if game:GetEngineFeature("AppRatingPromptEnabled") then
            local v28 = v9.GetAppRatingPromptStats();
            local v29 = false;
            for _, v31 in pairs(v27) do
                if v28[v31] ~= nil and type(v28[v31]) == "number" then
                    v28[v31] = v28[v31] + 1;
                    v29 = true;
                else
                    l_Logger_0:warning("IncrementValues: key not found in stats: " .. v31);
                end;
            end;
            if v29 then
                v9.CurrentRatingPromptStats = v28;
                local v32 = l_HttpService_0:JSONEncode(v9.CurrentRatingPromptStats);
                l_AppStorageService_0:SetItem(v9.kAppRatingPromptStorageKey, v32);
                l_AppStorageService_0:Flush();
            end;
        end;
        return;
    end;
end;
v9.PromptTriggered = function() --[[ Line: 198 ]]
    -- upvalues: v9 (copy)
    local l_UnixTimestamp_0 = DateTime.now().UnixTimestamp;
    local v34 = {
        [v9.kLastTriggerTimestamp] = l_UnixTimestamp_0, 
        [v9.kLaunchesSinceLastPrompt] = 0, 
        [v9.kVersionAlreadyRated] = true
    };
    v9.SetAppRatingPromptStat(v34);
end;
v9.onLaunchHelper = function() --[[ Line: 209 ]]
    -- upvalues: v9 (copy), l_Cryo_0 (copy), l_RunService_0 (copy), l_HttpService_0 (copy), l_AppStorageService_0 (copy)
    if game:GetEngineFeature("AppRatingPromptEnabled") then
        local v35 = v9.GetAppRatingPromptStats();
        v35 = l_Cryo_0.Dictionary.join(v9.defaultStatValues, v35);
        local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
        if v35[v9.kSavedVersion] ~= l_l_RunService_0_RobloxVersion_0 then
            v35[v9.kSavedVersion] = l_l_RunService_0_RobloxVersion_0;
            v35[v9.kVersionAlreadyRated] = false;
            v35[v9.kNumLaunches] = 0;
            v35[v9.kPassedFriendsCheck] = false;
        end;
        v35[v9.kNumLaunches] = v35[v9.kNumLaunches] + 1;
        v35[v9.kLaunchesSinceLastPrompt] = v35[v9.kLaunchesSinceLastPrompt] + 1;
        v9.CurrentRatingPromptStats = v35;
        local v37 = l_HttpService_0:JSONEncode(v9.CurrentRatingPromptStats);
        l_AppStorageService_0:SetItem(v9.kAppRatingPromptStorageKey, v37);
        l_AppStorageService_0:Flush();
    end;
end;
v9.onLaunch = function() --[[ Line: 230 ]]
    -- upvalues: l_callOnce_0 (copy), v9 (copy)
    l_callOnce_0("AppRatingPromptOnLaunch", function() --[[ Line: 231 ]]
        -- upvalues: v9 (ref)
        if v9.GetAppRatingPromptEnabled() then
            v9.onLaunchHelper();
        end;
    end);
end;
return v9;