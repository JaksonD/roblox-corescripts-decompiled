local l_Parent_0 = script:FindFirstAncestor("VrSpatialUi").Parent;
local l_InExperienceUIVRIXP_0 = require(l_Parent_0.SharedExperimentDefinition).InExperienceUIVRIXP;
local l_isInExperienceUIVREnabled_0 = require(l_Parent_0.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v3 = nil;
if l_isInExperienceUIVREnabled_0 then
    v3 = require(l_Parent_0.LuauPolyfill);
end;
local v4 = Vector2.new(0, 0);
local v5 = CFrame.new(0, 0, 0);
local v6 = game:DefineFastInt("SpatialUIResolutionScale", 100) / 100;
local v7 = game:DefineFastInt("SpatialUIPanelDragBarDistance", 10);
local v8 = game:DefineFastInt("SpatialUIPanelZOffset", 100);
local v9 = {
    ScreenUI = "ScreenUI", 
    SpatialUI = "SpatialUI", 
    SpatialUIPartOnly = "SpatialUIPartOnly", 
    SpatialUIRoact = "SpatialUIRoact"
};
local v10 = {
    Chat = "Chat", 
    RobloxGui = "RobloxGui", 
    BottomBar = "BottomBar", 
    MoreMenu = "MoreMenu", 
    ChromeSubMenu = "ChromeSubMenu", 
    ToolTipsContainer = "ToolTipsContainer"
};
local v11 = {
    MainUIGroup = "MainUIGroup", 
    MenuUIGroup = "MenuUIGroup", 
    ChatUIGroup = "ChatUIGroup", 
    ChromeSubMenuUIGroup = "ChromeSubMenuUIGroup", 
    WristUIGroup = "WristUIGroup"
};
local v12 = 800 / v6;
local function _(v13) --[[ Line: 166 ]] --[[ Name: pixelToScaledSize ]]
    -- upvalues: v12 (copy)
    return v13 / v12;
end;
local function _(v15, v16) --[[ Line: 170 ]] --[[ Name: getScaledResolutionForPart ]]
    -- upvalues: v12 (copy)
    return Vector2.new(v15 / v12, v16 / v12);
end;
local function _(v18, v19, v20) --[[ Line: 174 ]] --[[ Name: panelDistanceWithSpacing ]]
    -- upvalues: v12 (copy)
    local v21 = v20 / v12;
    local v22 = v18.X * 0.5 + v19.X * 0.5 + v21;
    local v23 = v18.Y * 0.5 + v19.Y * 0.5 + v21;
    return Vector2.new(v22, v23);
end;
local function _(v25, v26) --[[ Line: 181 ]] --[[ Name: alignPanelLeftToAnchor ]]
    return v26.X * 0.5 - v25.X * 0.5;
end;
local function _(v28, v29) --[[ Line: 185 ]] --[[ Name: alignPanelTopToAnchor ]]
    return v28.Y * 0.5 - v29.Y * 0.5;
end;
local function _(v31, v32) --[[ Line: 189 ]] --[[ Name: alignPanelBottomToAnchor ]]
    return v32.Y * 0.5 - v31.Y * 0.5;
end;
local function _() --[[ Line: 193 ]] --[[ Name: getAdditionalZOffsetIfNeeded ]]
    -- upvalues: l_InExperienceUIVRIXP_0 (copy), v8 (copy)
    if l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
        return v8 / 1000;
    else
        return 0;
    end;
end;
local v35 = {
    PANEL_TO_PANEL = 10, 
    PANEL_TO_BOTTOMBAR = 10, 
    PANEL_TO_DRAGBAR = v7, 
    PANEL_TO_CHROME_BOTTOM_OFFSET = 24
};
local function v43(v36, v37) --[[ Line: 210 ]] --[[ Name: getPanelAroundLeftOrRightEdgeRotation ]]
    -- upvalues: v35 (copy), v12 (copy)
    local v38 = v36.X * 0.5 + v35.PANEL_TO_PANEL / v12 * 0.5;
    local v39 = nil;
    v39 = if v37 > 0 then Vector3.new(v38, 0, 0) else Vector3.new(-1 * v38, 0, 0);
    local v40 = CFrame.new(v39);
    local v41 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), (math.rad(v37)));
    local v42 = CFrame.new(-v39);
    return v40 * v41 * v42;
