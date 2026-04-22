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
local l_FFlagEnableInExperienceUIPCVRFix_0 = require(l_Parent_0.SharedFlags).FFlagEnableInExperienceUIPCVRFix;
local v10 = game:DefineFastInt("SpatialUIChromeSubMenuHeight", 448);
local v11 = {
    ScreenUI = "ScreenUI", 
    SpatialUI = "SpatialUI", 
    SpatialUIPartOnly = "SpatialUIPartOnly", 
    SpatialUIRoact = "SpatialUIRoact"
};
local v12 = {
    Chat = "Chat", 
    RobloxGui = "RobloxGui", 
    BottomBar = "BottomBar", 
    MoreMenu = "MoreMenu", 
    ChromeSubMenu = "ChromeSubMenu", 
    ToolTipsContainer = "ToolTipsContainer"
};
local v13 = {
    MainUIGroup = "MainUIGroup", 
    MenuUIGroup = "MenuUIGroup", 
    ChatUIGroup = "ChatUIGroup", 
    ChromeSubMenuUIGroup = "ChromeSubMenuUIGroup", 
    WristUIGroup = "WristUIGroup"
};
local v14 = 800 / v6;
local function _(v15) --[[ Line: 173 ]] --[[ Name: pixelToScaledSize ]]
    -- upvalues: v14 (copy)
    return v15 / v14;
end;
local function _(v17, v18) --[[ Line: 177 ]] --[[ Name: getScaledResolutionForPart ]]
    -- upvalues: v14 (copy)
    return Vector2.new(v17 / v14, v18 / v14);
end;
local function _(v20, v21, v22) --[[ Line: 181 ]] --[[ Name: panelDistanceWithSpacing ]]
    -- upvalues: v14 (copy)
    local v23 = v22 / v14;
    local v24 = v20.X * 0.5 + v21.X * 0.5 + v23;
    local v25 = v20.Y * 0.5 + v21.Y * 0.5 + v23;
    return Vector2.new(v24, v25);
end;
local function _(v27, v28) --[[ Line: 188 ]] --[[ Name: alignPanelLeftToAnchor ]]
    return v28.X * 0.5 - v27.X * 0.5;
end;
local function _(v30, v31) --[[ Line: 192 ]] --[[ Name: alignPanelTopToAnchor ]]
    return v30.Y * 0.5 - v31.Y * 0.5;
end;
local function _(v33, v34) --[[ Line: 196 ]] --[[ Name: alignPanelBottomToAnchor ]]
    return v34.Y * 0.5 - v33.Y * 0.5;
end;
local function _() --[[ Line: 200 ]] --[[ Name: getAdditionalZOffsetIfNeeded ]]
    -- upvalues: l_InExperienceUIVRIXP_0 (copy), v8 (copy)
    if l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
        return v8 / 1000;
    else
        return 0;
    end;
end;
local v37 = {
    PANEL_TO_PANEL = 10, 
    PANEL_TO_BOTTOMBAR = 10, 
    PANEL_TO_DRAGBAR = v7, 
    PANEL_TO_CHROME_BOTTOM_OFFSET = 24
};
local function v45(v38, v39) --[[ Line: 217 ]] --[[ Name: getPanelAroundLeftOrRightEdgeRotation ]]
    -- upvalues: v37 (copy), v14 (copy)
    local v40 = v38.X * 0.5 + v37.PANEL_TO_PANEL / v14 * 0.5;
    local v41 = nil;
    v41 = if v39 > 0 then Vector3.new(v40, 0, 0) else Vector3.new(-1 * v40, 0, 0);
    local v42 = CFrame.new(v41);
    local v43 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), (math.rad(v39)));
    local v44 = CFrame.new(-v41);
    return v42 * v43 * v44;
