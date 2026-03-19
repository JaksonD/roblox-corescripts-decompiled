local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local _ = require(l_Parent_0.DiscoveryTypes);
local l_FFlagLuaAppChartsActiveFilterChips_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsActiveFilterChips;
local l_FFlagLuaAppChartsFilterOptionTextTag_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag;
local v5 = {
    new = function() --[[ Line: 12 ]] --[[ Name: new ]]
        return {};
    end
};
v5.mockFromExploreApi = function(v6, v7) --[[ Line: 18 ]] --[[ Name: mockFromExploreApi ]]
    -- upvalues: v5 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (copy), l_FFlagLuaAppChartsActiveFilterChips_0 (copy)
    local v8 = v5.fromExploreJsonData({
        filterId = v6, 
        filterType = "", 
        filterDisplayName = "", 
        filterOptions = {
            {
                optionId = v6 .. "_option", 
                optionDisplayName = "", 
                optionContextTag = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v6 .. "_context" else nil
            }
        }, 
        defaultOptionId = v6 .. "_option", 
        selectedOptionId = v6 .. "_option", 
        inactiveOptionIds = if l_FFlagLuaAppChartsActiveFilterChips_0 then {
            v6 .. "_option"
        } else nil
    });
    v8.selectedOptionDisplayName = v7 or "";
    return v8;
end;
v5.fromExploreJsonData = function(v9) --[[ Line: 40 ]] --[[ Name: fromExploreJsonData ]]
    -- upvalues: v5 (copy), l_FFlagLuaAppChartsActiveFilterChips_0 (copy), l_FFlagLuaAppChartsFilterOptionTextTag_0 (copy), v1 (copy)
    local v10 = v5.new();
    v10.filterId = v9.filterId;
    v10.filterType = v9.filterType;
    v10.filterDisplayName = v9.filterDisplayName;
    v10.defaultOptionId = v9.defaultOptionId;
    v10.selectedOptionId = v9.selectedOptionId;
    if l_FFlagLuaAppChartsActiveFilterChips_0 and v9.inactiveOptionIds then
        local v11 = {};
        for _, v13 in v9.inactiveOptionIds do
            v11[v13] = true;
        end;
        v10.inactiveOptionIds = v11;
    end;
    local v14 = {};
    for _, v16 in ipairs(v9.filterOptions) do
        table.insert(v14, {
            optionId = v16.optionId, 
            optionDisplayName = v16.optionDisplayName, 
            optionContextTag = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then v16.optionContextTag else nil
        });
        if v16.optionId == v9.selectedOptionId then
            v1.assert(v10.selectedOptionDisplayName == nil, "Multiple selected options found");
            v10.selectedOptionDisplayName = v16.optionDisplayName;
        end;
    end;
    v10.filterOptions = v14;
    return v10;
end;
return v5;