local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v3 = require(script.Parent.LoadingAvatar);
local v4 = require(script.Parent.TextPlaceholders);
local v5 = v1.PureComponent:extend("ChatLoadingIndicator");
v5.defaultProps = {
    cellHeight = 64, 
    avatarCellWidth = 60
};
v5.init = function(v6) --[[ Line: 19 ]] --[[ Name: init ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), v3 (copy), v4 (copy)
    v6.singleConversationPlaceholder = function(v7, v8) --[[ Line: 20 ]]
        -- upvalues: l_withStyle_0 (ref), v1 (ref), v6 (copy), v3 (ref), v4 (ref)
        return l_withStyle_0(function(v9) --[[ Line: 21 ]]
            -- upvalues: v1 (ref), v7 (copy), v6 (ref), v3 (ref), v4 (ref), v8 (copy)
            return v1.createElement("Frame", {
                LayoutOrder = v7, 
                Size = UDim2.new(1, 0, 0, v6.props.cellHeight), 
                BackgroundTransparency = v9.Tokens.Global.Color.None.Transparency, 
                BackgroundColor3 = v9.Theme.BackgroundDefault.Color, 
                BorderSizePixel = 0
            }, {
                UIList = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 0), 
                    PaddingTop = UDim.new(0, 4)
                }), 
                Content = v1.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 1, -1), 
                    BackgroundTransparency = 1
                }, {
                    UIList = v1.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal
                    }), 
                    avatar = v1.createElement(v3, {
                        avatarImage = v6.props.avatarImage, 
                        cellWidth = v6.props.avatarCellWidth, 
                        cellHeight = v6.props.cellHeight, 
                        LayoutOrder = 1
                    }), 
                    textPlaceholders = v1.createElement(v4, {
                        avatarCellWidth = v6.props.avatarCellWidth, 
                        LayoutOrder = 2
                    })
                }), 
                bottomLineContainer = not v8 and v1.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2, 
                    ClipsDescendants = true
                }, {
                    Padding = v1.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v6.props.avatarCellWidth)
                    }), 
                    bottomLine = v1.createElement("Frame", {
                        BackgroundColor3 = v9.Theme.Divider.Color, 
                        Transparency = v9.Theme.Divider.Transparency, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BorderSizePixel = 0
                    })
                })
            });
        end);
    end;
    v6.allConversationPlaceholdersList = function() --[[ Line: 78 ]]
        -- upvalues: v1 (ref), v6 (copy)
        local v10 = {
            UIList = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            })
        };
        table.insert(v10, v6.singleConversationPlaceholder(1, false));
        table.insert(v10, v6.singleConversationPlaceholder(2, false));
        table.insert(v10, v6.singleConversationPlaceholder(3, true));
        return v10;
    end;
end;
v5.render = function(v11) --[[ Line: 92 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy)
    return l_withStyle_0(function(v12) --[[ Line: 93 ]]
        -- upvalues: v1 (ref), v11 (copy)
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v12.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v12.Tokens.Global.Color.None.Transparency, 
            BorderSizePixel = 0
        }, v11.allConversationPlaceholdersList());
    end);
end;
return v5;