local l_script_FirstAncestor_0 = script:FindFirstAncestor("VrSpatialUi");
local v1 = require(l_script_FirstAncestor_0.UIManager);
local v2 = require(l_script_FirstAncestor_0.Constants);
return function(v3, v4, v5) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v6 = nil;
    local v7 = v2.ROACT_PANEL_UIGROUP_MAP[v4];
    if v7 then
        v6 = {
            uiGroupElementOffset = v2.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[v4]
        };
    end;
    local v8 = {
        panelObject = v3.current, 
        uiType = v2.SpatialUIType.SpatialUIRoact, 
        panelType = v4, 
        headScale = 1, 
        panelPositionProps = {
            uiGroup = v7, 
            cameraFixedPanelProp = v6
        }
    };
    v1.getInstance():registerRoactPanel(v4, v8, v5);
end;