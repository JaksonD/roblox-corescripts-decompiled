local v0 = require(script.Parent.Parent.UnifiedEventLogEnums);
local v1 = {
    [0] = v0.MarketplaceTimedOption.PERMANENT, 
    [3] = v0.MarketplaceTimedOption.DAYS_3, 
    [7] = v0.MarketplaceTimedOption.DAYS_7, 
    [14] = v0.MarketplaceTimedOption.DAYS_14
};
getTimedOptionForItemData = function(v2) --[[ Line: 10 ]] --[[ Name: getTimedOptionForItemData ]]
    -- upvalues: v1 (copy), v0 (copy)
    if v2 and v2.timedOptions then
        for _, v4 in v2.timedOptions do
            if v4.selected then
                return v1[v4.days];
            end;
        end;
        return v0.MarketplaceTimedOption.PERMANENT;
    else
        return v0.MarketplaceTimedOption.PERMANENT;
    end;
end;
return getTimedOptionForItemData;