end;
local v44 = if l_isInExperienceUIVREnabled_0 then Vector2.new(943 / v12, 640 / v12) else Vector2.new(0.532, 0.3395) * 3.3333333333333335;
local v45 = if l_isInExperienceUIVREnabled_0 then Vector2.new(434 / v12, 264 / v12) else Vector2.new(0.1365, 0.1995) * 3.3333333333333335;
local v46 = if l_isInExperienceUIVREnabled_0 then Vector2.new(800 / v12, 640 / v12) else Vector2.new(0.532, 0.3395) * 3.3333333333333335;
local v47 = if l_isInExperienceUIVREnabled_0 then Vector2.new(317 / v12, 292 / v12) else v4;
local v48 = if l_isInExperienceUIVREnabled_0 then Vector2.new(943 / v12, 64 / v12) else v4;
local v49 = if l_isInExperienceUIVREnabled_0 then Vector2.new(v48.X, 120 / v12) else v4;
local v50 = if l_isInExperienceUIVREnabled_0 then Vector2.new(296 / v12, 40 / v12) else v4;
local v51 = if l_isInExperienceUIVREnabled_0 then {
    [v11.MenuUIGroup] = v43(v46, l_InExperienceUIVRIXP_0:isMovePanelToCenter() and 0 or 15), 
    [v11.ChatUIGroup] = v43(v45, l_InExperienceUIVRIXP_0:isMovePanelToCenter() and 0 or -15)
} else {};
local v52;
if l_isInExperienceUIVREnabled_0 then
    local l_new_0 = CFrame.new;
    local v54;
    if l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
        v54 = 0;
    else
        local v55 = -1;
        local v56 = v35.PANEL_TO_PANEL / v12;
        local v57 = v44.X * 0.5 + v46.X * 0.5 + v56;
        local v58 = v44.Y * 0.5 + v46.Y * 0.5 + v56;
        v54 = v55 * Vector2.new(v57, v58).X;
    end;
    v52 = l_new_0(v54, v44.Y * 0.5 - v46.Y * 0.5, if l_InExperienceUIVRIXP_0:isMovePanelToCenter() then v8 / 1000 else 0) * v51[v11.MenuUIGroup];
else
    v52 = CFrame.new(0.4, -0.36, 0) * CFrame.Angles(0, 3.141592653589793, 0);
end;
local v59;
if l_isInExperienceUIVREnabled_0 then
    local l_new_1 = CFrame.new;
    local v61;
    if l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
        v61 = v45.X * 0.5 - v44.X * 0.5;
    else
        local v62 = v35.PANEL_TO_PANEL / v12;
        local v63 = v44.X * 0.5 + v45.X * 0.5 + v62;
        local v64 = v44.Y * 0.5 + v45.Y * 0.5 + v62;
        v61 = Vector2.new(v63, v64).X;
    end;
    v59 = l_new_1(v61, v44.Y * 0.5 - v45.Y * 0.5, if l_InExperienceUIVRIXP_0:isMovePanelToCenter() then v8 / 1000 else 0) * v51[v11.ChatUIGroup];
else
    v59 = CFrame.new(v44.X * 0.5 + v45.X * 0.5 + 0.06666666666666667, (v44.Y - v45.Y) / 2, 0);
