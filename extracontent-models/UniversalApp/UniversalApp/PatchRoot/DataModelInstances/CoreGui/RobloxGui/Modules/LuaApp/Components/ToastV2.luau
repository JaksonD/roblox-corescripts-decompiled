local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_Toast_0 = v6.App.Dialog.Toast;
local v8 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v13 = require(l_Modules_0.LuaApp.Actions.RemoveCurrentToastMessage);
local v14 = require(l_Modules_0.LuaApp.Thunks.OpenGameDetails);
local v15 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v16 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local v17 = require(l_Modules_0.LuaApp.Components.Images);
local l_Images_0 = v6.App.ImageSet.Images;
local v19 = v17["LuaApp/graphic/ic_alert"];
local v20 = v17["LuaApp/graphic/ic_logo"];
local v21 = l_Images_0["icons/common/notificationOn"];
local v22 = l_Images_0["icons/common/notificationOff"];
local v23 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local l_GetNotificationsExperienceDetailsVariant_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant;
local l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagNotificationsForceEnableEDPDiscoverability;
local v26 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRReadyWrapper_0 = v26.VRReadyWrapper;
local l_VRConstants_0 = v26.VRConstants;
local v29 = {
    frequency = 4, 
    damping = 1
};
local v30 = v3.PureComponent:extend("ToastV2");
v30.defaultProps = {
    duration = 3, 
    springOptions = {
        frequency = 150, 
        damping = 1
    }
};
v30.validateProps = v5.strictInterface({
    duration = v5.optional(v5.integer), 
    springOptions = v5.optional(v5.table), 
    displayOrder = v5.optional(v5.integer), 
    localization = v5.table, 
    currentToastMessage = v5.optional(v5.table), 
    currentRoute = v5.table, 
    openGameDetails = v5.callback, 
    removeCurrentToastMessage = v5.callback, 
    enableNotificationsDiscoverability = v5.optional(v5.boolean)
});
v30.openLuaGameDetails = function(v31, v32) --[[ Line: 83 ]] --[[ Name: openLuaGameDetails ]]
    v31.props.openGameDetails(v32);
