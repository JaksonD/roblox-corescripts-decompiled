local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_TooltipCallout_0 = l_UIBlox_0.App.Dialog.TooltipCallout;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local v7 = require(l_Parent_0.Common.TextKeys);
return function(v8) --[[ Line: 15 ]]
    -- upvalues: l_React_0 (copy), l_UIBlox_0 (copy), l_useLocalization_0 (copy), v7 (copy), l_TooltipOrientation_0 (copy), l_TooltipCallout_0 (copy)
    local v9, v10 = l_React_0.useState(0);
    local v11 = l_UIBlox_0.Core.Style.useStyle();
    local v12 = l_useLocalization_0({
        findFriendsTitle = v7.FindFriendsTooltipTitle, 
        findFriendsBody = v7.FindFriendsTooltipBody
    });
    local v13 = {
        headerText = v12.findFriendsTitle, 
        bodyText = v12.findFriendsBody, 
        orientation = l_TooltipOrientation_0.Right, 
        distanceOffset = -12, 
        triggerPointCenter = Vector2.new(0, 50), 
        canvasBackground = v11.Theme.BackgroundDefault, 
        contentOffsetVector = Vector2.zero, 
        triggerPointRadius = Vector2.zero
    };
    return l_React_0.createElement("Frame", {
        LayoutOrder = v8.LayoutOrder, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [l_React_0.Change.AbsoluteSize] = function(v14) --[[ Line: 42 ]]
            -- upvalues: v10 (copy)
            v10((math.max(0, v14.AbsoluteSize.Y - 100)));
        end, 
        Position = UDim2.new(0, 0, 0, v9)
    }, {
        Tooltip = l_React_0.createElement(l_TooltipCallout_0, v13)
    });
end;