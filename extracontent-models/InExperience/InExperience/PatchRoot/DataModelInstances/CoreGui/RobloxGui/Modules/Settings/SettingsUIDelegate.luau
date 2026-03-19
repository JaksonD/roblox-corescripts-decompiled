local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.Observable);
local v3 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
local l_PanelType_0 = v3.Constants.PanelType;
local l_UIManager_0 = v3.UIManager;
local v6 = require(script.Parent.Theme);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local _ = require(l_CorePackages_0.Packages.UIBlox);
local v9 = require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Utility.GetStyleTokens);
local v10 = require(l_RobloxGui_0.Modules.ChatSelector);
local l_game_EngineFeature_0 = game:GetEngineFeature("CoreScriptVersionEnabled");
local v12 = game:DefineFastInt("SpatialUIDarkenBackgroundTransparency", 0);
local v13 = game:DefineFastInt("SpatialUIVersionTextSizeScaled", 1400);
local l_InExperienceUIVRIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP;
local v15 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagSpatialUIFixMenuPanelChatExclusive);
local v16 = game:DefineFastFlag("SpatialUIFixGameInviteChatExclusive", false);
local v17 = {
    HUB_BAR_WIDTH = 800, 
    ASPECT_RATIO = 1.3333333333333333
};
local v18 = {
    BOTTOM_BUTTON_MAX_SIZE_IN_PIXEL = 233
};
local v19 = nil;
local function _() --[[ Line: 37 ]]
    -- upvalues: v19 (ref), v9 (copy)
    if v19 == nil then
        v19 = v9();
    end;
    return v19;
end;
local function _(v21, v22, v23, v24) --[[ Line: 44 ]] --[[ Name: setFieldWithBackup ]]
    if v22 ~= nil then
        v22[v23] = v21[v23];
        v21[v23] = v24;
    end;
end;
local function _(v26, v27, v28) --[[ Line: 57 ]] --[[ Name: restoreFieldFromBackup ]]
    if v27 ~= nil then
        v26[v28] = v27[v28];
    end;
end;
local v30 = {};
v30.__index = v30;
v30.new = function(v31) --[[ Line: 66 ]] --[[ Name: new ]]
    -- upvalues: v30 (copy)
    local v32 = {
        _settingsHub = v31, 
        _originalShieldConfig = nil, 
        _backgroundUICorner = nil, 
        _vrEnabled = false, 
        _surfaceGuiEnabledConnection = nil, 
        _topBarConnection = nil, 
        _userGui = nil, 
        _windowsVisibilityValues = {}, 
        _windowsDisconnectCallbacks = {}, 
        _openVRMenuHandler = nil, 
        _originalVersionTextSizes = {}
    };
    setmetatable(v32, v30);
    return v32;
end;
v30.enableVR = function(v33) --[[ Line: 84 ]] --[[ Name: enableVR ]]
    -- upvalues: l_PanelType_0 (copy), l_UIManager_0 (copy), v2 (copy), l_Create_0 (copy), v6 (copy), l_CorePackages_0 (copy), l_RobloxGui_0 (copy)
    local v34 = {
        panelType = l_PanelType_0.MoreMenu, 
        screenGuiProps = {
            Name = "MoreMenu", 
            ResetOnSpawn = false, 
            DisplayOrder = -1, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }
    };
    local v35 = l_UIManager_0.getInstance():createUI(v34);
    if v35 == nil then
        return;
    else
        local l_panelObject_0 = v35.panelObject;
        local v37 = v2.ObservableValue.new(v33._settingsHub.Visible);
        v33._surfaceGuiEnabledConnection = v37:connect(function() --[[ Line: 100 ]]
            -- upvalues: l_panelObject_0 (copy), v37 (copy)
            l_panelObject_0.Enabled = v37:get();
        end);
        v33:connectWindowsVisibility(v37);
        l_UIManager_0.getInstance():connectPanelVisibility(l_PanelType_0.MoreMenu, v37);
        v33._originalShieldConfig = {};
        local l_ClippingShield_0 = v33._settingsHub.ClippingShield;
        local l__originalShieldConfig_0 = v33._originalShieldConfig;
        if l__originalShieldConfig_0 ~= nil then
            l__originalShieldConfig_0.Parent = l_ClippingShield_0.Parent;
            l_ClippingShield_0.Parent = l_panelObject_0;
        end;
        l_ClippingShield_0 = v33._settingsHub.ClippingShield;
        l__originalShieldConfig_0 = v33._originalShieldConfig;
        local v40 = UDim2.new(1, 0, 1, 0);
        if l__originalShieldConfig_0 ~= nil then
            l__originalShieldConfig_0.Size = l_ClippingShield_0.Size;
            l_ClippingShield_0.Size = v40;
        end;
        l_ClippingShield_0 = v33._settingsHub.ClippingShield;
        l__originalShieldConfig_0 = v33._originalShieldConfig;
        v40 = UDim2.new(0, 0, 0, 0);
        if l__originalShieldConfig_0 ~= nil then
            l__originalShieldConfig_0.Position = l_ClippingShield_0.Position;
            l_ClippingShield_0.Position = v40;
        end;
        if v33._settingsHub.DarkenBackground then
            v33._backgroundUICorner = l_Create_0("UICorner")({
                CornerRadius = v6.MenuContainerCornerRadius, 
                Parent = v33._settingsHub.DarkenBackground
            });
        end;
        v33._vrEnabled = true;
        if v33._topBarConnection == nil then
            l_ClippingShield_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
            l__originalShieldConfig_0 = v2.ObservableValue.new(l_ClippingShield_0.ShowTopBar);
            v33._topBarConnection = l_ClippingShield_0.ShowTopBarChanged.Event:connect(function() --[[ Line: 121 ]]
                -- upvalues: l__originalShieldConfig_0 (copy), l_ClippingShield_0 (copy)
                l__originalShieldConfig_0:set(l_ClippingShield_0.ShowTopBar);
            end);
            l_UIManager_0.getInstance():connectTopBarVisibility(l__originalShieldConfig_0);
            v40 = l_RobloxGui_0.Modules.Chrome;
            local v41 = require(v40.ChromeShared.Service);
            v41:onTriggerVRToggleButton():connect(function(v42) --[[ Line: 128 ]]
                -- upvalues: l_ClippingShield_0 (copy)
                l_ClippingShield_0:SetShowTopBar(v42);
            end);
            v41:connectTopBarVisibility(l__originalShieldConfig_0);
        end;
        v33:setVersionTextSize();
        return;
    end;
