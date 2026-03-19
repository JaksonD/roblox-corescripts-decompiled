local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = require(l_Parent_0.t);
local l_FFlagLuaAppChartsFilterOptionTextTag_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag;
local v5 = v3.strictInterface({
    absPositions = v3.string, 
    filterIds = v3.string, 
    selectedOptionIds = v3.string, 
    selectedOptionContextTags = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v3.optional(v3.string) else nil, 
    gameSetTypeId = v3.string, 
    gameSetTargetId = v3.optional(v3.number), 
    sortPos = v3.number
});
local v6 = {
    [l_AppPage_0.Games] = v5
};
return function(v7, v8, v9) --[[ Line: 27 ]] --[[ Name: filterImpressionsEvent ]]
    -- upvalues: v6 (copy), l_mutedError_0 (copy)
    local v10 = v6[v8];
    if v10 then
        local v11, v12 = v10(v9);
        if not v11 then
            l_mutedError_0(v12);
        end;
    else
        l_mutedError_0(string.format("Missing interface for eventContext %s to type check filterImpressions event parameters", v8));
    end;
    v7:sendEventDeferred(v8, "filterImpressions", v9);
end;