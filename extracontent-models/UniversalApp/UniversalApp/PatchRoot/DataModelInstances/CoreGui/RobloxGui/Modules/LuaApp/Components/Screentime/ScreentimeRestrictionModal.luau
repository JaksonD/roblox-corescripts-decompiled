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
local function v30(v25, v26, v27) --[[ Line: 46 ]] --[[ Name: getAddMoreTimeButtonStackProps ]]
    -- upvalues: l_ButtonType_0 (copy)
    local v28 = {
        {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                isDisabled = false, 
                onActivated = function() --[[ Line: 52 ]] --[[ Name: onActivated ]]
                    -- upvalues: v27 (copy)
                    v27();
                end, 
                text = v25
            }
        }
    };
    local v29 = {
        buttonHeight = 48, 
        forcedFillDirection = Enum.FillDirection.Vertical, 
        buttons = v28
    };
    if v26 then
        return v29;
    else
        return nil;
    end;
end;
local v31 = nil;
v31 = l_FFlagEnableScreentimeMoreTimeOption_0 and function(v32) --[[ Line: 76 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useStyle_0 (copy), v17 (copy), l_FFlagEnableScreentimeMoreTimeOption_0 (copy), l_useAppPolicy_0 (copy), v2 (copy), v23 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_InteractiveAlert_0 (copy), v30 (copy), v21 (copy), v19 (copy), v22 (copy), v20 (copy), v16 (copy)
    local v33 = l_useLocalization_0({
        CloseText = "CommonUI.Controls.Action.CloseRoblox", 
        TitleText = "Feature.Screentime.Heading.ScreentimeLimitDialog", 
        BodyText = "Feature.Screentime.Content.ScreentimeLimitDialog", 
        AddMoreTimeText = "Feature.Screentime.Label.Options"
    });
    local l_screenSize_0 = v32.screenSize;
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_globalGuiInset_0 = v32.globalGuiInset;
    local v37 = v17();
    local v38 = UDim2.fromOffset(0, l_globalGuiInset_0.top);
    local v39 = UDim2.fromOffset(l_screenSize_0.X, l_screenSize_0.Y - l_globalGuiInset_0.top - v37);
    local v40 = false;
    if l_FFlagEnableScreentimeMoreTimeOption_0 then
        v40 = l_useAppPolicy_0(function(v41) --[[ Line: 93 ]]
            return v41.getScreentimeMoreTimeOptionEnabled();
        end);
    end;
    local v42 = {
        RestrictionModal = 1, 
        AddTimeModal = 2, 
        RetryModal = 3, 
        ErrorModal = 4, 
        UnlockedAndWaiting = 5
    };
    local v43, v44 = v2.useState(v42.RestrictionModal);
    local v45, v46 = v2.useState(0);
    v2.useEffect(function() --[[ Line: 109 ]]
        -- upvalues: v23 (ref), l_setInterval_0 (ref), v32 (copy), l_clearInterval_0 (ref)
        local v47 = l_setInterval_0(function() --[[ Line: 111 ]]
            -- upvalues: v32 (ref)
            v32.fetchUserAccess(v32.networking);
        end, v23);
        return function() --[[ Line: 115 ]]
            -- upvalues: v47 (copy), l_clearInterval_0 (ref)
            if v47 then
                l_clearInterval_0(v47);
            end;
        end;
    end, {});
    local v49 = v2.createElement(l_InteractiveAlert_0, {
        anchorPoint = Vector2.new(0.5, 0.5), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        screenSize = l_screenSize_0, 
        title = v33.TitleText, 
        bodyText = v33.BodyText, 
        buttonStackInfo = v30(v33.AddMoreTimeText, v40, function(_) --[[ Line: 131 ]]
            -- upvalues: v44 (copy), v42 (copy)
            v44(v42.AddTimeModal);
        end)
    });
    if v32.userAccess ~= nil then
        if v43 == v42.UnlockedAndWaiting then
            return v2.createElement(v21, {
                screenSize = l_screenSize_0, 
                globalGuiInset = l_globalGuiInset_0
            });
        elseif v43 == v42.AddTimeModal then
            return v2.createElement(v19, {
                screenSize = l_screenSize_0, 
                globalGuiInset = l_globalGuiInset_0, 
                onClose = function() --[[ Line: 148 ]] --[[ Name: onClose ]]
                    -- upvalues: v44 (copy), v42 (copy)
                    v44(v42.RestrictionModal);
                end, 
                onAddTime = function(v50) --[[ Line: 151 ]] --[[ Name: onAddTime ]]
                    -- upvalues: v22 (ref), v32 (copy), v44 (copy), v42 (copy), v46 (copy)
                    v22(v32.networking, v50):andThen(function() --[[ Line: 152 ]]
                        -- upvalues: v44 (ref), v42 (ref)
                        v44(v42.UnlockedAndWaiting);
                    end):catch(function() --[[ Line: 154 ]]
                        -- upvalues: v46 (ref), v50 (copy), v44 (ref), v42 (ref)
                        v46(v50);
                        v44(v42.RetryModal);
                    end);
                end
            });
        elseif v43 == v42.RetryModal then
            return v2.createElement(v20, {
                screenSize = l_screenSize_0, 
                globalGuiInset = l_globalGuiInset_0, 
                onClose = function() --[[ Line: 165 ]] --[[ Name: onClose ]]
                    -- upvalues: v44 (copy), v42 (copy)
                    v44(v42.RestrictionModal);
                end, 
                onRetry = function() --[[ Line: 168 ]] --[[ Name: onRetry ]]
                    -- upvalues: v22 (ref), v32 (copy), v45 (copy), v44 (copy), v42 (copy)
                    v22(v32.networking, v45):andThen(function() --[[ Line: 169 ]]
                        -- upvalues: v44 (ref), v42 (ref)
                        v44(v42.UnlockedAndWaiting);
                    end):catch(function() --[[ Line: 171 ]]
                        -- upvalues: v44 (ref), v42 (ref)
                        v44(v42.ErrorModal);
                    end);
                end
            });
        elseif v43 == v42.ErrorModal then
            return v2.createElement(v20, {
                screenSize = l_screenSize_0, 
                globalGuiInset = l_globalGuiInset_0, 
                onClose = function() --[[ Line: 181 ]] --[[ Name: onClose ]]
                    -- upvalues: v44 (copy), v42 (copy)
                    v44(v42.RestrictionModal);
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
                        Position = v38, 
                        Size = v39, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        Content = v49
                    })
                })
            });
        end;
    else
        return nil;
    end;
