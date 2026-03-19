local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CaptureService_0 = game:GetService("CaptureService");
local l_Players_0 = game:GetService("Players");
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.Foundation);
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local v9 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v10 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_PermissionsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useTokens_0 = v7.Hooks.useTokens;
local l_useSelector_0 = v9.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useTopBarHeight_0 = v10.useTopBarHeight;
local v18 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v19 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v21 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v22 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearAnimationPreview);
local l_MenuItemEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceControlBar).Enums.MenuItemEnum;
local v24 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v25 = require(l_Modules_0.LuaApp.Actions.RemoveCurrentToastMessage);
local v26 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v27 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXPhotoboothCaptureServiceScreenshot_0 = v27.FFlagAXPhotoboothCaptureServiceScreenshot;
local l_FFlagAXPhotoboothBugBashFixes_0 = v27.FFlagAXPhotoboothBugBashFixes;
local l_FFlagAXPhotoboothShareModal_0 = v27.FFlagAXPhotoboothShareModal;
local l_game_EngineFeature_0 = game:GetEngineFeature("CaptureAllowedInUA");
local function v33(v32) --[[ Line: 45 ]] --[[ Name: selectAvatarType ]]
    return v32.AvatarExperience.AvatarEditor.Character.AvatarType;
end;
return function() --[[ Line: 49 ]] --[[ Name: usePhotoboothPageProps ]]
    -- upvalues: l_useTokens_0 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), v8 (copy), l_useSelector_0 (copy), v18 (copy), l_FFlagAXPhotoboothBugBashFixes_0 (copy), v33 (copy), l_useTopBarHeight_0 (copy), l_UserInputService_0 (copy), l_useLocalization_0 (copy), v6 (copy), v21 (copy), v22 (copy), l_MenuItemEnum_0 (copy), v19 (copy), l_AvatarScreen_0 (copy), v24 (copy), v26 (copy), v25 (copy), l_CoreGui_0 (copy), l_CaptureService_0 (copy), l_FFlagAXPhotoboothShareModal_0 (copy), l_Players_0 (copy), l_PermissionsProtocol_0 (copy), l_FFlagAXPhotoboothCaptureServiceScreenshot_0 (copy), l_game_EngineFeature_0 (copy)
    local v34 = l_useTokens_0();
    local v35 = l_useNavigation_0();
    local v36 = l_useDispatch_0();
    local v37 = v8.useRootFocusController();
    local v38 = l_useSelector_0(v18);
    local v39 = if l_FFlagAXPhotoboothBugBashFixes_0 then l_useSelector_0(v33) else nil;
    local v40 = l_useTopBarHeight_0();
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v42 = l_useLocalization_0({
        PhotoPermissionTitle = "Feature.Captures.Title.AllowPhotoAccessInfo", 
        PhotoPermissionLabel = "Feature.Captures.Description.AllowPhotoAccessInfo", 
        ScreenshotToastTitle = "Feature.Captures.Toast.CaptureSaved", 
        ScreenshotToastLabel = "Feature.Captures.Toast.CaptureSavedToDevice"
    });
    v6.useEffect(function() --[[ Line: 65 ]]
        -- upvalues: v36 (copy), v21 (ref), v22 (ref)
        v36(v21());
        v36(v22());
        return function() --[[ Line: 70 ]]
            -- upvalues: v36 (ref), v21 (ref), v22 (ref)
            v36(v21());
            v36(v22());
        end;
    end, {});
    local v43 = v6.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v35 (copy)
        v35.pop();
    end, {
        v35
    });
    local v44, v45 = v6.useState("");
    local v46, v47 = v6.useState(false);
    local v48, v49 = v6.useState(nil);
    local function _(v50) --[[ Line: 88 ]] --[[ Name: updateScreenshotPath ]]
        -- upvalues: v49 (copy)
        v49(v50);
    end;
    local v52 = v6.useCallback(function() --[[ Line: 92 ]]
        -- upvalues: v47 (copy), v49 (copy)
        v47(false);
        v49(nil);
    end, {});
    local v53 = v6.useRef(nil);
    local v54 = v6.useRef(false);
    local v55 = v6.useRef(nil);
    local v56 = v6.useCallback(function() --[[ Line: 106 ]]
        -- upvalues: v53 (copy), v55 (copy)
        if v53.current then
            if not v55.current then
                v55.current = game:GetService("TweenService"):Create(v53.current, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 1
                });
            end;
            if v55.current then
                v55.current:Cancel();
                v53.current.BackgroundTransparency = 0;
                v55.current:Play();
            end;
        end;
    end, {});
    local v58 = v6.useCallback(function(v57) --[[ Line: 128 ]]
        -- upvalues: l_FFlagAXPhotoboothBugBashFixes_0 (ref), l_MenuItemEnum_0 (ref), v39 (copy), v19 (ref), v35 (copy), l_AvatarScreen_0 (ref), v45 (copy), v44 (copy)
        if l_FFlagAXPhotoboothBugBashFixes_0 and v57 == l_MenuItemEnum_0.Photobooth.Animations and v39 == v19.AvatarType.R6 then
            v35.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                bodyTextKey = "Feature.Avatar.Message.R15AnimationsPrompt", 
                onSwitchSelected = function() --[[ Line: 138 ]] --[[ Name: onSwitchSelected ]]
                    -- upvalues: v45 (ref), l_MenuItemEnum_0 (ref)
                    v45(l_MenuItemEnum_0.Photobooth.Animations);
                end
            });
            return;
        elseif v44 == v57 then
            v45("");
            return;
        else
            v45(v57);
            return;
        end;
    end, if l_FFlagAXPhotoboothBugBashFixes_0 then {
        v44, 
        v39, 
        v35
    } else {
        v44
    });
    local v59 = v6.useMemo(function() --[[ Line: 158 ]]
        -- upvalues: l_MenuItemEnum_0 (ref), v58 (copy), v44 (copy)
        return {
            {
                type = "icon", 
                id = l_MenuItemEnum_0.Photobooth.Animations, 
                icon = "icons/controls/emoteOff", 
                onActivated = function() --[[ Line: 164 ]] --[[ Name: onActivated ]]
                    -- upvalues: v58 (ref), l_MenuItemEnum_0 (ref)
                    v58(l_MenuItemEnum_0.Photobooth.Animations);
                end, 
                isActive = v44 == l_MenuItemEnum_0.Photobooth.Animations
            }, 
            {
                type = "icon", 
                id = l_MenuItemEnum_0.Photobooth.Scenes, 
                icon = "icons/common/image-off", 
                onActivated = function() --[[ Line: 173 ]] --[[ Name: onActivated ]]
                    -- upvalues: v58 (ref), l_MenuItemEnum_0 (ref)
                    v58(l_MenuItemEnum_0.Photobooth.Scenes);
                end, 
                isActive = v44 == l_MenuItemEnum_0.Photobooth.Scenes
            }
        };
    end, if l_FFlagAXPhotoboothBugBashFixes_0 then {
        v58, 
        v44
    } else {
        v58
    });
    local v60 = v6.useCallback(function() --[[ Line: 185 ]]
        -- upvalues: v36 (copy), v24 (ref), v42 (copy), v26 (ref)
        v36(v24({
            toastMessage = v42.PhotoPermissionTitle, 
            toastSubMessage = v42.PhotoPermissionLabel, 
            isLocalized = true, 
            toastType = v26.InformationMessage
        }));
    end, {
        v42, 
        v36
    });
    local v61 = if l_FFlagAXPhotoboothBugBashFixes_0 then v6.useCallback(function() --[[ Line: 195 ]]
        -- upvalues: v36 (copy), v24 (ref), v42 (copy), v26 (ref)
        v36(v24({
            toastMessage = v42.ScreenshotToastTitle, 
            toastSubMessage = v42.ScreenshotToastLabel, 
            isLocalized = true, 
            toastType = v26.InformationMessage
        }));
    end, {
        v42, 
        v36
    }) else nil;
    local v72 = v6.useCallback(function() --[[ Line: 207 ]]
        -- upvalues: v54 (copy), l_FFlagAXPhotoboothBugBashFixes_0 (ref), v36 (copy), v25 (ref), l_CoreGui_0 (ref), l_UserInputService_0 (ref), l_l_UserInputService_0_Platform_0 (copy), l_CaptureService_0 (ref), v56 (copy), l_FFlagAXPhotoboothShareModal_0 (ref), l_Players_0 (ref), v49 (copy), v47 (copy), v61 (copy)
        task.spawn(function() --[[ Line: 208 ]]
            -- upvalues: v54 (ref), l_FFlagAXPhotoboothBugBashFixes_0 (ref), v36 (ref), v25 (ref), l_CoreGui_0 (ref), l_UserInputService_0 (ref), l_l_UserInputService_0_Platform_0 (ref), l_CaptureService_0 (ref), v56 (ref), l_FFlagAXPhotoboothShareModal_0 (ref), l_Players_0 (ref), v49 (ref), v47 (ref), v61 (ref)
            if v54.current then
                return;
            else
                v54.current = true;
                local v62 = {};
                if l_FFlagAXPhotoboothBugBashFixes_0 then
                    v36(v25());
                    local l_PageWrapper_0 = l_CoreGui_0:FindFirstChild("PageWrapper");
                    if l_PageWrapper_0 then
                        local l_AppContainer_0 = l_PageWrapper_0:FindFirstChild("AppContainer");
                        if l_AppContainer_0 then
                            for _, v66 in pairs(l_AppContainer_0:GetChildren()) do
                                if v66.Name == "Toast" and v66:IsA("ScreenGui") then
                                    v66.Enabled = false;
                                    table.insert(v62, v66);
                                end;
                            end;
                        end;
                    end;
                end;
                local l_LuaAppScreenGui_0 = l_CoreGui_0:FindFirstChild("LuaAppScreenGui");
                if l_LuaAppScreenGui_0 then
                    l_LuaAppScreenGui_0.Enabled = false;
                end;
                local l_MouseIconEnabled_0 = l_UserInputService_0.MouseIconEnabled;
                l_UserInputService_0.MouseIconEnabled = false;
                task.spawn(function() --[[ Line: 241 ]]
                    -- upvalues: l_l_UserInputService_0_Platform_0 (ref), l_CaptureService_0 (ref), l_LuaAppScreenGui_0 (copy), l_UserInputService_0 (ref), l_MouseIconEnabled_0 (copy), v56 (ref), l_FFlagAXPhotoboothBugBashFixes_0 (ref), v62 (copy), l_FFlagAXPhotoboothShareModal_0 (ref), l_Players_0 (ref), v49 (ref), v47 (ref), v61 (ref), v54 (ref)
                    local v69 = game.ScreenshotReady:Wait();
                    if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
                        l_CaptureService_0:SaveCaptureToExternalStorage(v69);
                    end;
                    if l_LuaAppScreenGui_0 then
                        l_LuaAppScreenGui_0.Enabled = true;
                    end;
                    l_UserInputService_0.MouseIconEnabled = l_MouseIconEnabled_0;
                    v56();
                    if l_FFlagAXPhotoboothBugBashFixes_0 then
                        for _, v71 in v62 do
                            if v71.Parent and v71:IsA("ScreenGui") then
                                v71.Enabled = true;
                            end;
                        end;
                        table.clear(v62);
                    end;
                    if l_FFlagAXPhotoboothShareModal_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer:GetUnder13() == false then
                        v49(v69);
                        v47(true);
                    end;
                    if v61 then
                        v61();
                    end;
                    v54.current = false;
                end);
                l_CoreGui_0:TakeScreenshot();
                return;
            end;
        end);
    end, {
        v56, 
        v60, 
        l_l_UserInputService_0_Platform_0
    });
    local v86 = v6.useCallback(function() --[[ Line: 288 ]]
        -- upvalues: v54 (copy), l_FFlagAXPhotoboothBugBashFixes_0 (ref), v36 (copy), v25 (ref), l_CoreGui_0 (ref), l_UserInputService_0 (ref), l_CaptureService_0 (ref), v56 (copy), l_FFlagAXPhotoboothShareModal_0 (ref), l_Players_0 (ref), v49 (copy), v47 (copy), v61 (copy)
        task.spawn(function() --[[ Line: 289 ]]
            -- upvalues: v54 (ref), l_FFlagAXPhotoboothBugBashFixes_0 (ref), v36 (ref), v25 (ref), l_CoreGui_0 (ref), l_UserInputService_0 (ref), l_CaptureService_0 (ref), v56 (ref), l_FFlagAXPhotoboothShareModal_0 (ref), l_Players_0 (ref), v49 (ref), v47 (ref), v61 (ref)
            if v54.current then
                return;
            else
                v54.current = true;
                local v73 = {};
                if l_FFlagAXPhotoboothBugBashFixes_0 then
                    v36(v25());
                    local l_PageWrapper_1 = l_CoreGui_0:FindFirstChild("PageWrapper");
                    if l_PageWrapper_1 then
                        local l_AppContainer_1 = l_PageWrapper_1:FindFirstChild("AppContainer");
                        if l_AppContainer_1 then
                            for _, v77 in pairs(l_AppContainer_1:GetChildren()) do
                                if v77.Name == "Toast" and v77:IsA("ScreenGui") then
                                    v77.Enabled = false;
                                    table.insert(v73, v77);
                                end;
                            end;
                        end;
                    end;
                end;
                local l_LuaAppScreenGui_1 = l_CoreGui_0:FindFirstChild("LuaAppScreenGui");
                if l_LuaAppScreenGui_1 then
                    l_LuaAppScreenGui_1.Enabled = false;
                end;
                local l_MouseIconEnabled_1 = l_UserInputService_0.MouseIconEnabled;
                l_UserInputService_0.MouseIconEnabled = false;
                l_CaptureService_0:CaptureScreenshot(function(v80) --[[ Line: 321 ]]
                    -- upvalues: v56 (ref), l_LuaAppScreenGui_1 (copy), l_UserInputService_0 (ref), l_MouseIconEnabled_1 (copy), v54 (ref), l_CaptureService_0 (ref), l_FFlagAXPhotoboothBugBashFixes_0 (ref), v73 (copy), l_FFlagAXPhotoboothShareModal_0 (ref), l_Players_0 (ref), v49 (ref), v47 (ref), v61 (ref)
                    v56();
                    local v81 = task.delay(10, function() --[[ Line: 324 ]]
                        -- upvalues: l_LuaAppScreenGui_1 (ref), l_UserInputService_0 (ref), l_MouseIconEnabled_1 (ref), v54 (ref)
                        if l_LuaAppScreenGui_1 then
                            l_LuaAppScreenGui_1.Enabled = true;
                        end;
                        l_UserInputService_0.MouseIconEnabled = l_MouseIconEnabled_1;
                        v54.current = false;
                    end);
                    task.spawn(function() --[[ Line: 332 ]]
                        -- upvalues: l_CaptureService_0 (ref), v80 (copy), v81 (ref), l_LuaAppScreenGui_1 (ref), l_FFlagAXPhotoboothBugBashFixes_0 (ref), v73 (ref), l_FFlagAXPhotoboothShareModal_0 (ref), l_Players_0 (ref), v49 (ref), v47 (ref), v61 (ref), l_UserInputService_0 (ref), l_MouseIconEnabled_1 (ref), v54 (ref)
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 333 ]]
                            -- upvalues: l_CaptureService_0 (ref), v80 (ref)
                            return l_CaptureService_0:GetCaptureFilePathAsync(v80);
                        end);
                        if v81 then
                            task.cancel(v81);
                            v81 = nil;
                        end;
                        if l_status_0 and l_result_0 then
                            l_CaptureService_0:SaveCaptureToExternalStorage(l_result_0);
                        end;
                        if l_LuaAppScreenGui_1 then
                            l_LuaAppScreenGui_1.Enabled = true;
                        end;
                        if l_FFlagAXPhotoboothBugBashFixes_0 then
                            for _, v85 in v73 do
                                if v85.Parent and v85:IsA("ScreenGui") then
                                    v85.Enabled = true;
                                end;
                            end;
                            table.clear(v73);
                        end;
                        if l_FFlagAXPhotoboothShareModal_0 and l_Players_0.LocalPlayer and l_Players_0.LocalPlayer:GetUnder13() == false then
                            v49(l_result_0);
                            v47(true);
                        end;
                        if v61 then
                            v61();
                        end;
                        l_UserInputService_0.MouseIconEnabled = l_MouseIconEnabled_1;
                        v54.current = false;
                    end);
                end);
                return;
            end;
        end);
    end, {
        v56, 
        v60, 
        l_l_UserInputService_0_Platform_0
    });
    local v93 = v6.useCallback(function() --[[ Line: 379 ]]
        -- upvalues: l_l_UserInputService_0_Platform_0 (copy), l_PermissionsProtocol_0 (ref), v72 (copy), v60 (copy), l_FFlagAXPhotoboothCaptureServiceScreenshot_0 (ref), l_game_EngineFeature_0 (ref), v86 (copy)
        local v87 = true;
        if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
            v87 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
        end;
        if v87 then
            l_PermissionsProtocol_0.default:hasPermissions({
                l_PermissionsProtocol_0.Permissions.WRITE_MEDIA_STORAGE
            }):andThen(function(v88) --[[ Line: 387 ]]
                -- upvalues: l_PermissionsProtocol_0 (ref), v72 (ref), v60 (ref)
                if v88.status == l_PermissionsProtocol_0.Status.AUTHORIZED then
                    v72();
                    return;
                else
                    l_PermissionsProtocol_0.default:requestPermissions({
                        l_PermissionsProtocol_0.Permissions.WRITE_MEDIA_STORAGE
                    }):andThen(function(v89) --[[ Line: 397 ]]
                        -- upvalues: l_PermissionsProtocol_0 (ref), v72 (ref), v60 (ref)
                        local v90 = true;
                        if v89.status ~= l_PermissionsProtocol_0.Status.AUTHORIZED then
                            v90 = v89.status == l_PermissionsProtocol_0.Status.UNSUPPORTED;
                        end;
                        if v90 then
                            v72();
                            return;
                        else
                            v60();
                            return;
                        end;
                    end):catch(function(v91) --[[ Line: 408 ]]
                        -- upvalues: v60 (ref)
                        warn("Permission request failed:", v91);
                        v60();
                    end);
                    return;
                end;
            end):catch(function(v92) --[[ Line: 414 ]]
                -- upvalues: v60 (ref)
                warn("Permission check failed:", v92);
                v60();
            end);
            return;
        elseif l_FFlagAXPhotoboothCaptureServiceScreenshot_0 and l_game_EngineFeature_0 then
            v86();
            return;
        else
            v72();
            return;
        end;
    end, {
        v72, 
        v60
    });
    local v94 = v6.useMemo(function() --[[ Line: 428 ]]
        -- upvalues: l_MenuItemEnum_0 (ref), v58 (copy), v93 (copy)
        return {
            {
                type = "icon", 
                id = l_MenuItemEnum_0.Photobooth.Screenshot, 
                icon = "icons/controls/screenshot", 
                onActivated = function() --[[ Line: 434 ]] --[[ Name: onActivated ]]
                    -- upvalues: v58 (ref), v93 (ref)
                    v58("");
                    v93();
                end, 
                isActive = false
            }
        };
    end, {
        v58, 
        v93
    });
    return {
        tokens = v34, 
        isPortrait = v38, 
        topBarHeight = v40, 
        onBackButtonPressed = v43, 
        focusController = v37, 
        firstMenuItems = v59, 
        secondMenuItems = v94, 
        activeMenuItemId = v44, 
        onMenuItemActivated = v58, 
        flashRef = v53, 
        isShareModalVisible = v46, 
        screenshotPath = v48, 
        onShareModalClose = v52
    };
end;