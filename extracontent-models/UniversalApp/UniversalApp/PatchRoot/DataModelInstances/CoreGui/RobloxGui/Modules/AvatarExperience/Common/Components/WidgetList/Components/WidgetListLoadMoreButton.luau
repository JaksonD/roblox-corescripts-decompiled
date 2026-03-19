local l_CorePackages_0 = game:GetService("CorePackages");
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v5.App.Button.Enum.StandardButtonSize;
return (v2.forwardRef(function(v9, v10) --[[ Line: 17 ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), v3 (copy), l_Button_0 (copy), l_StandardButtonSize_0 (copy), l_ButtonType_0 (copy)
    local v11 = l_useLocalization_0({
        loadMore = "Feature.Catalog.Action.LoadMore"
    });
    return v2.createElement(v3.Focusable.Frame, {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 1), 
        ref = v10, 
        NextSelectionUp = v9.NextSelectionUp
    }, {
        LoadMoreButton = v2.createElement(l_Button_0, {
            onActivated = v9.onActivated, 
            text = v11.loadMore, 
            standardSize = l_StandardButtonSize_0.Regular, 
            buttonType = l_ButtonType_0.Secondary, 
            size = UDim2.fromScale(1, 1), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5)
        })
    });
end));