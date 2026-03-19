local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_clearInterval_0 = v4.clearInterval;
local l_setInterval_0 = v4.setInterval;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_PartialPageModal_0 = v7.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local l_useStyle_0 = v7.Core.Style.useStyle;
local v12 = require(l_Modules_0.LuaApp.Thunks.Moderation.ApiFetchAccessStatus);
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v16 = require(l_Modules_0.LuaApp.Constants);
local v17 = require(l_Modules_0.LuaApp.getScreenBottomInset);
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local v19 = require(script.Parent.ScreentimeRestrictionOptionsModal);
local v20 = require(script.Parent.ScreentimeRestrictionErrorModal);
local v21 = require(script.Parent.ScreentimeRestrictionLoadingSpinner);
local v22 = require(l_Modules_0.LuaApp.Http.Requests.AddTemporaryScreentime);
local v23 = game:DefineFastInt("ParentalControlsScreentimeLockoutPollIntervalMs", 15000);
local l_FFlagEnableScreentimeMoreTimeOption_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableScreentimeMoreTimeOption;
local v25 = require(l_Modules_0.LuaApp.Components.Screentime.Flags.FFlagEnableScreentimeUnlockLoadingSpinner);
local function v31(v26, v27, v28) --[[ Line: 48 ]] --[[ Name: getAddMoreTimeButtonStackProps ]]
    -- upvalues: l_ButtonType_0 (copy)
    local v29 = {
        {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                isDisabled = false, 
                onActivated = function() --[[ Line: 54 ]] --[[ Name: onActivated ]]
                    -- upvalues: v28 (copy)
                    v28();
                end, 
                text = v26
            }
        }
    };
    local v30 = {
        buttonHeight = 48, 
        forcedFillDirection = Enum.FillDirection.Vertical, 
        buttons = v29
    };
    if v27 then
        return v30;
    else
        return nil;
    end;
