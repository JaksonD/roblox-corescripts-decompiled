local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_VRService_0 = game:GetService("VRService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("GamepadService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local l_Panel3D_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D;
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local v11 = require(l_RobloxGui_0.Modules.VR.VirtualKeyboard);
local v12 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local v13 = require(l_RobloxGui_0.Modules.VR.IsSpatialRobloxGuiEnabled);
local l_CorePackages_1 = game:GetService("CorePackages");
local l_VRConstants_0 = require(l_CorePackages_1.Workspace.Packages.VrCompatibility).VRConstants;
local _ = game:GetService("UserInputService");
local _ = game:GetService("RunService");
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_1.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_FFlagEnableUIManagerPackgify_0 = require(l_CorePackages_1.Workspace.Packages.SharedFlags).FFlagEnableUIManagerPackgify;
local v20 = nil;
local v21 = nil;
if l_FFlagEnableUIManagerPackgify_0 then
    local v22 = require(l_CorePackages_1.Workspace.Packages.VrSpatialUi);
    v20 = v22.Constants.PanelType;
    v21 = v22.UIManager;
else
    local l_UIManager_0 = l_Modules_0:WaitForChild("UIManager");
    v20 = require(l_UIManager_0.Constants).PanelType;
    v21 = require(l_UIManager_0.UIManager);
end;
local v24 = (require(l_RobloxGui_0.Modules.Flags.GetFIntVRScaleGuiDistance) or 100)() * 0.01;
local v25 = game:DefineFastFlag("FixVRActionBinding", false);
if not l_VRService_0.VREnabled then
    warn("UserGui should not be required while not in VR");
    return nil;
else
    l_VRService_0.QuestDisplayRefreshRate = 90;
    local v26 = {
        ModuleName = "UserGui", 
        KeepVRTopbarOpen = false, 
        VRIsExclusive = false, 
        VRClosesNonExclusive = false, 
        SetVisible = nil
    };
    l_VRHub_0:RegisterModule(v26);
    local _ = Vector2.new(4, 3);
    local v28 = Vector2.new(2.66 * v24, 2 * v24);
    local v29 = false;
    local v30 = l_Panel3D_0.Get(v26.ModuleName);
    v30:SetType(l_Panel3D_0.Type.NewStandard);
    v30:GetPart().CanQuery = false;
    local v31 = Vector2.new(2.7978, 2.09835);
    v30:ResizeStuds(v31.x, v31.y, 128);
    v30:SetVisible(false);
    local v32 = nil;
    if v13 then
        v32 = l_Panel3D_0.Get(l_VRConstants_0.PositionLockedPanelName);
        config = {};
        local v33 = {
            panelType = v20.RobloxGui
        };
        config.uiManagerPanelPart = v21.getInstance():createUI(v33).panelObject;
        v32:SetType(l_Panel3D_0.Type.UIManagerManaged, config);
    else
        v32 = l_Panel3D_0.Get(l_VRConstants_0.PositionLockedPanelName);
        v32:SetType(l_Panel3D_0.Type.PositionLocked);
    end;
    v32:GetPart().CanQuery = false;
    v32:ResizeStuds(v28.x, v28.y, 128);
    v32:SetVisible(false);
    v32.showCursor = true;
    l_VRHub_0.ModuleOpened.Event:connect(function(v34) --[[ Line: 105 ]]
        -- upvalues: v26 (copy), l_VRHub_0 (copy), v30 (copy)
        if v34 ~= v26.ModuleName and l_VRHub_0:GetModule(v34).VRClosesNonExclusive and v30:IsVisible() then
            v26:SetVisible(false, nil);
        end;
    end);
    local v35 = false;
    local v36 = false;
    v26.SetVisible = function(_, v38, v39) --[[ Line: 117 ]] --[[ Name: SetVisible ]]
        -- upvalues: v36 (ref), l_VRHub_0 (copy), v26 (copy), v35 (ref), v13 (copy), l_CoreGui_0 (copy)
        v36 = v38;
        if v39 then
            v39:SetVisible(v36);
        end;
        if v36 then
            l_VRHub_0:FireModuleOpened(v26.ModuleName);
        else
            l_VRHub_0:FireModuleClosed(v26.ModuleName);
        end;
        local v40 = v36 and not v35;
        if v13 then
            l_CoreGui_0:SetUserGuiRendering(true, v40 and v39 and v39:GetPart() or nil, Enum.NormalId.Back);
            return;
        else
            l_CoreGui_0:SetUserGuiRendering(true, v40 and v39 and v39:GetPart() or nil, Enum.NormalId.Front);
            return;
        end;
    end;
    v26.IsVisible = function(_) --[[ Line: 138 ]] --[[ Name: IsVisible ]]
        -- upvalues: v36 (ref)
        return v36;
    end;
    v26.Update = function(v42) --[[ Line: 142 ]] --[[ Name: Update ]]
        -- upvalues: v36 (ref)
        v42:SetVisible(v36);
    end;
    local function v43() --[[ Line: 147 ]] --[[ Name: onGuiSelection ]]
        -- upvalues: l_VRHub_0 (copy), v26 (copy), v32 (ref), v24 (copy), v29 (ref), v28 (copy), l_GuiService_0 (copy)
        l_VRHub_0.LaserPointer:updateInputUserCFrame();
        if l_VRHub_0.ShowTopBar then
            v26:SetVisible(true, v32);
            v32.initialCFLerp = 1;
            v32:ForcePositionUpdate(true);
            v32.distance = 2.5 * v24;
            if not v29 then
                v32:StartLerp(v28);
                v29 = true;
                return;
            end;
        else
            v32:StartLerp(v28 * 0.25);
            v26:SetVisible(false, v32);
            l_GuiService_0.SelectedObject = nil;
            v29 = false;
        end;
    end;
    l_VRHub_0.ShowTopBarChanged.Event:connect(v43);
    l_GuiService_0:GetPropertyChangedSignal("MenuIsOpen"):Connect(v43);
    l_VRService_0.UserCFrameEnabled:Connect(v43);
    l_GuiService_0.PurchasePromptShown:Connect(function() --[[ Line: 174 ]]
        -- upvalues: l_VRHub_0 (copy)
        if not l_VRHub_0.ShowTopBar then
            l_VRHub_0:SetShowTopBar(true);
        end;
    end);
    local function v45(_) --[[ Line: 181 ]] --[[ Name: onGuiSelectedObjectChanged ]]
        -- upvalues: l_GuiService_0 (copy), l_VRHub_0 (copy)
        if (l_GuiService_0.SelectedObject or l_GuiService_0.SelectedCoreObject) and not l_VRHub_0.ShowTopBar then
            l_VRHub_0:SetShowTopBar(true);
        end;
        l_GuiService_0.SelectedObject = nil;
        l_GuiService_0.SelectedCoreObject = nil;
    end;
    l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(v45);
    l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(v45);
    local v46 = require(l_RobloxGui_0.Modules.InGameMenu);
    local function v48(v47) --[[ Line: 194 ]] --[[ Name: onVRMenuClicked ]]
        -- upvalues: l_VRHub_0 (copy), l_RbxAnalyticsService_0 (copy), v46 (copy), v12 (copy)
        if v47 == "OpenVRMenu" then
            if not l_VRHub_0.ShowTopBar then
                l_VRHub_0:SetShowTopBar(true);
                l_RbxAnalyticsService_0:ReportCounter("VR-BindAction-ToggleGui-On");
            else
                l_VRHub_0:SetShowTopBar(false);
                v46.closeInGameMenu();
                l_RbxAnalyticsService_0:ReportCounter("VR-BindAction-ToggleGui-Off");
            end;
        end;
        if v47 == "OpenIGMenu" then
            if not l_VRHub_0.ShowTopBar then
                l_VRHub_0:SetShowTopBar(true);
            end;
            if not v46.getOpen() then
                v46.openInGameMenu(v12.MainPagePageKey);
            end;
        end;
    end;
    local function v52(v49, v50, _) --[[ Line: 219 ]] --[[ Name: handleAction ]]
        -- upvalues: v48 (copy)
        if v50 == Enum.UserInputState.Begin then
            v48(v49);
        end;
    end;
    if l_isInExperienceUIVREnabled_0 then
        local v53 = require(l_CorePackages_1.Packages.InputHandlers);
        local v54 = false;
        local v55 = false;
        v26.isInputNeededForOpenVRMenu = function(_, v57) --[[ Line: 230 ]] --[[ Name: isInputNeededForOpenVRMenu ]]
            return v57.KeyCode == Enum.KeyCode.ButtonSelect;
        end;
        local l_v53_0 = v53 --[[ copy: 40 -> 43 ]];
        do
            local l_v54_0, l_v55_0 = v54, v55;
            v26.getOpenVRMenuHandler = function(_) --[[ Line: 234 ]] --[[ Name: getOpenVRMenuHandler ]]
                -- upvalues: l_v53_0 (copy), l_v54_0 (ref), l_v55_0 (ref), v21 (ref), l_VRHub_0 (copy), l_RbxAnalyticsService_0 (copy), v46 (copy)
                local v62 = l_v53_0.handleInput({
                    onPress = function() --[[ Line: 236 ]] --[[ Name: onPress ]]
                        -- upvalues: l_v54_0 (ref), l_v55_0 (ref)
                        l_v54_0 = true;
                        l_v55_0 = false;
                    end, 
                    hold = {
                        durationSeconds = 1, 
                        onComplete = function() --[[ Line: 242 ]] --[[ Name: onComplete ]]
                            -- upvalues: l_v55_0 (ref), v21 (ref)
                            l_v55_0 = true;
                            v21.getInstance():resetDragAndDrop();
                        end, 
                        allowReleaseAfterHold = true
                    }, 
                    onRelease = function() --[[ Line: 248 ]] --[[ Name: onRelease ]]
                        -- upvalues: l_v55_0 (ref), l_VRHub_0 (ref), l_RbxAnalyticsService_0 (ref), v46 (ref), l_v54_0 (ref)
                        if not l_v55_0 then
                            if not l_VRHub_0.ShowTopBar then
                                l_VRHub_0:SetShowTopBar(true);
                                l_RbxAnalyticsService_0:ReportCounter("VR-BindAction-ToggleGui-On");
                            else
                                l_VRHub_0:SetShowTopBar(false);
                                v46.closeInGameMenu();
                                l_RbxAnalyticsService_0:ReportCounter("VR-BindAction-ToggleGui-Off");
                            end;
                        end;
                        l_v54_0 = false;
                        l_v55_0 = false;
                    end
                });
                return function(_, v64, _) --[[ Line: 256 ]]
                    -- upvalues: v62 (copy)
                    local v66 = {
                        eventData = {
                            UserInputState = v64
                        }
                    };
                    v62(v66);
                end;
            end;
        end;
    end;
    if v25 or l_isInExperienceUIVREnabled_0 then
        if l_isInExperienceUIVREnabled_0 then
            l_ContextActionService_0:BindCoreAction("OpenVRMenu", v26:getOpenVRMenuHandler(), false, Enum.KeyCode.ButtonSelect);
        else
            l_ContextActionService_0:BindCoreAction("OpenVRMenu", v52, false, Enum.KeyCode.ButtonSelect);
        end;
    else
        l_ContextActionService_0:BindAction("OpenVRMenu", v52, false, Enum.KeyCode.ButtonSelect);
    end;
    l_ContextActionService_0:BindAction("OpenIGMenu", v52, false, Enum.KeyCode.ButtonStart);
    local function v67() --[[ Line: 283 ]] --[[ Name: OnVREnabledChanged ]]
        -- upvalues: l_VRService_0 (copy), v30 (copy), l_CoreGui_0 (copy), v26 (copy), v32 (ref), l_VRHub_0 (copy)
        if not l_VRService_0.VREnabled then
            v30:SetVisible(false);
            l_CoreGui_0:SetUserGuiRendering(false, nil, Enum.NormalId.Front);
            return;
        else
            v26:SetVisible(false, v30);
            v26:SetVisible(true, v32);
            l_VRHub_0:SetShowTopBar(true);
            return;
        end;
    end;
    l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v67);
    v67();
    v11.OpenedEvent:connect(function() --[[ Line: 296 ]]
        -- upvalues: v35 (ref), v26 (copy)
        v35 = true;
        v26:Update();
    end);
    v11.ClosedEvent:connect(function() --[[ Line: 301 ]]
        -- upvalues: v35 (ref), v26 (copy)
        v35 = false;
        v26:Update();
    end);
    l_VRHub_0:SetShowTopBar(true);
    v43();
    v26.getPanel = function(_) --[[ Line: 309 ]] --[[ Name: getPanel ]]
        -- upvalues: v32 (ref)
        return v32;
    end;
    return v26;
end;