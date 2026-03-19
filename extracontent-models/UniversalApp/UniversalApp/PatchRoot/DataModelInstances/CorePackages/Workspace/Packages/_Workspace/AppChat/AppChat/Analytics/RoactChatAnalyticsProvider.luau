local l_Parent_0 = script.Parent.Parent.Parent;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v2 = require(l_Parent_0.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v2.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v2.Analytics.DefaultAnalyticsService;
local v5 = require(script.Parent.EventStreamActionList);
local v6 = require(script.Parent.DiagActionList);
local v7 = require(l_Parent_0.React);
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v9 = require(script.Parent.RoactChatAnalyticsContext);
local v10 = require(script.Parent.Logger);
local l_ChatEntryPointNames_0 = require(l_Parent_0.SocialCommon).Enums.ChatEntryPointNames;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v13) --[[ Line: 27 ]]
    -- upvalues: l_ChatEntryPointNames_0 (copy), v10 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_useSelector_0 (copy), l_RbxAnalyticsService_0 (copy), v7 (copy), l_AnalyticsFactory_0 (copy), v5 (copy), v6 (copy), l_DefaultAnalyticsService_0 (copy), v9 (copy)
    local l_entryPoint_0 = v13.entryPoint;
    if not l_entryPoint_0 or not l_ChatEntryPointNames_0[l_entryPoint_0] then
        v10:warning("entryPoint=" .. tostring(l_entryPoint_0) .. " is not a reigstered value.");
        l_entryPoint_0 = l_ChatEntryPointNames_0.Unknown;
    end;
    local v17 = if l_GetFFlagIsSquadEnabled_0() then l_useSelector_0(function(v15) --[[ Line: 36 ]]
        local v16 = v15.Squad and v15.Squad.Squad and v15.Squad.Squad.currentSquad;
        if v16 and v16.squadId then
            return v16.squadId;
        else
            return nil;
        end;
    end) else nil;
    local l_l_RbxAnalyticsService_0_PlaySessionId_0 = l_RbxAnalyticsService_0:GetPlaySessionId();
    local v19 = v7.useMemo(function() --[[ Line: 44 ]]
        -- upvalues: l_AnalyticsFactory_0 (ref), v5 (ref), v6 (ref), l_DefaultAnalyticsService_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref), v17 (copy), l_entryPoint_0 (ref), l_l_RbxAnalyticsService_0_PlaySessionId_0 (copy)
        return l_AnalyticsFactory_0.setUpAnalyticsFactory({
            eventLists = {
                EventStream = v5, 
                Diag = v6
            }, 
            analyticsImpl = {
                EventStream = l_DefaultAnalyticsService_0.EventStream, 
                Diag = l_DefaultAnalyticsService_0.Diag
            }, 
            staticInfoForAllEvents = {
                squadId = if l_GetFFlagIsSquadEnabled_0() then v17 else nil, 
                entryPoint = l_entryPoint_0, 
                channelsApiEnabled = true, 
                playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0
            }
        })();
    end, {
        v17, 
        l_entryPoint_0, 
        l_l_RbxAnalyticsService_0_PlaySessionId_0
    });
    return v7.createElement(v9.Provider, {
        value = v19
    }, v13.children);
end;