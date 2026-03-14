local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local v5 = v2.PureComponent:extend(script.Name);
v5.defaultProps = {
    textPadding = 8, 
    shouldUseAutomaticSize = false
};
v5.render = function(v6) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v4 (copy), v2 (copy)
    local l_textKey_0 = v6.props.textKey;
    local l_layoutOrder_0 = v6.props.layoutOrder;
    local l_onActivatedCallback_0 = v6.props.onActivatedCallback;
    local l_isPrimaryLink_0 = v6.props.isPrimaryLink;
    local l_textPadding_0 = v6.props.textPadding;
    local l_shouldUseAutomaticSize_0 = v6.props.shouldUseAutomaticSize;
    return l_withStyle_0(function(v13) --[[ Line: 26 ]]
        -- upvalues: v4 (ref), l_textKey_0 (copy), l_isPrimaryLink_0 (copy), l_onActivatedCallback_0 (copy), v2 (ref), l_shouldUseAutomaticSize_0 (copy), l_textPadding_0 (copy), l_layoutOrder_0 (copy)
        return v4({
            linkText = l_textKey_0
        })(function(v14) --[[ Line: 29 ]]
            -- upvalues: l_isPrimaryLink_0 (ref), v13 (copy), l_onActivatedCallback_0 (ref), v2 (ref), l_shouldUseAutomaticSize_0 (ref), l_textPadding_0 (ref), l_layoutOrder_0 (ref)
            local v15 = l_isPrimaryLink_0 and v13.Font.SubHeader1 or v13.Font.CaptionBody;
            local v16 = l_onActivatedCallback_0 and v13.Theme.SystemPrimaryDefault.Color or v13.Theme.UIDefault.Color;
            local v17 = v15.RelativeSize * v13.Font.BaseSize;
            return v2.createElement("TextButton", {
                BackgroundTransparency = 1, 
                RichText = true, 
                Text = string.format("<u>%s</u>", v14.linkText), 
                Size = if l_shouldUseAutomaticSize_0 then UDim2.new(0, 0, 0, 0) else UDim2.new(1, 0, 0, v17 + l_textPadding_0), 
                AutomaticSize = if l_shouldUseAutomaticSize_0 then Enum.AutomaticSize.XY else nil, 
                Font = v15.Font, 
                TextColor3 = v16, 
                TextTransparency = v13.Theme.TextDefault.Transparency, 
                TextSize = v17, 
                LayoutOrder = l_layoutOrder_0, 
                [v2.Event.Activated] = l_onActivatedCallback_0
            });
        end);
    end);
end;
return v5;