end;
v30.isInputEventNeededBySettings = function(v43, v44, v45, v46) --[[ Line: 136 ]] --[[ Name: isInputEventNeededBySettings ]]
    -- upvalues: l_RobloxGui_0 (copy)
    if v43._vrEnabled then
        if v43._userGui == nil then
            v43._userGui = require(l_RobloxGui_0.Modules.VR.UserGui);
        end;
        if v43._userGui:isInputNeededForOpenVRMenu(v46) then
            if v43._openVRMenuHandler == nil then
                v43._openVRMenuHandler = v43._userGui:getOpenVRMenuHandler();
            end;
            v43._openVRMenuHandler(v44, v45, v46);
            return false;
        elseif v46.KeyCode == Enum.KeyCode.Thumbstick2 then
            return true;
        end;
    end;
    return false;
end;
v30.disableVR = function(v47) --[[ Line: 157 ]] --[[ Name: disableVR ]]
    -- upvalues: l_UIManager_0 (copy), l_PanelType_0 (copy)
    if not v47._vrEnabled then
        return;
    else
        local l_ClippingShield_1 = v47._settingsHub.ClippingShield;
        local l__originalShieldConfig_1 = v47._originalShieldConfig;
        if l__originalShieldConfig_1 ~= nil then
            l_ClippingShield_1.Parent = l__originalShieldConfig_1.Parent;
        end;
        l_ClippingShield_1 = v47._settingsHub.ClippingShield;
        l__originalShieldConfig_1 = v47._originalShieldConfig;
        if l__originalShieldConfig_1 ~= nil then
            l_ClippingShield_1.Size = l__originalShieldConfig_1.Size;
        end;
        l_ClippingShield_1 = v47._settingsHub.ClippingShield;
        l__originalShieldConfig_1 = v47._originalShieldConfig;
        if l__originalShieldConfig_1 ~= nil then
            l_ClippingShield_1.Position = l__originalShieldConfig_1.Position;
        end;
        v47._originalShieldConfig = nil;
        if v47._backgroundUICorner then
            v47._backgroundUICorner.Parent = nil;
            v47._backgroundUICorner = nil;
        end;
        if v47._surfaceGuiEnabledConnection ~= nil then
            v47._surfaceGuiEnabledConnection:disconnect();
        end;
        v47._openVRMenuHandler = nil;
        v47:disconnectWindowsVisibility();
        l_UIManager_0.getInstance():disconnectPanelVisibility(l_PanelType_0.MoreMenu);
        v47:restoreVersionTextSize();
        v47._vrEnabled = false;
        return;
    end;
end;
v30.getAspectRatio = function(v50) --[[ Line: 179 ]] --[[ Name: getAspectRatio ]]
    -- upvalues: l_UIManager_0 (copy), l_PanelType_0 (copy), v17 (copy)
    if v50._vrEnabled then
        local v51 = l_UIManager_0.getInstance():getPanelSizeInPixel(l_PanelType_0.MoreMenu);
        return v51.X / v51.Y;
    else
        return v17.ASPECT_RATIO;
    end;
