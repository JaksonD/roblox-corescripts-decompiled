local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Style);
local v3 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = v2.useDesignTokens;
local l_PlayerName_0 = v3.App.Indicator.PlayerName;
local l_PlayerContext_0 = v3.App.Indicator.PlayerContext;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
return function(v9) --[[ Line: 40 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_PlayerName_0 (copy), l_PlayerContext_0 (copy)
    local v11 = l_useDesignTokens_0(function(v10) --[[ Line: 41 ]]
        return {
            contextTextSpacing = v10.Global.Space_75, 
            joinEventSpacing = v10.Global.Space_150, 
            padding = v10.Global.Space_200, 
            joinEventButtonHeight = v10.Global.Size_600
        };
    end);
    local function v12() --[[ Line: 50 ]]
        -- upvalues: v9 (copy), v1 (ref), v11 (copy), l_Button_0 (ref), l_ButtonType_0 (ref)
        if v9.renderJoinEventButton or v9.joinEventText then
            return v1.createElement("Frame", {
                LayoutOrder = 5, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                }), 
                JoinEventSpacing = v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, v11.joinEventSpacing)
                }), 
                JoinButton = if v9.renderJoinEventButton then v9.renderJoinEventButton() else v1.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    onActivated = v9.joinEventOnActivated, 
                    isLoading = false, 
                    size = UDim2.new(1, 0, 0, v11.joinEventButtonHeight), 
                    text = v9.joinEventText, 
                    layoutOrder = 5
                })
            });
        else
            return nil;
        end;
    end;
    return v1.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        [v1.Change.AbsoluteSize] = function(v13) --[[ Line: 88 ]]
            -- upvalues: v9 (copy)
            v9.onHeaderHeightChanged(v13.AbsoluteSize.Y);
        end
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        UIPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v11.padding), 
            PaddingBottom = UDim.new(0, v11.padding), 
            PaddingLeft = UDim.new(0, v11.padding), 
            PaddingRight = UDim.new(0, v11.padding)
        }), 
        PlayerName = v1.createElement(l_PlayerName_0, {
            automaticSize = Enum.AutomaticSize.XY, 
            displayNameItem = v9.displayNameItem, 
            layoutOrder = 1, 
            userNameItem = v9.userNameItem, 
            vendorNameItem = v9.vendorNameItem
        }), 
        ContextTextSpacing = if v9.contextText then v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, v11.contextTextSpacing)
        }) else nil, 
        PlayerContext = if v9.contextText then v1.createElement(l_PlayerContext_0, {
            icon = v9.contextIcon, 
            iconColor = v9.contextIconColor, 
            iconTransparency = v9.contextIconTransparency, 
            text = v9.contextText, 
            layoutOrder = 3, 
            Selectable = false
        }) else nil, 
        JoinButton = v12()
    });
end;