local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_IXPService_0 = game:GetService("IXPService");
local v6 = require(l_Parent_0.Localization);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.RoactUtils);
local v9 = require(l_Parent_0.SocialCommon);
local v10 = require(l_Parent_0.UIBlox);
local v11 = require(l_Parent_0.UniversalAppPolicy);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local v13 = require(l_Parent_0.FocusNavigationUtils);
local l_HeaderBar_0 = v10.App.Bar.HeaderBar;
local l_IconButton_0 = v10.App.Button.IconButton;
local l_IconSize_0 = v10.App.ImageSet.Enum.IconSize;
local l_Images_0 = v10.App.ImageSet.Images;
local l_TooltipOrientation_0 = v10.App.Dialog.Enum.TooltipOrientation;
local l_withTooltip_0 = v10.App.Dialog.TooltipV2.withTooltip;
local l_makeBackButton_0 = require(l_Parent_0.AppHeaderBar).makeBackButton;
local l_ExternalEventConnection_0 = v8.ExternalEventConnection;
local l_InputUtilities_0 = v9.Utils.InputUtilities;
local v23 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v24 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v25 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useAppPolicy_0 = v11.useAppPolicy;
local l_useLocalization_0 = v6.Hooks.useLocalization;
local l_useLastInputMode_0 = v13.useLastInputMode;
local v29 = require(l_script_FirstAncestor_0.Flags.FFlagProfileQRCodeFixFocusNavigation);
local function _(v30) --[[ Line: 42 ]] --[[ Name: getTooltipWasShown ]]
    -- upvalues: l_AppStorageService_0 (copy)
    v30 = v30 or l_AppStorageService_0;
    assert(v30 ~= nil, "AppStorageService is not nil");
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 46 ]]
        -- upvalues: v30 (ref)
        return v30:GetItem("QrCodeScannerTooltipSeen");
    end);
    if not l_status_0 or l_result_0 == nil then
        return false;
    else
        return l_result_0 == "true";
    end;
end;
local function _(v34, v35) --[[ Line: 57 ]] --[[ Name: setTooltipWasShown ]]
    -- upvalues: l_AppStorageService_0 (copy)
    v34 = v34 or l_AppStorageService_0;
    assert(v34 ~= nil, "AppStorageService is not nil");
    pcall(function() --[[ Line: 61 ]]
        -- upvalues: v34 (ref), v35 (copy)
        v34:SetItem("QrCodeScannerTooltipSeen", (tostring(v35)));
        v34:Flush();
    end);