end;
v30.getHubBarSize = function(v52) --[[ Line: 188 ]] --[[ Name: getHubBarSize ]]
    -- upvalues: v6 (copy), l_UIManager_0 (copy), l_PanelType_0 (copy), v17 (copy)
    if v52._vrEnabled then
        local v53 = v6.HubPadding();
        local v54 = 0;
        if v53 and v53.PaddingLeft then
            v54 = v54 + v53.PaddingLeft.Offset;
        end;
        if v53 and v53.PaddingRight then
            v54 = v54 + v53.PaddingRight.Offset;
        end;
        return l_UIManager_0.getInstance():getPanelSizeInPixel(l_PanelType_0.MoreMenu).X - v54;
    else
        return v17.HUB_BAR_WIDTH;
    end;
end;
v30.getMenuContainerPositionOverride = function(v55) --[[ Line: 205 ]] --[[ Name: getMenuContainerPositionOverride ]]
    if v55._vrEnabled then
        return {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.X
        };
    else
        return nil;
    end;
end;
v30.getFullScreenSize = function(v56) --[[ Line: 218 ]] --[[ Name: getFullScreenSize ]]
    -- upvalues: l_UIManager_0 (copy), l_PanelType_0 (copy), l_RobloxGui_0 (copy)
    if v56._vrEnabled then
        return l_UIManager_0.getInstance():getPanelSizeInPixel(l_PanelType_0.MoreMenu).Y;
    else
        return l_RobloxGui_0.AbsoluteSize.y;
    end;
end;
v30.getDarkBackgroundTheme = function(v57) --[[ Line: 227 ]] --[[ Name: getDarkBackgroundTheme ]]
    -- upvalues: v19 (ref), v9 (copy), v12 (copy), v6 (copy)
    if v57._vrEnabled then
        if v19 == nil then
            v19 = v9();
        end;
        return {
            Color = v19.Color.OverMedia.OverMedia_100.Color3, 
            Transparency = math.min(math.max(v12, 0), 100) / 100
        };
    else
        return {
            Color = v6.color("DarkenBackground"), 
            Transparency = v6.transparency("DarkenBackground")
        };
    end;
end;
v30.getBottomButtonSize = function(v58, v59) --[[ Line: 243 ]] --[[ Name: getBottomButtonSize ]]
    -- upvalues: v18 (copy)
    if v58._vrEnabled then
        return (math.min(v59, v18.BOTTOM_BUTTON_MAX_SIZE_IN_PIXEL));
    else
        return v59;
    end;
end;
v30.updatePanelVisibility = function(v60, v61) --[[ Line: 251 ]] --[[ Name: updatePanelVisibility ]]
    -- upvalues: l_InExperienceUIVRIXP_0 (copy), v15 (copy), v10 (copy), l_PanelType_0 (copy)
    for _, v63 in v60._windowsVisibilityValues do
        if v63 then
            if l_InExperienceUIVRIXP_0:isMovePanelToCenter() and v15 then
                v10:HideTemp(l_PanelType_0.MoreMenu, true);
            end;
            v61:set(true);
            return;
        end;
    end;
    if l_InExperienceUIVRIXP_0:isMovePanelToCenter() and v15 then
        v10:HideTemp(l_PanelType_0.MoreMenu, false);
    end;
    v61:set(false);
end;
local function v67(v64) --[[ Line: 268 ]]
    -- upvalues: l_CorePackages_0 (copy), l_InExperienceUIVRIXP_0 (copy), v16 (copy), v10 (copy)
    local v66 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteModalManager.ToggleGameInviteModalEvent.Event:Connect(function(v65) --[[ Line: 271 ]]
        -- upvalues: v64 (copy), l_InExperienceUIVRIXP_0 (ref), v16 (ref), v10 (ref)
        v64("GameInvite", v65);
        if l_InExperienceUIVRIXP_0:isMovePanelToCenter() and v16 then
            if v65 then
                v10:HideTemp("SettingsMenu", true);
                return;
            else
                v10:HideTemp("SettingsMenu", false);
            end;
        end;
    end);
    return function() --[[ Line: 283 ]]
        -- upvalues: v66 (ref)
        if v66 then
            v66:Disconnect();
            v66 = nil;
        end;
    end;
