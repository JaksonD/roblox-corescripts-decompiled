local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = require(l_Parent_0.t);
local l_FFlagLuaAppChartsFilterOptionTextTag_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag;
local l_FFlagLuaAppChartsActiveFilterChips_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsActiveFilterChips;
local v6 = v3.strictInterface({
    buttonName = v3.string, 
    filterId = v3.string, 
    selectedOptionId = v3.string, 
    previousOptionId = v3.optional(v3.string), 
    selectedOptionContextTag = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v3.optional(v3.string) else nil, 
    previousOptionContextTag = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v3.optional(v3.string) else nil, 
    gameSetTypeId = v3.string, 
    gameSetTargetId = v3.optional(v3.number), 
    sortPos = v3.number, 
    isActive = if l_FFlagLuaAppChartsActiveFilterChips_0 then v3.optional(v3.boolean) else nil
});
local v7 = {
    [l_AppPage_0.Games] = v6
};
return function(v8, v9, v10) --[[ Line: 31 ]] --[[ Name: gamesFilterClickEvent ]]
    -- upvalues: v7 (copy), l_mutedError_0 (copy)
    local v11 = v7[v9];
    if v11 then
        local v12, v13 = v11(v10);
        if not v12 then
            l_mutedError_0(v13);
        end;
    else
        l_mutedError_0(string.format("Missing interface for eventContext %s to type check gamesFilterClick event parameters", v9));
    end;
    v8:sendEventDeferred(v9, "gamesFilterClick", v10);
end;