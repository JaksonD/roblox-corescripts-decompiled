local v0 = {
    ScreenUI = "ScreenUI", 
    SpatialUI = "SpatialUI", 
    SpatialUIPartOnly = "SpatialUIPartOnly", 
    SpatialUIRoact = "SpatialUIRoact"
};
local v1 = {
    Chat = "Chat", 
    RobloxGui = "RobloxGui", 
    BottomBar = "BottomBar", 
    MoreMenu = "MoreMenu"
};
local v2 = {
    MainUIGroup = "MainUIGroup", 
    WristUIGroup = "WristUIGroup"
};
local v3 = Vector2.new(0.1365, 0.1995) * 3.3333333333333335;
local v4 = Vector2.new(0.532, 0.3395) * 3.3333333333333335;
local v5 = CFrame.new(v4.X * 0.5 + v3.X * 0.5 + 0.06666666666666667, (v4.Y - v3.Y) / 2, 0);
local v6 = {
    [v1.Chat] = {
        type = v0.SpatialUI, 
        spatialPanelProps = {
            name = "ExperienceChat", 
            faceCamera = true, 
            lerp = true, 
            partSize = v3, 
            virtualScreenSize = v3 * 800
        }
    }, 
    [v1.RobloxGui] = {
        type = v0.SpatialUIPartOnly, 
        spatialPanelProps = {
            name = "RobloxGuiPanel-PartOnly", 
            faceCamera = true, 
            lerp = true, 
            partSize = v4, 
            transparency = 0.5
        }
    }
};
local v7 = {
    [v1.Chat] = {
        uiGroup = v2.MainUIGroup, 
        cameraFixedPanelProp = {
            uiGroupElementOffset = v5
        }
    }, 
    [v1.RobloxGui] = {
        uiGroup = v2.MainUIGroup, 
        cameraFixedPanelProp = {
            uiGroupElementOffset = CFrame.new(0, 0, 0)
        }
    }
};
local v8 = CFrame.new(0, -v4.Y * 0.5 - 0.075 - 0.03333333333333333, 0) * CFrame.Angles(0, 3.141592653589793, 0);
local v9 = CFrame.new(0.4, -0.36, 0) * CFrame.Angles(0, 3.141592653589793, 0);
local v10 = {
    [v1.BottomBar] = v2.MainUIGroup, 
    [v1.MoreMenu] = v2.MainUIGroup
};
local v11 = {
    [v1.BottomBar] = v8, 
    [v1.MoreMenu] = v9
};
return {
    SpatialUIType = v0, 
    SpatialUIGroupType = v2, 
    PanelType = v1, 
    DEFAULT_VR_PANEL_SIZE = Vector2.new(10, 10), 
    VR_PANEL_RESOLUTION_MULTIPLIER = 800, 
    BOTTOM_BAR_BASE_PART_SIZE = 0.15, 
    COMPAT_PANEL_PROPS_MAP = v6, 
    SPATIAL_PANEL_POSITION_PROPS_MAP = v7, 
    ROACT_PANEL_UIGROUP_MAP = v10, 
    ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP = v11
};