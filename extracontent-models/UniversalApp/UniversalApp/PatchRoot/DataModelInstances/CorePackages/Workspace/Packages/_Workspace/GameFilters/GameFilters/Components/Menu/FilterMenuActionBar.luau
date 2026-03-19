local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useTokens_0 = v1.Hooks.useTokens;
return function(v8) --[[ Line: 20 ]] --[[ Name: FilterMenuActionBar ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v9 = l_useTokens_0();
    local l_Surface_100_0 = v9.Color.Surface.Surface_100;
    local v11 = l_useLocalization_0({
        apply = "CommonUI.Messages.Action.Apply"
    });
    return v2.createElement("Frame", {
        LayoutOrder = v8.LayoutOrder, 
        BackgroundTransparency = l_Surface_100_0.Transparency, 
        BackgroundColor3 = l_Surface_100_0.Color3, 
        BorderSizePixel = 0, 
        Size = v8.Size
    }, {
        Corner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, v9.Radius.Medium)
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v9.Padding.XXLarge), 
            PaddingBottom = UDim.new(0, v9.Padding.XXLarge), 
            PaddingLeft = UDim.new(0, v9.Padding.XXLarge), 
            PaddingRight = UDim.new(0, v9.Padding.XXLarge)
        }), 
        ApplyButton = v2.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.PrimaryContextual, 
            size = UDim2.fromScale(1, 1), 
            text = v11.apply, 
            isDisabled = not v8.applyEnabled, 
            onActivated = v8.onApply
        })
    });
end;