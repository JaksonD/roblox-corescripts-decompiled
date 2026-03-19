local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Service);
local v4 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_SocialService_0 = game:GetService("SocialService");
local l_StarterGui_0 = game:GetService("StarterGui");
local v9 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local l_MappedSignal_0 = v4.MappedSignal;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_TopBar_0 = l_RobloxGui_0.Modules.TopBar;
local v13 = require(l_TopBar_0.Constants);
local v14 = v13.ApplyDisplayScale(v13.TopBarHeight);
local l_SelfieView_0 = l_script_FirstAncestor_0.Parent.SelfieView;
local v16 = require(l_script_FirstAncestor_0.Flags.GetFFlagChromeSelfViewIgnoreCoreGui);
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local l_FFlagEnableConsoleExpControls_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls;
local v19 = require(l_SelfieView_0);
local v20 = require(l_SelfieView_0.Utils.FaceChatUtils);
local v21 = require(l_SelfieView_0.Utils.SizingUtils);
local v22 = require(l_SelfieView_0.Utils.SelfieViewPolicy);
local l_AvailabilitySignalState_0 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils).AvailabilitySignalState;
local v24 = require(l_script_FirstAncestor_0.ChromeShared.Service.WindowSizeSignal);
local v25 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.UnibarStyle);
local v26 = require(l_script_FirstAncestor_0.ChromeShared.Service.ViewportUtil);
local v27 = v21.getSize(v26.screenSize:get(), false);
local v28 = v24.new(v27.X, v27.Y);
local v29 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v30 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
local l_SELFIE_VIEW_ID_0 = v29.SELFIE_VIEW_ID;
local v32 = l_MappedSignal_0.new(v3:onIntegrationStatusChanged(), function() --[[ Line: 49 ]]
    -- upvalues: v3 (copy), l_SELFIE_VIEW_ID_0 (copy)
    return v3:isWindowOpen(l_SELFIE_VIEW_ID_0);
end);
local v33 = nil;
local v34 = nil;
local v44 = v3:register({
    id = l_SELFIE_VIEW_ID_0, 
    label = "CoreScripts.TopBar.SelfViewLabel", 
    windowSize = v28, 
    windowDefaultOpen = false, 
    initialAvailability = l_AvailabilitySignalState_0.Unavailable, 
    persistWindowState = true, 
    activated = function() --[[ Line: 67 ]] --[[ Name: activated ]]
        -- upvalues: v3 (copy), l_SELFIE_VIEW_ID_0 (copy)
        v3:toggleWindow(l_SELFIE_VIEW_ID_0);
    end, 
    isActivated = function() --[[ Line: 70 ]] --[[ Name: isActivated ]]
        -- upvalues: v32 (copy)
        return v32:get();
    end, 
    draggable = true, 
    cachePosition = true, 
    components = {
        Icon = function(_) --[[ Line: 76 ]] --[[ Name: Icon ]]
            -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), v25 (copy), v29 (copy), v2 (copy), v9 (copy), v32 (copy), v19 (copy), v3 (copy), l_SELFIE_VIEW_ID_0 (copy)
            local _ = nil;
            local v37 = nil;
            v37 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then v25.use().ICON_SIZE else v29.ICON_SIZE;
            return v2.createElement("Frame", {
                Size = UDim2.new(0, v37, 0, v37), 
                BackgroundTransparency = 1
            }, {
                v9("icons/controls/selfieOff", "icons/controls/selfie", v32); 
                CameraStatusDot = if not v19.useCameraOn() or v3:isWindowOpen(l_SELFIE_VIEW_ID_0) then nil else v2.createElement(v19.CameraStatusDot, {
                    Position = UDim2.fromScale(0.8, 0.7), 
                    ZIndex = 2
                })
            }, {});
        end, 
        Window = function(_) --[[ Line: 98 ]] --[[ Name: Window ]]
            -- upvalues: v3 (copy), l_SELFIE_VIEW_ID_0 (copy), v2 (copy), v19 (copy), v28 (copy)
            local v39 = v3:dragConnection(l_SELFIE_VIEW_ID_0);
            local l_createElement_0 = v2.createElement;
            local l_Window_0 = v19.Window;
            local v42 = {
                id = l_SELFIE_VIEW_ID_0, 
                windowSize = v28
            };
            local v43 = false;
            if v39 ~= nil then
                v43 = v39.connection ~= nil;
            end;
            v42.isDraggedOut = v43;
            return l_createElement_0(l_Window_0, v42, {});
        end
    }
});
v26.screenSize:connect(function(v45) --[[ Line: 110 ]]
    -- upvalues: v3 (copy), l_SELFIE_VIEW_ID_0 (copy), v21 (copy), v28 (copy)
    if not v3:isWindowOpen(l_SELFIE_VIEW_ID_0) then
        local v46 = v21.getSize(v45, v28:getIsLarge());
        v28:requestSize(v46.X, v46.Y);
    end;
end, true);
local function v51() --[[ Line: 117 ]]
    -- upvalues: l_StarterGui_0 (copy), v16 (copy), v20 (copy), v44 (copy)
    local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.SelfView);
    if not v16() and not l_l_StarterGui_0_CoreGuiEnabled_0 then
        if v20.isCameraOn() then
            v20.toggleVideoAnimation();
        end;
        v44.availability:unavailable();
        return;
    else
        local v48 = v20.getPermissions();
        local v49 = v48.placeCamEnabled or v48.placeMicEnabled;
        local v50 = v48.userCamEligible or v48.userMicEligible;
        if not v49 or not v50 then
            v44.availability:unavailable();
            return;
        else
            v44.availability:available();
            return;
        end;
    end;
