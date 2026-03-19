local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v5.App.Button.Enum.StandardButtonSize;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
return (v1.forwardRef(function(v10, v11) --[[ Line: 21 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), v1 (copy), v2 (copy), l_Button_0 (copy), l_StandardButtonSize_0 (copy), l_ButtonType_0 (copy)
    local v12 = l_useLocalization_0({
        loadMore = "Feature.Catalog.Action.LoadMore"
    });
    local v13 = l_useDesignTokens_0();
    return v1.createElement(v2.Focusable.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v13.Global.Size_600), 
        ref = v11, 
        NextSelectionUp = v10.NextSelectionUp, 
        NextSelectionDown = v10.NextSelectionDown, 
        LayoutOrder = v10.LayoutOrder
    }, {
        LoadMoreButton = v1.createElement(l_Button_0, {
            onActivated = v10.onActivated, 
            text = v12.loadMore, 
            standardSize = l_StandardButtonSize_0.Regular, 
            buttonType = l_ButtonType_0.Secondary, 
            size = UDim2.fromScale(1, 1), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5)
        })
    });
end));