end;
v30.init = function(v33) --[[ Line: 87 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy)
    v33.onDismissed = function() --[[ Line: 88 ]]
        -- upvalues: v33 (copy)
        v33.props.removeCurrentToastMessage();
    end;
    v33.onButtonActivated = function() --[[ Line: 92 ]]
        -- upvalues: v33 (copy), v15 (ref)
        if v33.props.currentToastMessage then
            local l_currentToastMessage_0 = v33.props.currentToastMessage;
            local l_toastType_0 = l_currentToastMessage_0.toastType;
            local l_universeId_0 = l_currentToastMessage_0.universeId;
            if l_toastType_0 == v15.QuickLaunchError and l_universeId_0 then
                v33:openLuaGameDetails(l_universeId_0);
            end;
            v33.props.removeCurrentToastMessage();
        end;
    end;
end;
v30.onRender = function(v37) --[[ Line: 105 ]] --[[ Name: onRender ]]
    -- upvalues: l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 (copy), v15 (copy), v20 (copy), v19 (copy), v21 (copy), v22 (copy), l_UserInputService_0 (copy), v3 (copy), l_Toast_0 (copy), v29 (copy), v23 (copy), l_withLocalization_0 (copy)
    local l_localization_0 = v37.props.localization;
    local v39 = l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() and true or v37.props.enableNotificationsDiscoverability;
    local l_currentToastMessage_1 = v37.props.currentToastMessage;
    local l_toastMessage_0 = l_currentToastMessage_1.toastMessage;
    local l_toastSubMessage_0 = l_currentToastMessage_1.toastSubMessage;
    local l_sequenceNumber_0 = l_currentToastMessage_1.sequenceNumber;
    local v44 = l_currentToastMessage_1.isLocalized or false;
    local v45 = nil;
    local v46 = nil;
    local l_toastType_1 = l_currentToastMessage_1.toastType;
    if l_toastType_1 == v15.QuickLaunchError then
        v46 = v37.onButtonActivated;
    elseif l_toastType_1 == v15.SuccessConfirmation then
        v45 = v20;
    elseif l_toastType_1 == v15.NetworkingError then
        v45 = v19;
    elseif l_toastType_1 == v15.InformationMessage then
        v45 = v20;
    elseif v39 and l_toastType_1 == v15.NotificationsTurnedOn then
        v45 = v21;
    elseif v39 and l_toastType_1 == v15.NotificationsTurnedOff then
        v45 = v22;
    end;
    if l_currentToastMessage_1.toastIcon then
        v45 = l_currentToastMessage_1.toastIcon;
    end;
    local v48 = (l_UserInputService_0.StatusBarSize and l_UserInputService_0.StatusBarSize.Y or 0) + 20;
    local v49 = UDim2.new(0.5, 0, 0, v48);
    local function v51(v50) --[[ Line: 144 ]]
        -- upvalues: v3 (ref), l_Toast_0 (ref), v49 (copy), v45 (ref), l_currentToastMessage_1 (copy), v46 (ref), v37 (copy), l_sequenceNumber_0 (copy), v29 (ref)
        return v3.createElement(l_Toast_0, {
            position = v49, 
            show = true, 
            toastContent = {
                iconImage = v45, 
                iconColorStyle = if l_currentToastMessage_1 and l_currentToastMessage_1.toastIconColorStyle then l_currentToastMessage_1.toastIconColorStyle else nil, 
                onActivated = v46, 
                onDismissed = v37.onDismissed, 
                toastSubtitle = v50.toastSubMessage, 
                sequenceNumber = l_sequenceNumber_0, 
                toastTitle = v50.toastMessage
            }, 
            duration = v37.props.duration, 
            springOptions = if l_currentToastMessage_1.slideIn then v29 else v37.props.springOptions
        });
    end;
    if v23() then
        if v44 then
            return v51({
                toastMessage = l_toastMessage_0, 
                toastSubMessage = l_toastSubMessage_0
            });
        else
            return l_withLocalization_0({
                toastMessage = l_toastMessage_0, 
                toastSubMessage = l_toastSubMessage_0
            })(v51);
        end;
    else
        return v51(v44 and {
            toastMessage = l_toastMessage_0, 
            toastSubMessage = l_toastSubMessage_0
        } or {
            toastMessage = l_toastMessage_0 and l_localization_0:Format(l_toastMessage_0) or nil, 
            toastSubMessage = l_toastSubMessage_0 and l_localization_0:Format(l_toastSubMessage_0) or nil
        });
    end;
end;
v30.render = function(v52) --[[ Line: 188 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_VRReadyWrapper_0 (copy), v16 (copy), l_VRConstants_0 (copy)
    local l_displayOrder_0 = v52.props.displayOrder;
    if not v52.props.currentToastMessage then
        return nil;
    else
        return v3.createElement(l_VRReadyWrapper_0, {
            component = v16, 
            props = {
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = l_displayOrder_0
            }, 
            vrProps = {
                partSize = l_VRConstants_0.ToastSize, 
                offset = CFrame.lookAt(l_VRConstants_0.ToastPosition, l_VRConstants_0.DefaultCameraPosition), 
                virtualScreenSize = l_VRConstants_0.ToastResolution, 
                curvature = l_VRConstants_0.ToastCurvature, 
                panelName = "Toast"
            }
        }, {
            Toast = v52:onRender()
        });
    end;
end;
v30.didUpdate = function(v54, v55, _) --[[ Line: 214 ]] --[[ Name: didUpdate ]]
    -- upvalues: v15 (copy)
    local l_currentToastMessage_2 = v54.props.currentToastMessage;
    if l_currentToastMessage_2 then
        if not next(l_currentToastMessage_2) or not l_currentToastMessage_2.toastMessage then
            v54.props.removeCurrentToastMessage();
        end;
        if v55.currentRoute ~= v54.props.currentRoute and l_currentToastMessage_2.toastType == v15.QuickLaunchError then
            v54.props.removeCurrentToastMessage();
        end;
    end;
end;
v30 = v4.connect(function(v58, _) --[[ Line: 233 ]]
    return {
        currentToastMessage = v58.CurrentToastMessages.currentToastMessage, 
        currentRoute = v58.Navigation.history[#v58.Navigation.history]
    };
end, function(v60) --[[ Line: 238 ]]
    -- upvalues: v13 (copy), v14 (copy)
    return {
        removeCurrentToastMessage = function() --[[ Line: 240 ]] --[[ Name: removeCurrentToastMessage ]]
            -- upvalues: v60 (copy), v13 (ref)
            return v60(v13());
        end, 
        openGameDetails = function(v61) --[[ Line: 243 ]] --[[ Name: openGameDetails ]]
            -- upvalues: v60 (copy), v14 (ref)
            v60(v14(v61));
        end
    };
end)(v30);
if not l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() then
    v30 = v8.connectUserLayer({
        l_AppUserLayers_0.ExperienceDetailsPageLayer
    }, function(v62, _) --[[ Line: 252 ]]
        -- upvalues: l_AppUserLayers_0 (copy), l_GetNotificationsExperienceDetailsVariant_0 (copy)
        return {
            enableNotificationsDiscoverability = ((v62[l_AppUserLayers_0.ExperienceDetailsPageLayer] or {})[l_GetNotificationsExperienceDetailsVariant_0.getNotificationsVariantFieldName] or -1) == 2
        };
    end)(v30);
end;
return l_RoactServices_0.connect({
    localization = v10
})(v30);