local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_Parent_0.HttpRequest);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_script_FirstAncestor_0.Common.FullPageModalWrapper);
local v10 = require(l_script_FirstAncestor_0.Common.Lock);
local v11 = require(l_script_FirstAncestor_0.Common.ModalTextComponent);
local v12 = require(l_script_FirstAncestor_0.Common.ModalErrorText);
local v13 = require(l_script_FirstAncestor_0.Common.ModalButtonConfig);
local v14 = require(l_script_FirstAncestor_0.Common.ModalFooter);
local v15 = require(l_script_FirstAncestor_0.Thunks.FinishDialog);
local v16 = require(l_script_FirstAncestor_0.Enum.ModalState);
local v17 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogAction);
local v18 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogError);
local v19 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogType);
local v20 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogState);
local l_getFormattedDeviceType_0 = require(l_script_FirstAncestor_0.Common.Utils).getFormattedDeviceType;
local l_getFormattedRegionalLocation_0 = require(l_script_FirstAncestor_0.Common.Utils).getFormattedRegionalLocation;
local l_getFormattedIPAddress_0 = require(l_script_FirstAncestor_0.Common.Utils).getFormattedIPAddress;
local l_getFormattedDateTime_0 = require(l_script_FirstAncestor_0.Common.Utils).getFormattedDateTime;
local v25 = require(l_script_FirstAncestor_0.Analytics.EventService);
local v26 = require(l_script_FirstAncestor_0.Analytics.MetricsService);
local v27 = require(l_script_FirstAncestor_0.Common.ModalTextSizes);
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local l_DEFAULT_PADDING_0 = require(l_script_FirstAncestor_0.Common.Constants).DEFAULT_PADDING;
local l_X_BUTTON_SIZE_0 = require(l_script_FirstAncestor_0.Common.Constants).X_BUTTON_SIZE;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useStyle_0 = v3.Core.Style.useStyle;
local _ = {
    "Authentication.TwoStepVerification.CrossDevice.Authentication", 
    "Authentication.TwoStepVerification.CrossDevice.BirthdateChange", 
    "Authentication.TwoStepVerification.CrossDevice.Deactivation", 
    "Authentication.TwoStepVerification.CrossDevice.LimitedResale", 
    "Authentication.TwoStepVerification.CrossDevice.PrivacyChange", 
    "Authentication.TwoStepVerification.CrossDevice.Reactivation", 
    "Authentication.TwoStepVerification.CrossDevice.RecoveryCodes", 
    "Authentication.TwoStepVerification.CrossDevice.Resale", 
    "Authentication.TwoStepVerification.CrossDevice.Spend", 
    "Authentication.TwoStepVerification.CrossDevice.Trade"
};
local function v40(v34, v35, v36, v37, v38) --[[ Line: 55 ]]
    -- upvalues: v19 (copy)
    local v39 = "Authentication.TwoStepVerification.Description.LoginToNewDevice";
    if v37 == v19.toRawValue(v19.DIALOG_TYPE_APPROVAL_2SV_GENERIC) then
        v39 = (not (v38 ~= nil) or v38 == "") and "Authentication.TwoStepVerification.Description.PostLoginActionConfirmation" or v38;
    end;
    return {
        approve = "Authentication.TwoStepVerification.Action.Approve", 
        deny = "Authentication.TwoStepVerification.Action.Deny", 
        description = v39, 
        deviceTypeLabel = "Authentication.TwoStepVerification.Label.DeviceTypeLabel", 
        locationLabel = "Authentication.TwoStepVerification.Label.LocationLabel", 
        ipAddressLabel = "Authentication.TwoStepVerification.Label.IPAddressLabel", 
        dateTimeLabel = "Authentication.TwoStepVerification.Label.DateTimeLabel", 
        unknownDeviceType = "Authentication.TwoStepVerification.Label.UnknownDevice", 
        unknownLocation = "Authentication.TwoStepVerification.Label.UnknownLocation", 
        unknownIPAddress = "Authentication.TwoStepVerification.Label.UnknownIPAddress", 
        location = {
            "Authentication.TwoStepVerification.Label.Location"; 
            city = v34, 
            subdivision = v35, 
            country = v36
        }, 
        locationWithoutCity = {
            "Authentication.TwoStepVerification.Label.LocationWithoutCity"; 
            subdivision = v35, 
            country = v36
        }, 
        locationWithoutSubdivision = {
            "Authentication.TwoStepVerification.Label.LocationWithoutSubdivision"; 
            city = v34, 
            country = v36
        }, 
        locationWithoutCountry = {
            "Authentication.TwoStepVerification.Label.LocationWithoutCountry"; 
            city = v34, 
            subdivision = v35
        }, 
        errorMessage = "Authentication.TwoStepVerification.Response.DefaultError", 
        helpMessage = "Authentication.TwoStepVerification.Label.NeedHelpMessage"
    };
