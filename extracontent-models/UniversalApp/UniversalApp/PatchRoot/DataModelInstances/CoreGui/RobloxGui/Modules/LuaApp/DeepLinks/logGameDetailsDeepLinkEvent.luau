local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_SessionService_0 = game:GetService("SessionService");
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v5 = require(l_Modules_0.LuaApp.Analytics.Events.Games.gameDetailReferral);
local l_SetGamePlaySession_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SetGamePlaySession;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_FFlagEnableShareLinksInGameDetailEvent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableShareLinksInGameDetailEvent;
local v9 = require(l_Modules_0.LuaApp.Flags.FFlagEnableDeepLinkEventGameDetailSourceSession);
local function v15(v10, v11, v12) --[[ Line: 29 ]] --[[ Name: logGameDetailsDeepLinkEvent ]]
    -- upvalues: l_EventIngest_0 (copy), l_EventIngestService_0 (copy), v9 (copy), l_SetGamePlaySession_0 (copy), l_SessionService_0 (copy), l_SessionType_0 (copy), v5 (copy)
    local v13 = {
        universeId = v10, 
        pg = "deepLink", 
        shareLinkType = v12.linkType, 
        shareLinkId = v12.linkId
    };
    local v14 = l_EventIngest_0.new(l_EventIngestService_0);
    if v9 then
        l_SetGamePlaySession_0(l_SessionService_0, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
    end;
    v5(v14, v11, v13);
end;
local function v20(v16, v17) --[[ Line: 50 ]] --[[ Name: DEPRECATED_logGameDetailsDeepLinkEvent ]]
    -- upvalues: l_EventIngest_0 (copy), l_EventIngestService_0 (copy), v5 (copy)
    local v18 = {
        universeId = v16, 
        pg = "deepLink"
    };
    local v19 = l_EventIngest_0.new(l_EventIngestService_0);
    v5(v19, v17, v18);
end;
if l_FFlagEnableShareLinksInGameDetailEvent_0 then
    return v15;
else
    return v20;
end;