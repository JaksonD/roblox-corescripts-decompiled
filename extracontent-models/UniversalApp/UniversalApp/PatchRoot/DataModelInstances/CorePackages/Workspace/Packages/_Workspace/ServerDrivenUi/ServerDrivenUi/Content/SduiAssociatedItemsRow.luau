local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.SduiCoreSystem);
local l_View_0 = v2.View;
local l_getSduiComponentWrapper_0 = v3.getSduiComponentWrapper;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v1.memo(function(v7) --[[ Line: 28 ]] --[[ Name: SduiAssociatedItemsRow ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_getSduiComponentWrapper_0 (copy), v1 (copy), l_View_0 (copy)
    local v8 = nil;
    v8 = if l_FFlagSduiServerCompat_0 then v7.layoutOrder else v7.LayoutOrder;
    local v9 = {};
    for v10, v11 in v7.items do
        local v12 = l_getSduiComponentWrapper_0(v11);
        v9[("Item_$%*"):format(v10)] = v1.createElement(v12, {
            componentConfig = v11, 
            sduiContext = v7.sduiContext, 
            parentAnalyticsContext = v7.analyticsContext, 
            extraLocalProps = {
                index = v10, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then v10 else nil, 
                layoutOrder = if l_FFlagSduiServerCompat_0 then v10 else nil
            }, 
            debugName = ("AssociatedItemsRow-Item-$%*"):format(v10)
        });
    end;
    return v1.createElement("ScrollingFrame", {
        AutomaticCanvasSize = Enum.AutomaticSize.X, 
        BackgroundTransparency = 1, 
        LayoutOrder = v8, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ClipsDescendants = false, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        ScrollBarThickness = 0, 
        ScrollingDirection = Enum.ScrollingDirection.X
    }, {
        ItemsRow = v1.createElement(l_View_0, {
            tag = "row gap-small auto-xy size-full-0"
        }, v9)
    });
end);