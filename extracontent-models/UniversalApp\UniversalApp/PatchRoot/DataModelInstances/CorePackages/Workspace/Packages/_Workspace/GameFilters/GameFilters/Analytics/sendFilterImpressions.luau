local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameFilters");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local _ = require(l_Parent_0.DiscoveryTypes);
local v4 = require(l_script_FirstAncestor_0.Analytics.filterImpressionsEvent);
local v5 = require(l_script_FirstAncestor_0.Analytics.getOptionContextTag);
local l_FFlagLuaAppChartsFilterOptionTextTag_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag;
return function(v7, v8, v9, v10, v11) --[[ Line: 12 ]] --[[ Name: sendFilterImpressions ]]
    -- upvalues: l_FFlagLuaAppChartsFilterOptionTextTag_0 (copy), v5 (copy), v2 (copy), v4 (copy)
    if not v7 then
        return;
    elseif not v8 or #v8 == 0 then
        return;
    elseif not v9 or #v9 == 0 then
        return;
    else
        local v12 = {
            gameSetTypeId = v11.gameSetTypeId, 
            gameSetTargetId = v11.gameSetTargetId, 
            sortPos = v11.sortPos
        };
        local v13 = {};
        local v14 = {};
        local v15 = {};
        local v16 = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then {} else nil;
        for _, v18 in v8 do
            local v19 = v9[v18];
            if v19 then
                table.insert(v13, v18);
                table.insert(v14, v19.filterId);
                table.insert(v15, v19.selectedOptionId);
                if l_FFlagLuaAppChartsFilterOptionTextTag_0 then
                    table.insert(v16, v5(v19, v19.selectedOptionId) or "0");
                end;
            end;
        end;
        local v20 = #v14;
        v2.assert(v20 == #v13);
        v2.assert(v20 == #v15);
        if l_FFlagLuaAppChartsFilterOptionTextTag_0 then
            v2.assert(v20 == #v16);
        end;
        v12.absPositions = table.concat(v13, ",");
        v12.filterIds = table.concat(v14, ",");
        v12.selectedOptionIds = table.concat(v15, ",");
        v12.selectedOptionContextTags = if l_FFlagLuaAppChartsFilterOptionTextTag_0 then table.concat(v16, ",") else nil;
        v4(v7, v10, v12);
        return;
    end;
end;