end;
local function v74(v68) --[[ Line: 291 ]]
    local l_GuiService_0 = game:GetService("GuiService");
    local v70 = l_GuiService_0.InspectPlayerFromUserIdWithCtxRequest:Connect(function() --[[ Line: 294 ]]
        -- upvalues: v68 (copy)
        v68("InspectAndBuy", true);
    end);
    local v71 = l_GuiService_0.CloseInspectMenuRequest:Connect(function() --[[ Line: 297 ]]
        -- upvalues: v68 (copy)
        v68("InspectAndBuy", false);
    end);
    local v73 = l_GuiService_0.InspectMenuEnabledChangedSignal:Connect(function(v72) --[[ Line: 300 ]]
        -- upvalues: v68 (copy)
        if not v72 then
            v68("InspectAndBuy", false);
        end;
    end);
    return function() --[[ Line: 306 ]]
        -- upvalues: v70 (ref), v71 (ref), v73 (ref)
        if v70 then
            v70:Disconnect();
            v70 = nil;
        end;
        if v71 then
            v71:Disconnect();
            v71 = nil;
        end;
        if v73 then
            v73:Disconnect();
            v73 = nil;
        end;
    end;
end;
v30.connectWindowsVisibility = function(v75, v76) --[[ Line: 322 ]] --[[ Name: connectWindowsVisibility ]]
    -- upvalues: v67 (copy), v74 (copy)
    local function v79(v77, v78) --[[ Line: 323 ]]
        -- upvalues: v75 (copy), v76 (copy)
        v75._windowsVisibilityValues[v77] = v78;
        v75:updatePanelVisibility(v76);
    end;
    for _, v84 in {
        function(v80) --[[ Line: 328 ]]
            -- upvalues: v75 (copy)
            local v82 = v75._settingsHub.SettingsShowSignal:connect(function(v81) --[[ Line: 329 ]]
                -- upvalues: v80 (copy)
                v80("SettingsHub", v81);
            end);
            return function() --[[ Line: 333 ]]
                -- upvalues: v82 (ref)
                if v82 then
                    v82:Disconnect();
                    v82 = nil;
                end;
            end;
        end, 
        v67, 
        v74
    } do
        local v85 = v84(v79);
        table.insert(v75._windowsDisconnectCallbacks, v85);
    end;
end;
v30.disconnectWindowsVisibility = function(v86) --[[ Line: 353 ]] --[[ Name: disconnectWindowsVisibility ]]
    for _, v88 in v86._windowsDisconnectCallbacks do
        v88();
    end;
    v86._windowsDisconnectCallbacks = {};
    v86._windowsVisibilityValues = {};
end;
v30.isOpenCloseAnimationAllowed = function(v89) --[[ Line: 361 ]] --[[ Name: isOpenCloseAnimationAllowed ]]
    if v89._vrEnabled then
        return false;
    else
        return true;
    end;
end;
v30.getMenuContainerExtraSpace = function(v90) --[[ Line: 369 ]] --[[ Name: getMenuContainerExtraSpace ]]
    if v90._vrEnabled then
        local l_MenuContainerPadding_0 = v90._settingsHub.MenuContainerPadding;
        return l_MenuContainerPadding_0.PaddingTop.Offset + l_MenuContainerPadding_0.PaddingBottom.Offset;
    else
        return 0;
    end;
end;
local function _(v92) --[[ Line: 378 ]] --[[ Name: refreshVersionTextLabelSize ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    local v93 = UDim2.new(0.2, -6, 1, 0);
    v92.Size = if l_game_EngineFeature_0 then UDim2.new(0, v92.TextBounds.X + 6, 1, 0) else v93;
end;
v30.setVersionTextSize = function(v95) --[[ Line: 384 ]] --[[ Name: setVersionTextSize ]]
    -- upvalues: v6 (copy), v13 (copy), l_game_EngineFeature_0 (copy)
    for _, v97 in (v95._settingsHub.VersionContainer:GetChildren()) do
        if v97:IsA("TextLabel") then
            v95._originalVersionTextSizes[v97] = v97.TextSize;
            v97.TextSize = v6.textSize(v13 / 100);
            local v98 = UDim2.new(0.2, -6, 1, 0);
            v97.Size = if l_game_EngineFeature_0 then UDim2.new(0, v97.TextBounds.X + 6, 1, 0) else v98;
        end;
    end;
end;
v30.restoreVersionTextSize = function(v99) --[[ Line: 395 ]] --[[ Name: restoreVersionTextSize ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    for _, v101 in (v99._settingsHub.VersionContainer:GetChildren()) do
        if v101:IsA("TextLabel") and v99._originalVersionTextSizes[v101] then
            v101.TextSize = v99._originalVersionTextSizes[v101];
            local v102 = UDim2.new(0.2, -6, 1, 0);
            v101.Size = if l_game_EngineFeature_0 then UDim2.new(0, v101.TextBounds.X + 6, 1, 0) else v102;
            v99._originalVersionTextSizes[v101] = nil;
        end;
    end;
    v99._originalVersionTextSizes = {};
end;
return v30;