end;
local v65 = if l_isInExperienceUIVREnabled_0 then CFrame.new(0, v47.Y * 0.5 - v44.Y * 0.5 + v35.PANEL_TO_CHROME_BOTTOM_OFFSET / v12, if l_InExperienceUIVRIXP_0:isMovePanelToCenter() then v8 / 1000 else 0) * CFrame.Angles(0, 3.141592653589793, 0) else v5;
local v66 = if l_isInExperienceUIVREnabled_0 then CFrame.new(0, v49.Y * 0.5 - v44.Y * 0.5 - v35.PANEL_TO_BOTTOMBAR / v12, if l_InExperienceUIVRIXP_0:isMovePanelToCenter() then v8 / 1000 else 0) * CFrame.Angles(0, 3.141592653589793, 0) else v5;
local v67 = {
    [v10.Chat] = {
        type = v9.SpatialUI, 
        spatialPanelProps = {
            name = "ExperienceChat", 
            faceCamera = true, 
            lerp = true, 
            partSize = v45, 
            virtualScreenSize = v45 * v12
        }
    }, 
    [v10.RobloxGui] = {
        type = v9.SpatialUIPartOnly, 
        spatialPanelProps = {
            name = "RobloxGuiPanel-PartOnly", 
            faceCamera = true, 
            lerp = true, 
            partSize = v44, 
            transparency = 0.5
        }
    }
};
if l_isInExperienceUIVREnabled_0 then
    v67 = v3.Object.assign(v67, {
        [v10.MoreMenu] = {
            type = v9.SpatialUI, 
            spatialPanelProps = {
                name = "MoreMenu", 
                faceCamera = true, 
                lerp = true, 
                partSize = v46, 
                virtualScreenSize = v46 * v12
            }
        }, 
        [v10.ChromeSubMenu] = {
            type = v9.SpatialUI, 
            spatialPanelProps = {
                name = "ChromeSubMenu", 
                faceCamera = true, 
                lerp = true, 
                partSize = v47, 
                virtualScreenSize = v47 * v12
            }
        }, 
        [v10.ToolTipsContainer] = {
            type = v9.SpatialUI, 
            spatialPanelProps = {
                name = "ToolTipsContainer", 
                faceCamera = true, 
                lerp = true, 
                partSize = v49, 
                virtualScreenSize = v49 * v12
            }
        }
    });
end;
local v68 = {
    [v10.Chat] = {
        uiGroup = if l_isInExperienceUIVREnabled_0 then v11.ChatUIGroup else v11.MainUIGroup, 
        cameraFixedPanelProp = {
            uiGroupElementOffset = v59
        }
    }, 
    [v10.RobloxGui] = {
        uiGroup = v11.MainUIGroup, 
        cameraFixedPanelProp = {
            uiGroupElementOffset = CFrame.new(0, 0, 0)
        }
    }
};
if l_isInExperienceUIVREnabled_0 then
    v68 = v3.Object.assign(v68, {
        [v10.MoreMenu] = {
            uiGroup = v11.MenuUIGroup, 
            cameraFixedPanelProp = {
                uiGroupElementOffset = v52
            }
        }, 
        [v10.ChromeSubMenu] = {
            uiGroup = v11.ChromeSubMenuUIGroup, 
            cameraFixedPanelProp = {
                uiGroupElementOffset = v65
            }
        }, 
        [v10.ToolTipsContainer] = {
            uiGroup = v11.MainUIGroup, 
            cameraFixedPanelProp = {
                uiGroupElementOffset = v66
            }
        }
    });
end;
local v69;
if l_isInExperienceUIVREnabled_0 then
    local l_new_2 = CFrame.new;
    local v71 = 0;
    local v72 = -1;
    local v73 = v35.PANEL_TO_BOTTOMBAR / v12;
    local v74 = v44.X * 0.5 + v48.X * 0.5 + v73;
    local v75 = v44.Y * 0.5 + v48.Y * 0.5 + v73;
    v69 = l_new_2(v71, v72 * Vector2.new(v74, v75).Y, 0) * CFrame.Angles(0, 3.141592653589793, 0);
else
    v69 = CFrame.new(0, -v44.Y * 0.5 - 0.075 - 0.03333333333333333, 0) * CFrame.Angles(0, 3.141592653589793, 0);
