local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.LuaApp.Components.Search.ButtonStripSelectorButton);
local l_FFlagSearchTopResultsTabEnabledForAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSearchTopResultsTabEnabledForAll;
local v6 = v3.PureComponent:extend("ButtonStripSelector");
v6.defaultProps = {
    leftRightPadding = 0
};
v6.renderChildrenButtonsAndLayout = function(v7, v8, v9, v10) --[[ Line: 46 ]] --[[ Name: renderChildrenButtonsAndLayout ]]
    -- upvalues: v3 (copy), v4 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (copy)
    local v11 = {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8)
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v10), 
            PaddingRight = UDim.new(0, v10)
        })
    };
    for v12 = 1, #v8 do
        local v13 = v8[v12];
        if v13 then
            v11[v13.name] = v3.createElement(v4, {
                layoutOrder = v12, 
                text = v13.text, 
                handleClick = v13.onActivated, 
                selected = v9 == v13.name, 
                image = v13.image, 
                newDesignEnabled = v7.props.newDesignEnabled or l_FFlagSearchTopResultsTabEnabledForAll_0
            });
        end;
    end;
    return v11;
end;
v6.render = function(v14) --[[ Line: 80 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    local v15 = v14.props.activeSelection or 1;
    local l_forwardRef_0 = v14.props.forwardRef;
    return v3.createElement("Frame", {
        Size = v14.props.size, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v14.props.position, 
        LayoutOrder = v14.props.layoutOrder, 
        BackgroundColor3 = v14.props.backgroundColor3, 
        BackgroundTransparency = v14.props.backgroundTransparency, 
        BorderSizePixel = 0, 
        [v3.Ref] = l_forwardRef_0
    }, v14:renderChildrenButtonsAndLayout(v14.props.selections, v15, v14.props.leftRightPadding));
end;
return v3.forwardRef(function(v17, v18) --[[ Line: 97 ]]
    -- upvalues: v3 (copy), v6 (copy), v2 (copy)
    return v3.createElement(v6, v2.Dictionary.join(v17, {
        forwardRef = v18
    }));
end);