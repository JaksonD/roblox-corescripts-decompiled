local v0 = require(script.Parent.UnifiedEventLogEnums);
local v1 = require(script.Parent.sendUnifiedEventLog);
return function(v2, v3) --[[ Line: 4 ]] --[[ Name: logWidgetLoaded ]]
    -- upvalues: v1 (copy), v0 (copy)
    for v4, v5 in v2 do
        local v6 = {};
        local v7 = {};
        local v8 = {};
        if v5.content then
            for _, v10 in v5.content do
                if v10.type == "Asset" then
                    table.insert(v6, v10.id);
                elseif v10.type == "Bundle" then
                    table.insert(v7, v10.id);
                end;
                table.insert(v8, v10.id);
            end;
        end;
        v1({
            action = v0.MarketplaceUnifiedAction.WIDGET_LOADED, 
            requestId = v3, 
            widgetId = v5.id, 
            widgetType = v5.type, 
            themeId = v5.tagId, 
            gridPositionRow = v4, 
            gridPositionColumn = 1, 
            assetIds = table.concat(v6, ","), 
            bundleIds = table.concat(v7, ","), 
            widgetItemIds = table.concat(v8, ",")
        });
    end;
end;