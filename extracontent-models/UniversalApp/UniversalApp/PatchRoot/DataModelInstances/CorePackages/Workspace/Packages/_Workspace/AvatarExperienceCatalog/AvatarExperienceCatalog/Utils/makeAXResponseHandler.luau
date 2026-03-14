local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AvatarExperienceAnalytics);
local l_sendAXStat_0 = v2.sendAXStat;
local l_AnalyticsService_0 = v2.AnalyticsService;
local _ = require(l_Parent_0.LuauPolyfill);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagAXSendModelMismatchCounter);
return function(v7, v8, v9) --[[ Line: 11 ]] --[[ Name: makeAXResponseHandler ]]
    -- upvalues: l_sendAXStat_0 (copy), v6 (copy), l_AnalyticsService_0 (copy)
    local v10 = if v9 then v9.latencyCounter else nil;
    local v11 = if v9 then v9.modelMismatchCounter else nil;
    local v12 = if v10 then os.clock() else nil;
    return (v7:andThen(function(v13) --[[ Line: 23 ]]
        -- upvalues: v10 (copy), v12 (copy), l_sendAXStat_0 (ref), v8 (copy), v6 (ref), v11 (copy), l_AnalyticsService_0 (ref)
        if v10 and v12 then
            local v14 = (os.clock() - v12) * 1000;
            l_sendAXStat_0({
                statName = v10, 
                deltaMs = v14
            });
        end;
        local v15, v16 = v8(if v13 then v13.responseBody else nil);
        if v16 then
            if v6 and v11 then
                l_AnalyticsService_0.EventStream:sendEventDeferred(v11, "marketplaceModelMismatchMetric", {});
            end;
            warn(v16);
        end;
        return v15;
    end));
end;