end;
local v76 = {
    [v10.BottomBar] = v11.MainUIGroup, 
    [v10.MoreMenu] = if l_isInExperienceUIVREnabled_0 then v11.MenuUIGroup else v11.MainUIGroup
};
if l_isInExperienceUIVREnabled_0 then
    v76 = v3.Object.assign(v76, {
        [v10.Chat] = v11.ChatUIGroup, 
        [v10.ChromeSubMenu] = v11.ChromeSubMenuUIGroup, 
        [v10.ToolTipsContainer] = v11.MainUIGroup
    });
end;
local v77 = {
    [v10.BottomBar] = v69, 
    [v10.MoreMenu] = v52
};
if l_isInExperienceUIVREnabled_0 then
    v77 = v3.Object.assign(v77, {
        [v10.Chat] = v59, 
        [v10.ChromeSubMenu] = v65, 
        [v10.ToolTipsContainer] = v66
    });
end;
local function v94(v78, v79, v80, v81) --[[ Line: 439 ]] --[[ Name: getDragBarOffsetForPanel ]]
    -- upvalues: v67 (ref), v4 (copy), v35 (copy), v77 (ref), v50 (copy), v12 (copy)
    local v82 = nil;
    if v79 then
        v82 = v79;
    else
        local l_spatialPanelProps_0 = v67[v78].spatialPanelProps;
        v82 = if l_spatialPanelProps_0 then l_spatialPanelProps_0.partSize else v4;
    end;
    local l_PANEL_TO_DRAGBAR_0 = v35.PANEL_TO_DRAGBAR;
    if v81 then
        l_PANEL_TO_DRAGBAR_0 = l_PANEL_TO_DRAGBAR_0 + v81;
    end;
    local v85 = v77[v78];
    if v80 == true then
        v85 = v85 * CFrame.Angles(0, -3.141592653589793, 0);
    end;
    local l_new_3 = CFrame.new;
    local v87 = 0;
    local v88 = -1;
    local l_v82_0 = v82;
    local l_v50_0 = v50;
    local v91 = l_PANEL_TO_DRAGBAR_0 / v12;
    local v92 = l_v82_0.X * 0.5 + l_v50_0.X * 0.5 + v91;
    local v93 = l_v82_0.Y * 0.5 + l_v50_0.Y * 0.5 + v91;
    return v85 * l_new_3(v87, v88 * Vector2.new(v92, v93).Y, 0);
end;
local v95 = {};
local l_MainUIGroup_0 = v11.MainUIGroup;
local l_new_4 = CFrame.new;
local v98 = 0;
local l_BottomBar_0 = v10.BottomBar;
v95[l_MainUIGroup_0] = l_new_4(v98, v77[l_BottomBar_0].Y - 0.075 - 0.06666666666666667, 0);
if l_isInExperienceUIVREnabled_0 then
    v95 = v3.Object.assign(v95, {
        [v11.MainUIGroup] = v94(v10.BottomBar, v48, true), 
        [v11.ChatUIGroup] = v94(v10.Chat), 
        [v11.MenuUIGroup] = v94(v10.MoreMenu), 
        [v11.ChromeSubMenuUIGroup] = v94(v10.ChromeSubMenu, nil, true)
    });
end;
return {
    SpatialUIType = v9, 
    SpatialUIGroupType = v11, 
    PanelType = v10, 
    DEFAULT_VR_PANEL_SIZE = Vector2.new(10, 10), 
    VR_PANEL_RESOLUTION_MULTIPLIER = v12, 
    BOTTOM_BAR_BASE_PART_SIZE = 0.15, 
    COMPAT_PANEL_PROPS_MAP = v67, 
    SPATIAL_PANEL_POSITION_PROPS_MAP = v68, 
    ROACT_PANEL_UIGROUP_MAP = v76, 
    ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP = v77, 
    UIGROUP_DRAGBAR_OFFSET_MAP = v95, 
    UIGROUP_INITITIAL_ROTATION_MAP = v51, 
    DRAG_BAR_SIZE = v50, 
    BOTTOM_BAR_SIZE = v48, 
    SPATIAL_TOOLTIP_SPACING = 2
};