end;
local v46 = if l_isInExperienceUIVREnabled_0 then Vector2.new(943 / v14, 640 / v14) else Vector2.new(0.532, 0.3395) * 3.3333333333333335;
local v47 = if l_isInExperienceUIVREnabled_0 then Vector2.new(434 / v14, 264 / v14) else Vector2.new(0.1365, 0.1995) * 3.3333333333333335;
local v48 = if l_isInExperienceUIVREnabled_0 then Vector2.new(800 / v14, 640 / v14) else Vector2.new(0.532, 0.3395) * 3.3333333333333335;
local v49 = if l_isInExperienceUIVREnabled_0 then Vector2.new(317 / v14, (if l_FFlagEnableInExperienceUIPCVRFix_0 then v10 else 292) / v14) else v4;
local v50 = if l_isInExperienceUIVREnabled_0 then Vector2.new(943 / v14, 64 / v14) else v4;
local v51 = if l_isInExperienceUIVREnabled_0 then Vector2.new(v50.X, 120 / v14) else v4;
local v52 = if l_isInExperienceUIVREnabled_0 then Vector2.new(296 / v14, 40 / v14) else v4;
local v53 = if l_isInExperienceUIVREnabled_0 then {
    [v13.MenuUIGroup] = v45(v48, l_InExperienceUIVRIXP_0:isMovePanelToCenter() and 0 or 15), 
    [v13.ChatUIGroup] = v45(v47, l_InExperienceUIVRIXP_0:isMovePanelToCenter() and 0 or -15)
} else {};
local v54;
if l_isInExperienceUIVREnabled_0 then
    local l_new_0 = CFrame.new;
    local v56;
    if l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
        v56 = 0;
    else
        local v57 = -1;
        local v58 = v37.PANEL_TO_PANEL / v14;
        local v59 = v46.X * 0.5 + v48.X * 0.5 + v58;
        local v60 = v46.Y * 0.5 + v48.Y * 0.5 + v58;
        v56 = v57 * Vector2.new(v59, v60).X;
    end;
    v54 = l_new_0(v56, v46.Y * 0.5 - v48.Y * 0.5, if l_InExperienceUIVRIXP_0:isMovePanelToCenter() then v8 / 1000 else 0) * v53[v13.MenuUIGroup];
else
    v54 = CFrame.new(0.4, -0.36, 0) * CFrame.Angles(0, 3.141592653589793, 0);
end;
local v61;
if l_isInExperienceUIVREnabled_0 then
    local l_new_1 = CFrame.new;
    local v63;
    if l_InExperienceUIVRIXP_0:isMovePanelToCenter() then
        v63 = v47.X * 0.5 - v46.X * 0.5;
    else
        local v64 = v37.PANEL_TO_PANEL / v14;
        local v65 = v46.X * 0.5 + v47.X * 0.5 + v64;
        local v66 = v46.Y * 0.5 + v47.Y * 0.5 + v64;
        v63 = Vector2.new(v65, v66).X;
    end;
    v61 = l_new_1(v63, v46.Y * 0.5 - v47.Y * 0.5, if l_InExperienceUIVRIXP_0:isMovePanelToCenter() then v8 / 1000 else 0) * v53[v13.ChatUIGroup];
else
    v61 = CFrame.new(v46.X * 0.5 + v47.X * 0.5 + 0.06666666666666667, (v46.Y - v47.Y) / 2, 0);
end;
local v67 = if l_isInExperienceUIVREnabled_0 then CFrame.new(0, v49.Y * 0.5 - v46.Y * 0.5 + v37.PANEL_TO_CHROME_BOTTOM_OFFSET / v14, if l_InExperienceUIVRIXP_0:isMovePanelToCenter() then v8 / 1000 else 0) * CFrame.Angles(0, 3.141592653589793, 0) else v5;
local v68 = if l_isInExperienceUIVREnabled_0 then CFrame.new(0, v51.Y * 0.5 - v46.Y * 0.5 - v37.PANEL_TO_BOTTOMBAR / v14, if l_InExperienceUIVRIXP_0:isMovePanelToCenter() then v8 / 1000 else 0) * CFrame.Angles(0, 3.141592653589793, 0) else v5;
local v69 = {
    [v12.Chat] = {
        type = v11.SpatialUI, 
        spatialPanelProps = {
            name = "ExperienceChat", 
            faceCamera = true, 
            lerp = true, 
            partSize = v47, 
            virtualScreenSize = v47 * v14
        }
    }, 
    [v12.RobloxGui] = {
        type = v11.SpatialUIPartOnly, 
        spatialPanelProps = {
            name = "RobloxGuiPanel-PartOnly", 
            faceCamera = true, 
            lerp = true, 
            partSize = v46, 
            transparency = 0.5
        }
    }
};
if l_isInExperienceUIVREnabled_0 then
    v69 = v3.Object.assign(v69, {
        [v12.MoreMenu] = {
            type = v11.SpatialUI, 
            spatialPanelProps = {
                name = "MoreMenu", 
                faceCamera = true, 
                lerp = true, 
                partSize = v48, 
                virtualScreenSize = v48 * v14
            }
        }, 
        [v12.ChromeSubMenu] = {
            type = v11.SpatialUI, 
            spatialPanelProps = {
                name = "ChromeSubMenu", 
                faceCamera = true, 
                lerp = true, 
                partSize = v49, 
                virtualScreenSize = v49 * v14
            }
        }, 
        [v12.ToolTipsContainer] = {
            type = v11.SpatialUI, 
            spatialPanelProps = {
                name = "ToolTipsContainer", 
                faceCamera = true, 
                lerp = true, 
                partSize = v51, 
                virtualScreenSize = v51 * v14
            }
        }
    });
