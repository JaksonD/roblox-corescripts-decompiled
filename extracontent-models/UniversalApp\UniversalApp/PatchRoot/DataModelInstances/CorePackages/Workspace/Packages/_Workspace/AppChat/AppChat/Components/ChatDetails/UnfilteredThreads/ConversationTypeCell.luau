local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local v9 = require(l_script_FirstAncestor_0.Components.Cells.BaseCell);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableCellFocusFixes);
local v11 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v12 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v12.Hooks.useTokens;
local v14 = {
    bodyText = "Placeholder body", 
    iconImage = nil, 
    iconSize = l_IconSize_0.Small, 
    iconCellWidth = 30, 
    cellHeight = 28, 
    onIconActivated = function() --[[ Line: 38 ]] --[[ Name: onIconActivated ]]

    end
};
return function(v15) --[[ Line: 43 ]] --[[ Name: ConversationTypeCell ]]
    -- upvalues: v3 (copy), v14 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), v11 (copy), v10 (copy), v4 (copy), v9 (copy), v12 (copy), l_IconButton_0 (copy)
    local v16 = v3.Dictionary.join(v14, v15);
    local v17 = l_useStyle_0();
    local v18 = v16.style or v17;
    local l_Theme_0 = v18.Theme;
    local l_Font_0 = v18.Font;
    local l_Size_150_0 = v18.Tokens.Global.Size_150;
    local v22 = l_useTokens_0();
    local v23 = v11();
    if v10 then
        local v24, v25 = v4.useBinding(0);
        local v27 = v4.useCallback(function(v26) --[[ Line: 55 ]]
            -- upvalues: v25 (copy)
            v25(v26.AbsoluteSize.X);
        end, {});
        return v4.createElement(v9, {
            Size = UDim2.new(1, 0, 0, v16.cellHeight), 
            BackgroundColor3 = if v23 then v22.Color.None.Color3 else l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = if v23 then v22.Color.None.Transparency else v18.Theme.BackgroundDefault.Transparency, 
            LayoutOrder = v16.layoutOrder, 
            Selectable = false, 
            dividerColor3 = l_Theme_0.Divider.Color, 
            dividerTransparency = l_Theme_0.Divider.Transparency, 
            isDisabled = true, 
            showDivider = false
        }, {
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_Size_150_0), 
                PaddingRight = UDim.new(0, l_Size_150_0)
            }), 
            Content = v4.createElement(v12.View, {
                tag = "row size-full align-y-center", 
                onAbsoluteSizeChanged = v27
            }, {
                Text = v4.createElement(v12.Text, {
                    LayoutOrder = 1, 
                    Text = v16.bodyText, 
                    sizeConstraint = {
                        MaxSize = v24:map(function(v28) --[[ Line: 84 ]]
                            -- upvalues: v16 (copy)
                            local v29 = v28 - v16.iconCellWidth;
                            return Vector2.new(if v29 > 0 then v29 else 1e999, 1e999);
                        end)
                    }, 
                    tag = "size-0-full auto-x content-emphasis text-align-x-left text-title-large text-truncate-end"
                }), 
                InfoIcon = v4.createElement(l_IconButton_0, {
                    backgroundTransparency = 1, 
                    icon = v16.iconImage, 
                    iconColor3 = l_Theme_0.IconDefault.Color, 
                    iconSize = v16.iconSize, 
                    iconTransparency = l_Theme_0.IconDefault.Transparency, 
                    layoutOrder = 2, 
                    size = UDim2.fromOffset(v16.iconCellWidth, v16.iconCellWidth), 
                    onActivated = v16.onIconActivated
                })
            })
        });
    else
        return v4.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v16.layoutOrder, 
            Size = UDim2.fromScale(1, 0)
        }, {
            ConversationTypeRow = v4.createElement(v9, {
                Size = UDim2.new(1, 0, 0, v16.cellHeight), 
                BackgroundColor3 = if v23 then v22.Color.None.Color3 else l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = if v23 then v22.Color.None.Transparency else v18.Theme.BackgroundDefault.Transparency, 
                showDivider = false, 
                dividerColor3 = l_Theme_0.Divider.Color, 
                dividerTransparency = l_Theme_0.Divider.Transparency, 
                isDisabled = true
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                UIPadding = v4.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_Size_150_0)
                }), 
                TextFrame = v4.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.fromScale(0, 0.5), 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    Text = v4.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.X, 
                        Size = UDim2.new(0, 0, 1, 0), 
                        Text = v16.bodyText, 
                        TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                        Font = l_Font_0.Header2.Font, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    })
                }), 
                IconFrame = v4.createElement("Frame", {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Position = UDim2.fromScale(1, 0.5), 
                    Size = UDim2.fromOffset(v16.iconCellWidth, v16.iconCellWidth), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    InfoIcon = v4.createElement(l_IconButton_0, {
                        position = UDim2.fromScale(0.5, 0.5), 
                        anchorPoint = Vector2.new(0.5, 0.5), 
                        icon = v16.iconImage, 
                        iconColor3 = l_Theme_0.IconDefault.Color, 
                        iconTransparency = l_Theme_0.IconDefault.Transparency, 
                        iconSize = v16.iconSize, 
                        backgroundTransparency = 1, 
                        size = UDim2.fromOffset(v16.iconCellWidth, v16.iconCellWidth), 
                        onActivated = v16.onIconActivated
                    })
                })
            })
        });
    end;
end;