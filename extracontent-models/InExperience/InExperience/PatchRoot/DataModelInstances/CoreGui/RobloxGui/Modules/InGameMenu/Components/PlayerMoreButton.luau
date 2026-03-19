local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Flags.FFlagLuaMenuPerfImprovements);
local v8 = require(l_Parent_0.Resources.Assets);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local v10 = l_Roact_0.PureComponent:extend("MoreButton");
v10.validateProps = l_t_0.strictInterface({
    onActivated = l_t_0.callback, 
    LayoutOrder = l_t_0.integer, 
    userId = v7 and l_t_0.number or nil
});
v10.init = function(v11) --[[ Line: 25 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy)
    if v7 then
        v11.onActivated = function() --[[ Line: 27 ]]
            -- upvalues: v11 (copy)
            v11.props.onActivated(v11.props.userId);
        end;
    end;
end;
v10.render = function(v12) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v7 (copy), l_Roact_0 (copy), l_ImageSetButton_0 (copy), v8 (copy)
    return l_withStyle_0(function(v13) --[[ Line: 34 ]]
        -- upvalues: v12 (copy), v7 (ref), l_Roact_0 (ref), l_ImageSetButton_0 (ref), v8 (ref)
        local l_onActivated_0 = v12.props.onActivated;
        if v7 then
            l_onActivated_0 = v12.props.onActivated and v12.onActivated or nil;
        end;
        return l_Roact_0.createElement(l_ImageSetButton_0, {
            Size = UDim2.new(0, 36, 0, 36), 
            BackgroundTransparency = 1, 
            Image = v8.Images.MoreActions, 
            ImageColor3 = v13.Theme.IconEmphasis.Color, 
            LayoutOrder = v12.props.LayoutOrder, 
            [l_Roact_0.Event.Activated] = l_onActivated_0
        });
    end);
end;
return v10;