end;
local v70 = {
    [v12.Chat] = {
        uiGroup = if l_isInExperienceUIVREnabled_0 then v13.ChatUIGroup else v13.MainUIGroup, 
        cameraFixedPanelProp = {
            uiGroupElementOffset = v61
        }
    }, 
    [v12.RobloxGui] = {
        uiGroup = v13.MainUIGroup, 
        cameraFixedPanelProp = {
            uiGroupElementOffset = CFrame.new(0, 0, 0)
        }
    }
};
if l_isInExperienceUIVREnabled_0 then
    v70 = v3.Object.assign(v70, {
        [v12.MoreMenu] = {
            uiGroup = v13.MenuUIGroup, 
            cameraFixedPanelProp = {
                uiGroupElementOffset = v54
            }
        }, 
        [v12.ChromeSubMenu] = {
            uiGroup = v13.ChromeSubMenuUIGroup, 
            cameraFixedPanelProp = {
                uiGroupElementOffset = v67
            }
        }, 
        [v12.ToolTipsContainer] = {
            uiGroup = v13.MainUIGroup, 
            cameraFixedPanelProp = {
                uiGroupElementOffset = v68
            }
        }
    });
end;
local v71;
if l_isInExperienceUIVREnabled_0 then
    local l_new_2 = CFrame.new;
    local v73 = 0;
    local v74 = -1;
    local v75 = v37.PANEL_TO_BOTTOMBAR / v14;
    local v76 = v46.X * 0.5 + v50.X * 0.5 + v75;
    local v77 = v46.Y * 0.5 + v50.Y * 0.5 + v75;
    v71 = l_new_2(v73, v74 * Vector2.new(v76, v77).Y, 0) * CFrame.Angles(0, 3.141592653589793, 0);
else
    v71 = CFrame.new(0, -v46.Y * 0.5 - 0.075 - 0.03333333333333333, 0) * CFrame.Angles(0, 3.141592653589793, 0);
end;
local v78 = {
    [v12.BottomBar] = v13.MainUIGroup, 
    [v12.MoreMenu] = if l_isInExperienceUIVREnabled_0 then v13.MenuUIGroup else v13.MainUIGroup
};
if l_isInExperienceUIVREnabled_0 then
    v78 = v3.Object.assign(v78, {
        [v12.Chat] = v13.ChatUIGroup, 
        [v12.ChromeSubMenu] = v13.ChromeSubMenuUIGroup, 
        [v12.ToolTipsContainer] = v13.MainUIGroup
    });
end;
local v79 = {
    [v12.BottomBar] = v71, 
    [v12.MoreMenu] = v54
};
if l_isInExperienceUIVREnabled_0 then
    v79 = v3.Object.assign(v79, {
        [v12.Chat] = v61, 
        [v12.ChromeSubMenu] = v67, 
        [v12.ToolTipsContainer] = v68
    });
end;
local function v96(v80, v81, v82, v83) --[[ Line: 451 ]] --[[ Name: getDragBarOffsetForPanel ]]
    -- upvalues: v69 (ref), v4 (copy), v37 (copy), v79 (ref), v52 (copy), v14 (copy)
    local v84 = nil;
    if v81 then
        v84 = v81;
    else
        local l_spatialPanelProps_0 = v69[v80].spatialPanelProps;
        v84 = if l_spatialPanelProps_0 then l_spatialPanelProps_0.partSize else v4;
    end;
    local l_PANEL_TO_DRAGBAR_0 = v37.PANEL_TO_DRAGBAR;
    if v83 then
        l_PANEL_TO_DRAGBAR_0 = l_PANEL_TO_DRAGBAR_0 + v83;
    end;
    local v87 = v79[v80];
    if v82 == true then
        v87 = v87 * CFrame.Angles(0, -3.141592653589793, 0);
    end;
    local l_new_3 = CFrame.new;
    local v89 = 0;
    local v90 = -1;
    local l_v84_0 = v84;
    local l_v52_0 = v52;
    local v93 = l_PANEL_TO_DRAGBAR_0 / v14;
    local v94 = l_v84_0.X * 0.5 + l_v52_0.X * 0.5 + v93;
    local v95 = l_v84_0.Y * 0.5 + l_v52_0.Y * 0.5 + v93;
    return v87 * l_new_3(v89, v90 * Vector2.new(v94, v95).Y, 0);
