local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedContent");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_Divider_0 = v3.Divider;
local l_Orientation_0 = v3.Enums.Orientation;
local _ = require(l_Parent_0.SduiCompat);
local _ = require(l_Parent_0.SduiCoreSystem);
local v9 = require(l_script_FirstAncestor_0.Components.buildSduiFeedChildren);
return v2.memo(function(v10) --[[ Line: 35 ]] --[[ Name: SduiStickyHeader ]]
    -- upvalues: v9 (copy), v2 (copy), l_Divider_0 (copy), l_Orientation_0 (copy), l_View_0 (copy)
    local v11 = v9({
        configs = v10.stickyItems, 
        sduiContext = v10.sduiContext, 
        debugName = v10.debugName or "StickyHeader", 
        componentType = "StickyHeader", 
        extraLocalProps = v10.extraLocalProps, 
        impressionsTag = v10.impressionsTag, 
        negateImpressionIndex = true, 
        selectionBehaviorLeft = v10.selectionBehaviorLeft, 
        selectionBehaviorRight = v10.selectionBehaviorRight
    });
    v11.StickyDivider = v2.createElement(l_Divider_0, {
        orientation = l_Orientation_0.Horizontal, 
        LayoutOrder = 1e999
    });
    return v2.createElement(l_View_0, {
        tag = "size-full-0 auto-y", 
        LayoutOrder = v10.layoutOrder or 1, 
        ZIndex = v10.zIndex or 1
    }, {
        Content = v2.createElement(l_View_0, {
            tag = v10.contentTag, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            backgroundStyle = v10.backgroundStyle, 
            layout = {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }
        }, {
            TopSpacer = if v10.paddingTop and v10.paddingTop > 0 then v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v10.paddingTop), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }) else nil, 
            StickyContent = v2.createElement(l_View_0, {
                tag = "size-full-0 auto-y", 
                LayoutOrder = 2, 
                layout = {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v10.gapBetweenItems)
                }
            }, v11), 
            BottomSpacer = if v10.paddingBottom and v10.paddingBottom > 0 then v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v10.paddingBottom), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }) else nil
        })
    });
end);