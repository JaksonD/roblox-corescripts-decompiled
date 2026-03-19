local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_Parent_0.UIBlox);
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v8 = game:DefineFastFlag("AXAddSelectionPropsToWidgetHeader", false);
return function(v9) --[[ Line: 26 ]] --[[ Name: WidgetHeader ]]
    -- upvalues: v1 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy), v8 (copy)
    local v10, v11 = v1.useBinding(Vector2.new());
    local v12 = l_useDesignTokens_0();
    local v13 = l_useLocalization_0({
        title = v9.titleKey, 
        description = v9.descriptionKey, 
        seeAllButtonText = "Feature.Catalog.ActionSeeAll"
    });
    local v14 = if v9.titleText then v9.titleText else v13.title;
    local v15 = if v9.descriptionText then v9.descriptionText else v13.description;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v9.LayoutOrder
    }, {
        TitleDescriptionFrame = if not not v14 or v15 then v1.createElement("Frame", {
            Size = if v9.seeAllCallback then v10:map(function(v16) --[[ Line: 47 ]]
                -- upvalues: v12 (copy)
                return UDim2.new(1, 0 - (v16.X + v12.Global.Space_150), 0, 0);
            end) else UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v12.Global.Space_50)
            }), 
            Title = if v14 then v1.createElement("TextLabel", {
                LayoutOrder = 1, 
                Text = v14, 
                Font = v12.Semantic.Typography.Header.Font, 
                TextSize = v12.Semantic.Typography.Header.FontSize, 
                LineHeight = v12.Semantic.Typography.Header.LineHeight, 
                TextColor3 = v12.Semantic.Color.Text.Emphasis.Color3, 
                TextTransparency = v12.Semantic.Color.Text.Emphasis.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1
            }, {
                UISizeConstraint = if v9.seeAllCallback then v1.createElement("UISizeConstraint", {
                    MinSize = v10:map(function(v17) --[[ Line: 77 ]]
                        return Vector2.new(0, v17.Y);
                    end)
                }) else nil
            }) else nil, 
            Description = if v15 then v1.createElement("TextLabel", {
                LayoutOrder = 2, 
                Text = v15, 
                Font = v12.Semantic.Typography.Body.Font, 
                TextSize = v12.Semantic.Typography.Body.FontSize, 
                TextColor3 = v12.Semantic.Color.Text.Default.Color3, 
                TextTransparency = v12.Semantic.Color.Text.Default.Transparency, 
                TextTruncate = Enum.TextTruncate.SplitWord, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1
            }) else nil
        }) else nil, 
        SeeAll = if v9.seeAllCallback then v1.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            anchorPoint = Vector2.new(1, 0), 
            position = UDim2.fromScale(1, 0), 
            text = v13.seeAllButtonText, 
            fitContent = true, 
            standardSize = l_StandardButtonSize_0.XSmall, 
            onActivated = v9.seeAllCallback, 
            buttonRef = v9.seeAllRef, 
            [v1.Change.AbsoluteSize] = function(v18) --[[ Line: 111 ]]
                -- upvalues: v11 (copy)
                v11(v18.AbsoluteSize);
            end, 
            NextSelectionDown = if v8 then v9.NextSelectionDown else nil, 
            NextSelectionUp = if v8 then v9.NextSelectionUp else nil
        }) else nil
    });
end;