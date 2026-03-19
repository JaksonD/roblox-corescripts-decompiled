local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent;
local v9 = require(l_Parent_0.Resources.Constants);
local v10 = require(l_Parent_0.Enums.Direction);
local v11 = require(l_Parent_0.Actions.SetCurrentZone);
local l_PortalSize_0 = v9.Zone.PortalSize;
local v13 = {
    [v10.Up] = {
        size = UDim2.new(1, 0, 0, l_PortalSize_0), 
        position = UDim2.new(0, 0, 0, 0)
    }, 
    [v10.Down] = {
        size = UDim2.new(1, 0, 0, l_PortalSize_0), 
        position = UDim2.new(0, 0, 1, -l_PortalSize_0)
    }, 
    [v10.Left] = {
        size = UDim2.new(0, l_PortalSize_0, 1, 0), 
        position = UDim2.new(0, 0, 0, 0)
    }, 
    [v10.Right] = {
        size = UDim2.new(0, l_PortalSize_0, 1, 0), 
        position = UDim2.new(1, -l_PortalSize_0, 0, 0)
    }
};
local v14 = l_Roact_0.PureComponent:extend("ZonePortal");
v14.validateProps = l_t_0.strictInterface({
    targetZone = l_t_0.number, 
    direction = v10.isEnumValue, 
    setCurrentZone = l_t_0.optional(l_t_0.callback)
});
v14.render = function(v15) --[[ Line: 49 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), l_withSelectionCursorProvider_0 (copy), l_Roact_0 (copy), l_CursorKind_0 (copy)
    local v16 = v13[v15.props.direction];
    return l_withSelectionCursorProvider_0(function(v17) --[[ Line: 53 ]]
        -- upvalues: l_Roact_0 (ref), v16 (copy), l_CursorKind_0 (ref), v15 (copy)
        return l_Roact_0.createElement("Frame", {
            Size = v16.size, 
            Position = v16.position, 
            BackgroundTransparency = 1, 
            Selectable = true, 
            ZIndex = 2147483647, 
            SelectionImageObject = v17(l_CursorKind_0.Invisible), 
            [l_Roact_0.Event.SelectionGained] = function() --[[ Line: 61 ]]
                -- upvalues: v15 (ref)
                v15.props.setCurrentZone(v15.props.targetZone);
            end
        });
    end);
end;
return (l_RoactRodux_0.UNSTABLE_connect2(nil, function(v18) --[[ Line: 68 ]]
    -- upvalues: v11 (copy)
    return {
        setCurrentZone = function(v19) --[[ Line: 70 ]] --[[ Name: setCurrentZone ]]
            -- upvalues: v18 (copy), v11 (ref)
            return v18(v11(v19));
        end
    };
end)(v14));