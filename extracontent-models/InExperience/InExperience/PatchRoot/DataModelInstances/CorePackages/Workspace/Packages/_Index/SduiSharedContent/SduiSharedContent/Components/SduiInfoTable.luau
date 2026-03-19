local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.SduiCoreSystem);
local l_InfoTable_0 = require(l_Parent_0.AppBlox).InfoTable;
local l_getSduiComponentWrapper_0 = v2.getSduiComponentWrapper;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v1.memo(function(v6) --[[ Line: 27 ]] --[[ Name: SduiInfoTable ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_getSduiComponentWrapper_0 (copy), v1 (copy), l_InfoTable_0 (copy)
    local v7 = nil;
    v7 = if l_FFlagSduiServerCompat_0 then v6.layoutOrder else v6.LayoutOrder;
    local v8 = {};
    local v9 = if v6.numColumns and v6.numColumns > 0 then v6.numColumns else 1;
    local v10 = #v6.items;
    for v11, v12 in v6.items do
        local v13 = l_getSduiComponentWrapper_0(v12);
        v8[v11] = v1.createElement(v13, {
            componentConfig = v12, 
            sduiContext = v6.sduiContext, 
            parentAnalyticsContext = v6.analyticsContext, 
            extraLocalProps = {
                numColumns = v6.numColumns, 
                isLastInSingleColumn = if v9 == 1 then v11 == v10 else nil
            }
        });
    end;
    return v1.createElement(l_InfoTable_0, {
        LayoutOrder = v7, 
        numColumns = v6.numColumns, 
        gridTag = v6.gridTag, 
        items = v8
    });
end);