end;
local v32 = nil;
v32 = l_FFlagEnableScreentimeMoreTimeOption_0 and function(v33) --[[ Line: 78 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useStyle_0 (copy), v17 (copy), l_FFlagEnableScreentimeMoreTimeOption_0 (copy), l_useAppPolicy_0 (copy), v2 (copy), v23 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_InteractiveAlert_0 (copy), v31 (copy), v25 (copy), v21 (copy), v19 (copy), v22 (copy), v20 (copy), v16 (copy)
    local v34 = l_useLocalization_0({
        CloseText = "CommonUI.Controls.Action.CloseRoblox", 
        TitleText = "Feature.Screentime.Heading.ScreentimeLimitDialog", 
        BodyText = "Feature.Screentime.Content.ScreentimeLimitDialog", 
        AddMoreTimeText = "Feature.Screentime.Label.Options"
    });
    local l_screenSize_0 = v33.screenSize;
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_globalGuiInset_0 = v33.globalGuiInset;
    local v38 = v17();
    local v39 = UDim2.fromOffset(0, l_globalGuiInset_0.top);
    local v40 = UDim2.fromOffset(l_screenSize_0.X, l_screenSize_0.Y - l_globalGuiInset_0.top - v38);
    local v41 = false;
    if l_FFlagEnableScreentimeMoreTimeOption_0 then
        v41 = l_useAppPolicy_0(function(v42) --[[ Line: 95 ]]
            return v42.getScreentimeMoreTimeOptionEnabled();
        end);
    end;
    local v43 = {
        RestrictionModal = 1, 
        AddTimeModal = 2, 
        RetryModal = 3, 
        ErrorModal = 4, 
        UnlockedAndWaiting = 5
    };
    local v44, v45 = v2.useState(v43.RestrictionModal);
    local v46, v47 = v2.useState(0);
    v2.useEffect(function() --[[ Line: 111 ]]
        -- upvalues: v23 (ref), l_setInterval_0 (ref), v33 (copy), l_clearInterval_0 (ref)
        local v48 = l_setInterval_0(function() --[[ Line: 113 ]]
            -- upvalues: v33 (ref)
            v33.fetchUserAccess(v33.networking);
        end, v23);
        return function() --[[ Line: 117 ]]
            -- upvalues: v48 (copy), l_clearInterval_0 (ref)
            if v48 then
                l_clearInterval_0(v48);
            end;
        end;
    end, {});
    local v50 = v2.createElement(l_InteractiveAlert_0, {
        anchorPoint = Vector2.new(0.5, 0.5), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        screenSize = l_screenSize_0, 
        title = v34.TitleText, 
        bodyText = v34.BodyText, 
        buttonStackInfo = v31(v34.AddMoreTimeText, v41, function(_) --[[ Line: 133 ]]
            -- upvalues: v45 (copy), v43 (copy)
            v45(v43.AddTimeModal);
        end)
    });
    if v33.userAccess ~= nil then
        if v44 == v43.UnlockedAndWaiting then
            if v25 then
                return v2.createElement(v21, {
                    screenSize = l_screenSize_0, 
                    globalGuiInset = l_globalGuiInset_0
                });
            else
                return nil;
            end;
        elseif v44 == v43.AddTimeModal then
            return v2.createElement(v19, {
                screenSize = l_screenSize_0, 
                globalGuiInset = l_globalGuiInset_0, 
                onClose = function() --[[ Line: 155 ]] --[[ Name: onClose ]]
                    -- upvalues: v45 (copy), v43 (copy)
                    v45(v43.RestrictionModal);
                end, 
                onAddTime = function(v51) --[[ Line: 158 ]] --[[ Name: onAddTime ]]
                    -- upvalues: v22 (ref), v33 (copy), v45 (copy), v43 (copy), v47 (copy)
                    v22(v33.networking, v51):andThen(function() --[[ Line: 159 ]]
                        -- upvalues: v45 (ref), v43 (ref)
                        v45(v43.UnlockedAndWaiting);
                    end):catch(function() --[[ Line: 161 ]]
                        -- upvalues: v47 (ref), v51 (copy), v45 (ref), v43 (ref)
                        v47(v51);
                        v45(v43.RetryModal);
                    end);
                end
            });
        elseif v44 == v43.RetryModal then
            return v2.createElement(v20, {
                screenSize = l_screenSize_0, 
                globalGuiInset = l_globalGuiInset_0, 
                onClose = function() --[[ Line: 172 ]] --[[ Name: onClose ]]
                    -- upvalues: v45 (copy), v43 (copy)
                    v45(v43.RestrictionModal);
                end, 
                onRetry = function() --[[ Line: 175 ]] --[[ Name: onRetry ]]
                    -- upvalues: v22 (ref), v33 (copy), v46 (copy), v45 (copy), v43 (copy)
                    v22(v33.networking, v46):andThen(function() --[[ Line: 176 ]]
                        -- upvalues: v45 (ref), v43 (ref)
                        v45(v43.UnlockedAndWaiting);
                    end):catch(function() --[[ Line: 178 ]]
                        -- upvalues: v45 (ref), v43 (ref)
                        v45(v43.ErrorModal);
                    end);
                end
            });
        elseif v44 == v43.ErrorModal then
            return v2.createElement(v20, {
                screenSize = l_screenSize_0, 
                globalGuiInset = l_globalGuiInset_0, 
                onClose = function() --[[ Line: 188 ]] --[[ Name: onClose ]]
                    -- upvalues: v45 (copy), v43 (copy)
                    v45(v43.RestrictionModal);
                end
            });
        else
            return v2.createElement("ScreenGui", {
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = v16.DisplayOrder.AntiAddictionPrompt, 
                IgnoreGuiInset = true
            }, {
                OverlayFrame = v2.createElement("ImageButton", {
                    AutoButtonColor = false, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    ImageTransparency = 1, 
                    BackgroundColor3 = l_Theme_0.Overlay.Color, 
                    BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
                    BorderSizePixel = 0, 
                    Selectable = false
                }, {
                    Overlay = v2.createElement("Frame", {
                        Position = v39, 
                        Size = v40, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        Content = v50
                    })
                })
            });
        end;
    else
        return nil;
    end;
end or function(v52) --[[ Line: 225 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useStyle_0 (copy), v17 (copy), v2 (copy), v23 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_PartialPageModal_0 (copy), v16 (copy)
    local v53 = l_useLocalization_0({
        CloseText = "CommonUI.Controls.Action.CloseRoblox", 
        TitleText = "Feature.Screentime.Heading.ScreentimeLimitDialog", 
        BodyText = "Feature.Screentime.Content.ScreentimeLimitDialog"
    });
    local l_screenSize_1 = v52.screenSize;
    local v55 = l_useStyle_0();
    local l_Theme_1 = v55.Theme;
    local l_Font_0 = v55.Font;
    local l_globalGuiInset_1 = v52.globalGuiInset;
    local v59 = v17();
    local v60 = UDim2.fromOffset(0, l_globalGuiInset_1.top);
    local v61 = UDim2.fromOffset(l_screenSize_1.X, l_screenSize_1.Y - l_globalGuiInset_1.top - v59);
    v2.useEffect(function() --[[ Line: 243 ]]
        -- upvalues: v23 (ref), l_setInterval_0 (ref), v52 (copy), l_clearInterval_0 (ref)
        local v62 = l_setInterval_0(function() --[[ Line: 245 ]]
            -- upvalues: v52 (ref)
            v52.fetchUserAccess(v52.networking);
        end, v23);
        return function() --[[ Line: 249 ]]
            -- upvalues: v62 (copy), l_clearInterval_0 (ref)
            if v62 then
                l_clearInterval_0(v62);
            end;
        end;
    end, {});
    local v63 = v2.createElement(l_PartialPageModal_0, {
        title = v53.TitleText, 
        screenSize = l_screenSize_1
    }, {
        Body = v2.createElement("Frame", {
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 60), 
            BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color, 
            LayoutOrder = 1
        }, {
            CustomInner = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = v53.BodyText, 
                TextColor3 = l_Theme_1.TextDefault.Color, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextScaled = true, 
                Font = l_Font_0.Body.Font, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                    MaxTextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize
                })
            })
        })
    });
    if v52.userAccess ~= nil then
        return v2.createElement("ScreenGui", {
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            DisplayOrder = v16.DisplayOrder.AntiAddictionPrompt, 
            IgnoreGuiInset = true
        }, {
            OverlayFrame = v2.createElement("ImageButton", {
                AutoButtonColor = false, 
                Size = UDim2.new(1, 0, 1, 0), 
                ImageTransparency = 1, 
                BackgroundColor3 = l_Theme_1.Overlay.Color, 
                BackgroundTransparency = l_Theme_1.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Selectable = false
            }, {
                Overlay = v2.createElement("Frame", {
                    Position = v60, 
                    Size = v61, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Content = v63
                })
            })
        });
    else
        return nil;
    end;
end;
v32 = v3.connect(function(v64, _) --[[ Line: 314 ]]
    return {
        userAccess = v64.UserAccess, 
        restrictionDetail = v64.UserAccess and v64.UserAccess.restrictionDetail or nil
    };
end, function(v66) --[[ Line: 319 ]]
    -- upvalues: v12 (copy)
    return {
        fetchUserAccess = function(v67) --[[ Line: 321 ]] --[[ Name: fetchUserAccess ]]
            -- upvalues: v66 (copy), v12 (ref)
            v66(v12(v67));
        end
    };
end)(v32);
return (l_RoactServices_0.connect({
    networking = v13
})(v32));