end;
return function(v37) --[[ Line: 75 ]]
    -- upvalues: v29 (copy), l_useLastInputMode_0 (copy), v25 (copy), l_useLocalization_0 (copy), v24 (copy), l_useAppPolicy_0 (copy), v7 (copy), l_AppStorageService_0 (copy), v23 (copy), l_InputUtilities_0 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), l_withTooltip_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), l_makeBackButton_0 (copy), l_HeaderBar_0 (copy)
    local v38 = if v29 then l_useLastInputMode_0() == "Focus" else nil;
    local v39 = v25();
    local v40 = l_useLocalization_0({
        title = v24.Title, 
        tooltipBodyText = v24.TooltipText, 
        tooltipHeaderText = v24.TooltipTitle
    });
    local v42 = l_useAppPolicy_0(function(v41) --[[ Line: 84 ]]
        return v41.getFriendCodeQrCodeScannerEnabled();
    end);
    local v43, v44 = v7.useState(false);
    v7.useEffect(function() --[[ Line: 89 ]]
        -- upvalues: v37 (copy), l_AppStorageService_0 (ref), v44 (copy), v39 (copy), v23 (ref)
        local v45 = v37.appStorageService or l_AppStorageService_0;
        assert(v45 ~= nil, "AppStorageService is not nil");
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 46 ]]
            -- upvalues: v45 (ref)
            return v45:GetItem("QrCodeScannerTooltipSeen");
        end);
        local v48;
        if not l_status_1 or l_result_1 == nil then
            v48 = false;
            --[[ close >= 1 ]]
        else
            v48 = l_result_1 == "true";
            --[[ close >= 1 ]]
        end;
        v44(not v48);
        if not v48 then
            v39.fireEvent(v23.QRCodeScannerTooltipShown);
        end;
    end, {});
    local v54 = v7.useCallback(function(v49) --[[ Line: 97 ]]
        -- upvalues: l_InputUtilities_0 (ref), v43 (copy), v44 (copy), v37 (copy), l_AppStorageService_0 (ref)
        if l_InputUtilities_0.isActivationInput(v49) and v43 then
            v44(false);
            local v50 = v37.appStorageService or l_AppStorageService_0;
            assert(v50 ~= nil, "AppStorageService is not nil");
            local l_pcall_0 = pcall;
            local v52 = true;
            do
                local l_v50_0 = v50;
                l_pcall_0(function() --[[ Line: 61 ]]
                    -- upvalues: l_v50_0 (ref), v52 (copy)
                    l_v50_0:SetItem("QrCodeScannerTooltipSeen", (tostring(v52)));
                    l_v50_0:Flush();
                end);
            end;
        end;
    end, {
        v43
    });
    local v55 = v7.useCallback(function() --[[ Line: 106 ]]
        -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v39 (copy), v23 (ref), v37 (copy)
        l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.ProfileQRCodeScannerLayer);
        v39.fireEvent(v23.QRCodeScannerOpened);
        v37.openQrCodeScanner();
    end, {
        v37.openQrCodeScanner
    });
    local l_tooltipBodyText_0 = v40.tooltipBodyText;
    local l_tooltipHeaderText_0 = v40.tooltipHeaderText;
    local v61 = v7.useCallback(function() --[[ Line: 115 ]]
        -- upvalues: l_tooltipBodyText_0 (copy), l_tooltipHeaderText_0 (copy), v43 (copy), l_CoreGui_0 (ref), l_TooltipOrientation_0 (ref), l_withTooltip_0 (ref), v7 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_IconSize_0 (ref), v55 (copy), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref), v54 (copy)
        local v58 = {
            bodyText = l_tooltipBodyText_0, 
            headerText = l_tooltipHeaderText_0
        };
        local v59 = {
            active = v43, 
            DisplayOrder = 10, 
            guiTarget = l_CoreGui_0, 
            preferredOrientation = l_TooltipOrientation_0.Bottom
        };
        return l_withTooltip_0(v58, v59, function(v60) --[[ Line: 128 ]]
            -- upvalues: v7 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_IconSize_0 (ref), v55 (ref), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref), v54 (ref)
            return v7.createElement(l_IconButton_0, {
                icon = l_Images_0["icons/actions/scan"], 
                iconSize = l_IconSize_0.Medium, 
                onActivated = v55, 
                size = UDim2.fromOffset(0, 0), 
                onAbsolutePositionChanged = v60, 
                [v7.Change.AbsoluteSize] = v60
            }, {
                InputBeganConnection = v7.createElement(l_ExternalEventConnection_0, {
                    event = l_UserInputService_0.InputBegan, 
                    callback = v54
                })
            });
        end);
    end, {
        v55, 
        v42, 
        v43, 
        l_tooltipBodyText_0, 
        l_tooltipHeaderText_0
    });
    local v62 = l_makeBackButton_0(v37.onClose);
    return v7.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 56), 
        LayoutOrder = v37.layoutOrder, 
        ZIndex = 2
    }, {
        headerBar = v7.createElement(l_HeaderBar_0, {
            isSecondary = true, 
            title = v40.title, 
            backgroundTransparency = 1, 
            barHeight = 56, 
            renderLeft = if (not v29 or v38) and v29 then nil else v62, 
            renderRight = if v42 then v61 else nil
        })
    });
end;