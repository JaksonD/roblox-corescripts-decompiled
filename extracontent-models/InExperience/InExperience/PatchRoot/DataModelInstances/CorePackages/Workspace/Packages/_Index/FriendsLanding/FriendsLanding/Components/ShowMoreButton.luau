local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_withLocalization_0 = v2.withLocalization;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local v8 = require(l_Parent_0.Cryo);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v10 = l_Roact_0.PureComponent:extend("ShowMoreButton");
local function v11() --[[ Line: 18 ]]

end;
v10.defaultProps = {
    layoutOrder = 1, 
    onSizeChange = v11, 
    onActivated = v11, 
    buttonHeight = 48
};
v10.MAX_WIDTH = 640;
v10.init = function(v12) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy)
    v12.state = {
        width = 100
    };
    v12.localization = {
        showMore = "Feature.Friends.Action.ShowMore"
    };
    v12.onChangeSize = function(v13) --[[ Line: 39 ]]
        -- upvalues: v12 (copy), v10 (ref)
        local v14 = v12.props.maxWidth or v10.MAX_WIDTH;
        v12:setState({
            width = math.min(v14, v13.AbsoluteSize.X)
        });
        v12.props.onSizeChange(v13);
    end;
end;
v10.render = function(v15) --[[ Line: 49 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_Roact_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    return l_withLocalization_0(v15.localization)(function(v16) --[[ Line: 50 ]]
        -- upvalues: v15 (copy), l_Roact_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref)
        local l_buttonHeight_0 = v15.props.buttonHeight;
        local v18 = UDim2.new(0, v15.state.width, 0, l_buttonHeight_0);
        return l_Roact_0.createFragment({
            showMoreContainer = l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = v15.props.layoutOrder, 
                Size = UDim2.new(1, 0, 0, l_buttonHeight_0 + 48), 
                [l_Roact_0.Change.AbsoluteSize] = v15.onChangeSize
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                showMore = l_Roact_0.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    onActivated = v15.props.onActivated, 
                    size = v18, 
                    text = v16.showMore
                })
            })
        });
    end);
end;
return function(v19) --[[ Line: 78 ]] --[[ Name: ShowMoreButtonWrapper ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_Roact_0 (copy), v10 (copy), v8 (copy)
    local v20 = l_useDesignTokens_0();
    return l_Roact_0.createElement(v10, v8.Dictionary.join({
        maxWidth = v20.LuaApps.FriendsLanding.ShowMore.ButtonWidth, 
        buttonHeight = v20.LuaApps.FriendsLanding.ShowMore.ButtonHeight
    }, v19));
end;