end or function(v51) --[[ Line: 218 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useStyle_0 (copy), v17 (copy), v2 (copy), v23 (copy), l_setInterval_0 (copy), l_clearInterval_0 (copy), l_PartialPageModal_0 (copy), v16 (copy)
    local v52 = l_useLocalization_0({
        CloseText = "CommonUI.Controls.Action.CloseRoblox", 
        TitleText = "Feature.Screentime.Heading.ScreentimeLimitDialog", 
        BodyText = "Feature.Screentime.Content.ScreentimeLimitDialog"
    });
    local l_screenSize_1 = v51.screenSize;
    local v54 = l_useStyle_0();
    local l_Theme_1 = v54.Theme;
    local l_Font_0 = v54.Font;
    local l_globalGuiInset_1 = v51.globalGuiInset;
    local v58 = v17();
    local v59 = UDim2.fromOffset(0, l_globalGuiInset_1.top);
    local v60 = UDim2.fromOffset(l_screenSize_1.X, l_screenSize_1.Y - l_globalGuiInset_1.top - v58);
    v2.useEffect(function() --[[ Line: 236 ]]
        -- upvalues: v23 (ref), l_setInterval_0 (ref), v51 (copy), l_clearInterval_0 (ref)
        local v61 = l_setInterval_0(function() --[[ Line: 238 ]]
            -- upvalues: v51 (ref)
            v51.fetchUserAccess(v51.networking);
        end, v23);
        return function() --[[ Line: 242 ]]
            -- upvalues: v61 (copy), l_clearInterval_0 (ref)
            if v61 then
                l_clearInterval_0(v61);
            end;
        end;
    end, {});
    local v62 = v2.createElement(l_PartialPageModal_0, {
        title = v52.TitleText, 
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
                Text = v52.BodyText, 
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
    if v51.userAccess ~= nil then
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
                    Position = v59, 
                    Size = v60, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    Content = v62
                })
            })
        });
    else
        return nil;
    end;
end;
v31 = v3.connect(function(v63, _) --[[ Line: 307 ]]
    return {
        userAccess = v63.UserAccess, 
        restrictionDetail = v63.UserAccess and v63.UserAccess.restrictionDetail or nil
    };
end, function(v65) --[[ Line: 312 ]]
    -- upvalues: v12 (copy)
    return {
        fetchUserAccess = function(v66) --[[ Line: 314 ]] --[[ Name: fetchUserAccess ]]
            -- upvalues: v65 (copy), v12 (ref)
            v65(v12(v66));
        end
    };
end)(v31);
return (l_RoactServices_0.connect({
    networking = v13
})(v31));