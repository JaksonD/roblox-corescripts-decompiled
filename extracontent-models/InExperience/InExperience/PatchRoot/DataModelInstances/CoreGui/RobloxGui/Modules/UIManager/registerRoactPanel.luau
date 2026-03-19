local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.UIManager);
local v2 = require(l_Parent_0.Constants);
return function(v3, v4) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v5 = nil;
    local v6 = v2.ROACT_PANEL_UIGROUP_MAP[v4];
    if v6 then
        v5 = {
            uiGroupElementOffset = v2.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[v4]
        };
    end;
    local v7 = {
        panelObject = v3.current, 
        uiType = v2.SpatialUIType.SpatialUIRoact, 
        panelType = v4, 
        headScale = 1, 
        panelPositionProps = {
            uiGroup = v6, 
            cameraFixedPanelProp = v5
        }
    };
    v1.getInstance():registerRoactPanel(v4, v7);
end;