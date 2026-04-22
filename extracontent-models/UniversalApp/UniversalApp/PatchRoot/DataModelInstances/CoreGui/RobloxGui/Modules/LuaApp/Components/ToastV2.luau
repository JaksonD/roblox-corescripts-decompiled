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
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v11 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v14 = require(l_Modules_0.LuaApp.Actions.RemoveCurrentToastMessage);
local v15 = require(l_Modules_0.LuaApp.Thunks.OpenGameDetails);
local v16 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v17 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local v18 = require(l_Modules_0.LuaApp.Components.Images);
local l_Images_0 = v6.App.ImageSet.Images;
local v20 = v18["LuaApp/graphic/ic_alert"];
local v21 = v18["LuaApp/graphic/ic_logo"];
local v22 = l_Images_0["icons/common/notificationOn"];
local v23 = l_Images_0["icons/common/notificationOff"];
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local l_GetNotificationsExperienceDetailsVariant_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant;
local l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagNotificationsForceEnableEDPDiscoverability;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local v28 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRReadyWrapper_0 = v28.VRReadyWrapper;
local l_VRConstants_0 = v28.VRConstants;
local v31 = {
    frequency = 4, 
    damping = 1
};
local v32 = v3.PureComponent:extend("ToastV2");
v32.defaultProps = {
    duration = 3, 
    springOptions = {
        frequency = 150, 
        damping = 1
    }
};
v32.validateProps = v5.strictInterface({
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
v32.openLuaGameDetails = function(v33, v34) --[[ Line: 85 ]] --[[ Name: openLuaGameDetails ]]
    v33.props.openGameDetails(v34);
end;
v32.init = function(v35) --[[ Line: 89 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy)
    v35.onDismissed = function() --[[ Line: 90 ]]
        -- upvalues: v35 (copy)
        v35.props.removeCurrentToastMessage();
    end;
    v35.onButtonActivated = function() --[[ Line: 94 ]]
        -- upvalues: v35 (copy), v16 (ref)
        if v35.props.currentToastMessage then
            local l_currentToastMessage_0 = v35.props.currentToastMessage;
            local l_toastType_0 = l_currentToastMessage_0.toastType;
            local l_universeId_0 = l_currentToastMessage_0.universeId;
            if l_toastType_0 == v16.QuickLaunchError and l_universeId_0 then
                v35:openLuaGameDetails(l_universeId_0);
            end;
            v35.props.removeCurrentToastMessage();
        end;
    end;
end;
v32.onRender = function(v39) --[[ Line: 107 ]] --[[ Name: onRender ]]
    -- upvalues: l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 (copy), v16 (copy), v21 (copy), v20 (copy), v22 (copy), v23 (copy), l_UserInputService_0 (copy), v3 (copy), l_Toast_0 (copy), v31 (copy), v24 (copy), l_withLocalization_0 (copy)
    local l_localization_0 = v39.props.localization;
    local v41 = l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() and true or v39.props.enableNotificationsDiscoverability;
    local l_currentToastMessage_1 = v39.props.currentToastMessage;
    local l_toastMessage_0 = l_currentToastMessage_1.toastMessage;
    local l_toastSubMessage_0 = l_currentToastMessage_1.toastSubMessage;
    local l_sequenceNumber_0 = l_currentToastMessage_1.sequenceNumber;
    local v46 = l_currentToastMessage_1.isLocalized or false;
    local v47 = nil;
    local v48 = nil;
    local l_toastType_1 = l_currentToastMessage_1.toastType;
    if l_toastType_1 == v16.QuickLaunchError then
        v48 = v39.onButtonActivated;
    elseif l_toastType_1 == v16.SuccessConfirmation then
        v47 = v21;
    elseif l_toastType_1 == v16.NetworkingError then
        v47 = v20;
    elseif l_toastType_1 == v16.InformationMessage then
        v47 = v21;
    elseif v41 and l_toastType_1 == v16.NotificationsTurnedOn then
        v47 = v22;
    elseif v41 and l_toastType_1 == v16.NotificationsTurnedOff then
        v47 = v23;
    end;
    if l_currentToastMessage_1.toastIcon then
        v47 = l_currentToastMessage_1.toastIcon;
    end;
    local v50 = (l_UserInputService_0.StatusBarSize and l_UserInputService_0.StatusBarSize.Y or 0) + 20;
    local v51 = UDim2.new(0.5, 0, 0, v50);
    local function v53(v52) --[[ Line: 146 ]]
        -- upvalues: v3 (ref), l_Toast_0 (ref), v51 (copy), v47 (ref), l_currentToastMessage_1 (copy), v48 (ref), v39 (copy), l_sequenceNumber_0 (copy), v31 (ref)
        return v3.createElement(l_Toast_0, {
            position = v51, 
            show = true, 
            toastContent = {
                iconImage = v47, 
                iconColorStyle = if l_currentToastMessage_1 and l_currentToastMessage_1.toastIconColorStyle then l_currentToastMessage_1.toastIconColorStyle else nil, 
                onActivated = v48, 
                onDismissed = v39.onDismissed, 
                toastSubtitle = v52.toastSubMessage, 
                sequenceNumber = l_sequenceNumber_0, 
                toastTitle = v52.toastMessage
            }, 
            duration = v39.props.duration, 
            springOptions = if l_currentToastMessage_1.slideIn then v31 else v39.props.springOptions
        });
    end;
    if v24() then
        if v46 then
            return v53({
                toastMessage = l_toastMessage_0, 
                toastSubMessage = l_toastSubMessage_0
            });
        else
            return l_withLocalization_0({
                toastMessage = l_toastMessage_0, 
                toastSubMessage = l_toastSubMessage_0
            })(v53);
        end;
    else
        return v53(v46 and {
            toastMessage = l_toastMessage_0, 
            toastSubMessage = l_toastSubMessage_0
        } or {
            toastMessage = l_toastMessage_0 and l_localization_0:Format(l_toastMessage_0) or nil, 
            toastSubMessage = l_toastSubMessage_0 and l_localization_0:Format(l_toastSubMessage_0) or nil
        });
    end;
end;
v32.render = function(v54) --[[ Line: 190 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_VRReadyWrapper_0 (copy), v17 (copy), l_VRConstants_0 (copy)
    local l_displayOrder_0 = v54.props.displayOrder;
    if not v54.props.currentToastMessage then
        return nil;
    else
        return v3.createElement(l_VRReadyWrapper_0, {
            component = v17, 
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
            Toast = v54:onRender()
        });
    end;
end;
v32.didUpdate = function(v56, v57, _) --[[ Line: 216 ]] --[[ Name: didUpdate ]]
    -- upvalues: v16 (copy)
    local l_currentToastMessage_2 = v56.props.currentToastMessage;
    if l_currentToastMessage_2 then
        if not next(l_currentToastMessage_2) or not l_currentToastMessage_2.toastMessage then
            v56.props.removeCurrentToastMessage();
        end;
        if v57.currentRoute ~= v56.props.currentRoute and l_currentToastMessage_2.toastType == v16.QuickLaunchError then
            v56.props.removeCurrentToastMessage();
        end;
    end;
end;
v32 = v4.connect(function(v60, _) --[[ Line: 235 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    return {
        currentToastMessage = v60.CurrentToastMessages.currentToastMessage, 
        currentRoute = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v60) else v60.Navigation.history[#v60.Navigation.history]
    };
end, function(v62) --[[ Line: 242 ]]
    -- upvalues: v14 (copy), v15 (copy)
    return {
        removeCurrentToastMessage = function() --[[ Line: 244 ]] --[[ Name: removeCurrentToastMessage ]]
            -- upvalues: v62 (copy), v14 (ref)
            return v62(v14());
        end, 
        openGameDetails = function(v63) --[[ Line: 247 ]] --[[ Name: openGameDetails ]]
            -- upvalues: v62 (copy), v15 (ref)
            v62(v15(v63));
        end
    };
end)(v32);
if not l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() then
    v32 = v8.connectUserLayer({
        l_AppUserLayers_0.ExperienceDetailsPageLayer
    }, function(v64, _) --[[ Line: 256 ]]
        -- upvalues: l_AppUserLayers_0 (copy), l_GetNotificationsExperienceDetailsVariant_0 (copy)
        return {
            enableNotificationsDiscoverability = ((v64[l_AppUserLayers_0.ExperienceDetailsPageLayer] or {})[l_GetNotificationsExperienceDetailsVariant_0.getNotificationsVariantFieldName] or -1) == 2
        };
    end)(v32);
end;
return l_RoactServices_0.connect({
    localization = v11
})(v32);