end;
local v97 = {};
local l_MainUIGroup_0 = v13.MainUIGroup;
local l_new_4 = CFrame.new;
local v100 = 0;
local l_BottomBar_0 = v12.BottomBar;
v97[l_MainUIGroup_0] = l_new_4(v100, v79[l_BottomBar_0].Y - 0.075 - 0.06666666666666667, 0);
if l_isInExperienceUIVREnabled_0 then
    l_MainUIGroup_0 = v3.Object.assign;
    l_new_4 = v97;
    v100 = {
        [v13.MainUIGroup] = v96(v12.BottomBar, v50, true)
    };
    local l_ChatUIGroup_0 = v13.ChatUIGroup;
    local l_Chat_0 = v12.Chat;
    local v104 = nil;
    l_BottomBar_0 = v69[l_Chat_0].spatialPanelProps;
    v104 = if l_BottomBar_0 then l_BottomBar_0.partSize else v4;
    l_BottomBar_0 = v37.PANEL_TO_DRAGBAR;
    local v105 = v79[l_Chat_0];
    local l_new_5 = CFrame.new;
    local v107 = 0;
    local v108 = -1;
    local l_v104_0 = v104;
    local v110 = l_BottomBar_0 / v14;
    local v111 = l_v104_0.X * 0.5 + v52.X * 0.5 + v110;
    local v112 = l_v104_0.Y * 0.5 + v52.Y * 0.5 + v110;
    v100[l_ChatUIGroup_0] = v105 * l_new_5(v107, v108 * Vector2.new(v111, v112).Y, 0);
    l_ChatUIGroup_0 = v13.MenuUIGroup;
    l_Chat_0 = v12.MoreMenu;
    v104 = nil;
    l_BottomBar_0 = v69[l_Chat_0].spatialPanelProps;
    v104 = if l_BottomBar_0 then l_BottomBar_0.partSize else v4;
    l_BottomBar_0 = v37.PANEL_TO_DRAGBAR;
    v105 = v79[l_Chat_0];
    l_new_5 = CFrame.new;
    v107 = 0;
    v108 = -1;
    l_v104_0 = v104;
    v110 = l_BottomBar_0 / v14;
    v111 = l_v104_0.X * 0.5 + v52.X * 0.5 + v110;
    v112 = l_v104_0.Y * 0.5 + v52.Y * 0.5 + v110;
    v100[l_ChatUIGroup_0] = v105 * l_new_5(v107, v108 * Vector2.new(v111, v112).Y, 0);
    l_ChatUIGroup_0 = v13.ChromeSubMenuUIGroup;
    l_Chat_0 = v12.ChromeSubMenu;
    v104 = nil;
    l_BottomBar_0 = v69[l_Chat_0].spatialPanelProps;
    v104 = if l_BottomBar_0 then l_BottomBar_0.partSize else v4;
    l_BottomBar_0 = v37.PANEL_TO_DRAGBAR;
    v105 = v79[l_Chat_0] * CFrame.Angles(0, -3.141592653589793, 0);
    l_new_5 = CFrame.new;
    v107 = 0;
    v108 = -1;
    l_v104_0 = v104;
    v110 = l_BottomBar_0 / v14;
    v111 = l_v104_0.X * 0.5 + v52.X * 0.5 + v110;
    v112 = l_v104_0.Y * 0.5 + v52.Y * 0.5 + v110;
    v100[l_ChatUIGroup_0] = v105 * l_new_5(v107, v108 * Vector2.new(v111, v112).Y, 0);
    v97 = l_MainUIGroup_0(l_new_4, v100);
end;
return {
    SpatialUIType = v11, 
    SpatialUIGroupType = v13, 
    PanelType = v12, 
    DEFAULT_VR_PANEL_SIZE = Vector2.new(10, 10), 
    VR_PANEL_RESOLUTION_MULTIPLIER = v14, 
    BOTTOM_BAR_BASE_PART_SIZE = 0.15, 
    COMPAT_PANEL_PROPS_MAP = v69, 
    SPATIAL_PANEL_POSITION_PROPS_MAP = v70, 
    ROACT_PANEL_UIGROUP_MAP = v78, 
    ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP = v79, 
    UIGROUP_DRAGBAR_OFFSET_MAP = v97, 
    UIGROUP_INITITIAL_ROTATION_MAP = v53, 
    DRAG_BAR_SIZE = v52, 
    BOTTOM_BAR_SIZE = v50, 
    SPATIAL_TOOLTIP_SPACING = 2
};