end;
local function _() --[[ Line: 145 ]]
    -- upvalues: v20 (copy), v30 (copy)
    local v52 = v20.getPermissions();
    v30:reportExperienceSettings(true, v52.placeCamEnabled, v52.placeMicEnabled);
    v30:reportUserAccountSettings(v52.userCamEnabled, v52.userMicEnabled);
end;
if l_FFlagEnableConsoleExpControls_0 then
    local v54 = v22.PolicyImplementation.read();
    if not if v54 then v22.Mapper(v54).eligibleForSelfieViewFeature() else false then
        v44.availability:forceUnavailable();
    end;
end;
if game:GetEngineFeature("VideoCaptureService") then
    v51();
    l_VideoCaptureService_0.Started:Connect(v51);
    l_VideoCaptureService_0.Stopped:Connect(v51);
    l_VideoCaptureService_0.DevicesChanged:Connect(v51);
    l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(v51);
    l_FaceAnimatorService_0:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(v51);
    local v55 = v20.getPermissions();
    v30:reportExperienceSettings(true, v55.placeCamEnabled, v55.placeMicEnabled);
    v30:reportUserAccountSettings(v55.userCamEnabled, v55.userMicEnabled);
end;
l_StarterGui_0.CoreGuiChangedSignal:Connect(v51);
if game:GetEngineFeature("EnableSelfViewToggleApi") then
    if v33 then
        v33:Disconnect();
        v33 = nil;
    end;
    if v34 then
        v34:Disconnect();
        v34 = nil;
    end;
    v33 = l_SocialService_0.SelfViewVisible:Connect(function(v56) --[[ Line: 183 ]]
        -- upvalues: v13 (copy), v3 (copy), l_SELFIE_VIEW_ID_0 (copy), v28 (copy), v26 (copy), v29 (copy), v14 (copy)
        local v57 = v13.ApplyDisplayScale(v13.ScreenSideOffset);
        if not v3:isWindowOpen(l_SELFIE_VIEW_ID_0) then
            local v58 = v28:get();
            local v59 = v26.screenSize:get();
            local v60 = nil;
            if v56 == Enum.SelfViewPosition.TopLeft then
                v60 = UDim2.fromOffset(v57, v29.WINDOW_DEFAULT_PADDING);
            elseif v56 == Enum.SelfViewPosition.TopRight then
                v60 = UDim2.fromOffset(v59.X - (v58.X.Offset + v57), v29.WINDOW_DEFAULT_PADDING);
            elseif v56 == Enum.SelfViewPosition.BottomLeft then
                v60 = UDim2.fromOffset(v57, v59.Y - (v14 + v58.Y.Offset + v29.WINDOW_DEFAULT_PADDING));
            elseif v56 == Enum.SelfViewPosition.BottomRight then
                v60 = UDim2.fromOffset(v59.X - (v58.X.Offset + v57), v59.Y - (v14 + v58.Y.Offset + v29.WINDOW_DEFAULT_PADDING));
            end;
            v3:toggleWindow(l_SELFIE_VIEW_ID_0);
            if v60 then
                v3:updateWindowPosition(l_SELFIE_VIEW_ID_0, v60);
            end;
        end;
    end);
    v34 = l_SocialService_0.SelfViewHidden:Connect(function() --[[ Line: 217 ]]
        -- upvalues: v3 (copy), l_SELFIE_VIEW_ID_0 (copy)
        if v3:isWindowOpen(l_SELFIE_VIEW_ID_0) then
            v3:toggleWindow(l_SELFIE_VIEW_ID_0);
        end;
    end);
end;
return v44;