end;
local v41 = v5.config({
    requestFunction = v5.requestFunctions.RequestInternal, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("ModalChallengeDialogApprovalHttpRetryCount", 4) else nil
});
return v4.connect(function(_, _) --[[ Line: 391 ]]
    return {};
end, function(v44) --[[ Line: 393 ]]
    -- upvalues: l_NavigateDown_0 (copy), v15 (copy)
    return {
        navigateToPage = function(v45) --[[ Line: 395 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v44 (copy), l_NavigateDown_0 (ref)
            return v44(l_NavigateDown_0(v45));
        end, 
        finishDialog = function(v46, v47, v48) --[[ Line: 398 ]] --[[ Name: finishDialog ]]
            -- upvalues: v44 (copy), v15 (ref)
            return v44(v15(v46, v47, v48));
        end
    };
end)(function(v49) --[[ Line: 115 ]]
    -- upvalues: v2 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v40 (copy), v26 (copy), v41 (copy), v18 (copy), v16 (copy), v25 (copy), v20 (copy), v17 (copy), l_DEFAULT_PADDING_0 (copy), v11 (copy), v27 (copy), v9 (copy), l_X_BUTTON_SIZE_0 (copy), v10 (copy), l_getFormattedDeviceType_0 (copy), l_getFormattedRegionalLocation_0 (copy), l_getFormattedIPAddress_0 (copy), l_getFormattedDateTime_0 (copy), v13 (copy), l_ButtonType_0 (copy), v14 (copy), v12 (copy), l_AppPage_0 (copy)
    local v50, v51 = v2.useState(false);
    local v52, v53 = v2.useState(false);
    local v54, v55 = v2.useState(Vector2.new(0, 0));
    local v56, v57 = v2.useState(Vector2.new(0, 0));
    local v58, v59 = v2.useState(nil);
    local l_Theme_0 = l_useStyle_0().Theme;
    local v61 = l_useLocalization_0((v40(v49.dialogItem.origin.city, v49.dialogItem.origin.subdivision, v49.dialogItem.origin.country, v49.dialogItem.type, v49.dialogItem.challengeActionTypeTranslationKey)));
    local function v63(v62) --[[ Line: 133 ]]
        -- upvalues: v54 (copy), v55 (copy)
        if v54 ~= v62.AbsoluteSize then
            v55(v62.AbsoluteSize);
        end;
    end;
    local function v65(v64) --[[ Line: 138 ]]
        -- upvalues: v56 (copy), v57 (copy)
        if v56 ~= v64.AbsoluteSize then
            v57(v64.AbsoluteSize);
        end;
    end;
    local function v67(v66) --[[ Line: 143 ]]
        -- upvalues: v26 (ref)
        if v66.CanvasSize.Y.Offset > v66.AbsoluteSize.Y then
            v26.loginInfoOverflowed();
        end;
    end;
    local function v74(v68, v69, v70, v71) --[[ Line: 149 ]]
        -- upvalues: v49 (copy), v41 (ref), v18 (ref), v16 (ref)
        v49.finishDialog(v41, v68, v69):andThen(function(_) --[[ Line: 152 ]]
            -- upvalues: v70 (copy)
            v70();
        end):catch(function(v73) --[[ Line: 155 ]]
            -- upvalues: v18 (ref), v49 (ref), v16 (ref), v71 (copy)
            if v73 == v18.InconsistentStateTransition then
                v49.navigateToModalState({
                    modalState = v16.ChallengeDialogAlreadyCompleted
                });
                return;
            else
                v71(v73);
                return;
            end;
        end):await();
    end;
    local function v78() --[[ Line: 167 ]]
        -- upvalues: v59 (copy), v51 (copy), v25 (ref), v49 (copy), v20 (ref), v74 (copy), v17 (ref)
        v59(nil);
        v51(true);
        local function v75() --[[ Line: 170 ]]
            -- upvalues: v25 (ref), v49 (ref), v20 (ref), v51 (ref)
            v25.sendDialogActionSelectedEvent(v49.dialogItem.type, v49.dialogItem.typeInternalId, v20.toRawValue(v20.DIALOG_STATE_APPROVED));
            v51(false);
            v49.closeModal();
        end;
        local function v77(v76) --[[ Line: 179 ]]
            -- upvalues: v51 (ref), v59 (ref)
            v51(false);
            v59(v76);
        end;
        v74({
            type = v49.dialogItem.type, 
            typeInternalId = v49.dialogItem.typeInternalId
        }, v17.Approve, v75, v77);
    end;
    local function v82() --[[ Line: 189 ]]
        -- upvalues: v59 (copy), v53 (copy), v25 (ref), v49 (copy), v20 (ref), v16 (ref), v74 (copy), v17 (ref)
        v59(nil);
        v53(true);
        local function v79() --[[ Line: 192 ]]
            -- upvalues: v25 (ref), v49 (ref), v20 (ref), v53 (ref), v16 (ref)
            v25.sendDialogActionSelectedEvent(v49.dialogItem.type, v49.dialogItem.typeInternalId, v20.toRawValue(v20.DIALOG_STATE_DENIED));
            v53(false);
            v49.navigateToModalState({
                modalState = v16.ChallengeDialogDenied
            });
        end;
        local function v81(v80) --[[ Line: 201 ]]
            -- upvalues: v53 (ref), v59 (ref)
            v53(false);
            v59(v80);
        end;
        v74({
            type = v49.dialogItem.type, 
            typeInternalId = v49.dialogItem.typeInternalId
        }, v17.Deny, v79, v81);
    end;
    local function v86() --[[ Line: 211 ]]
        -- upvalues: v25 (ref), v49 (copy), v74 (copy), v17 (ref)
        local function v83() --[[ Line: 212 ]]
            -- upvalues: v25 (ref), v49 (ref)
            v25.sendDialogAbandonedEvent(v49.dialogItem.type, v49.dialogItem.typeInternalId);
            v49.closeModal();
        end;
        local function v85(_) --[[ Line: 216 ]]
            -- upvalues: v49 (ref)
            v49.closeModal();
        end;
        v74({
            type = v49.dialogItem.type, 
            typeInternalId = v49.dialogItem.typeInternalId
        }, v17.Deny, v83, v85);
    end;
    local function v91(v87, v88, v89, v90) --[[ Line: 225 ]]
        -- upvalues: v2 (ref), l_DEFAULT_PADDING_0 (ref), v11 (ref), v27 (ref)
        return v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            LayoutOrder = v90
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, l_DEFAULT_PADDING_0 / 4), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Label = v2.createElement(v11, {
                layoutOrder = 1, 
                contentWidth = v89, 
                size = v27.Footer, 
                text = v87
            }), 
            Info = v2.createElement(v11, {
                layoutOrder = 2, 
                contentWidth = v89, 
                useEmphasis = true, 
                text = v88
            })
        });
    end;
    return v2.createElement(v9, {
        title = "", 
        closeModal = v86, 
        makeBodyFragment = function(v92) --[[ Line: 260 ]] --[[ Name: makeBodyFragment ]]
            -- upvalues: v2 (ref), v63 (copy), l_DEFAULT_PADDING_0 (ref), v11 (ref), l_X_BUTTON_SIZE_0 (ref), v27 (ref), v61 (copy), v10 (ref), v54 (copy), v56 (copy), l_Theme_0 (copy), v67 (copy), v65 (copy), v91 (copy), l_getFormattedDeviceType_0 (ref), v49 (copy), l_getFormattedRegionalLocation_0 (ref), l_getFormattedIPAddress_0 (ref), l_getFormattedDateTime_0 (ref)
            return v2.createElement(v2.Fragment, nil, {
                Description = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.fromScale(1, 0), 
                    LayoutOrder = 1, 
                    [v2.Change.AbsoluteSize] = v63
                }, {
                    ListLayout = v2.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, l_DEFAULT_PADDING_0), 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    ModalBodyText = v2.createElement(v11, {
                        layoutOrder = 1, 
                        contentWidth = v92 - 2 * l_X_BUTTON_SIZE_0, 
                        useBold = true, 
                        useEmphasis = true, 
                        size = v27.Header1, 
                        text = v61.description
                    }), 
                    Lock = v2.createElement(v10, {
                        layoutOrder = 2
                    })
                }), 
                LoginAttemptInfoScrollable = v2.createElement("ScrollingFrame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, -v54.Y - l_DEFAULT_PADDING_0), 
                    CanvasSize = UDim2.new(1, 0, 0, v56.Y), 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
                    LayoutOrder = 2, 
                    [v2.Change.CanvasSize] = v67
                }, {
                    LoginAttemptInfoCanvas = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.fromScale(1, 0), 
                        [v2.Change.AbsoluteSize] = v65
                    }, {
                        ListLayout = v2.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            Padding = UDim.new(0, l_DEFAULT_PADDING_0 / 2), 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        ContentPadding = v2.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, l_DEFAULT_PADDING_0 / 2)
                        }), 
                        DeviceType = v91(v61.deviceTypeLabel, l_getFormattedDeviceType_0(v49.dialogItem.origin.deviceType, v49.dialogItem.origin.deviceOs, v61), v92, 1), 
                        RegionalLocation = v91(v61.locationLabel, l_getFormattedRegionalLocation_0(v49.dialogItem.origin.city, v49.dialogItem.origin.subdivision, v49.dialogItem.origin.country, v61), v92, 2), 
                        IPAddress = v91(v61.ipAddressLabel, l_getFormattedIPAddress_0(v49.dialogItem.origin.ipAddress, v61), v92, 3), 
                        DateTimeInfo = v91(v61.dateTimeLabel, l_getFormattedDateTime_0(v49.dialogItem.origin.timestamp, v61), v92, 4)
                    })
                })
            });
        end, 
        buttonConfig = v13({
            {
                isDisabled = v50 or v52, 
                isLoading = v50, 
                onActivated = v78, 
                text = v61.approve, 
                type = l_ButtonType_0.Secondary
            }, 
            {
                isDisabled = v52 or v50, 
                isLoading = v52, 
                onActivated = v82, 
                text = v61.deny, 
                type = l_ButtonType_0.Secondary
            }
        }), 
        footerContent = v14(function(v93) --[[ Line: 363 ]]
            -- upvalues: v2 (ref), v58 (copy), v12 (ref), v61 (copy), v11 (ref), v27 (ref), v49 (copy), l_AppPage_0 (ref)
            return v2.createElement(v2.Fragment, nil, {
                ErrorMessage = v58 and v2.createElement(v12, {
                    errorText = v61.errorMessage, 
                    contentWidth = v93, 
                    layoutOrder = 1
                }), 
                SupportLink = v2.createElement(v11, {
                    BackgroundTransparency = 0, 
                    layoutOrder = 2, 
                    text = v61.helpMessage, 
                    contentWidth = v93, 
                    size = v27.Footer, 
                    onActivated = function() --[[ Line: 376 ]] --[[ Name: onActivated ]]
                        -- upvalues: v49 (ref), l_AppPage_0 (ref)
                        v49.navigateToPage({
                            name = l_AppPage_0.GenericWebPage, 
                            detail = "https://en.help.roblox.com/hc/en-us/articles/212459863-Add-2-Step-Verification-to-Your-Account", 
                            extraProps = {
                                title = ""
                            }
                        });
                    end
                })
            });
        end)
    });
end);