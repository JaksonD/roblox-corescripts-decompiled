local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.AppBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_FullscreenPageWithSafeArea_0 = v5.FullscreenPageWithSafeArea;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v13 = require(l_Parent_0.Foundation);
local l_Text_0 = v13.Text;
local l_useTokens_0 = v13.Hooks.useTokens;
local l_ScrollView_0 = v13.ScrollView;
local l_Visibility_0 = v13.Enums.Visibility;
local l_Loading_0 = v13.Loading;
local l_IconSize_0 = v13.Enums.IconSize;
local l_GetFFlagEnableContinueRecovery_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableContinueRecovery;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_useClearFocusOnUnmount_0 = require(l_script_FirstAncestor_0.Hooks).useClearFocusOnUnmount;
local v23 = require(l_script_FirstAncestor_0.Store.AccountRecoveryContext);
local v24 = require(l_script_FirstAncestor_0.Thunks.RecoverySessionMetadata);
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
local v26 = require(l_script_FirstAncestor_0.Components.RecoveryHeader);
local v27 = require(l_script_FirstAncestor_0.Components.ProfileListItem);
local v28 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryPageState);
local v29 = require(l_script_FirstAncestor_0.Analytics.EventService);
local v30 = require(l_script_FirstAncestor_0.Components.Constants);
return function(v31) --[[ Line: 51 ]]
    -- upvalues: v3 (copy), v23 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useClearFocusOnUnmount_0 (copy), v24 (copy), l_Logger_0 (copy), l_HttpService_0 (copy), v28 (copy), l_GetFFlagEnableContinueRecovery_0 (copy), v27 (copy), l_useLocalization_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), v26 (copy), l_Loading_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy), l_ScrollView_0 (copy), l_Visibility_0 (copy), v29 (copy), v30 (copy)
    local v32 = v3.useContext(v23);
    local v33 = l_useStyle_0();
    local v34 = l_useTokens_0();
    local v35 = l_useDesignTokens_0();
    local v36 = l_useDispatch_0();
    local v37 = l_useRoactService_0(l_RoactNetworking_0);
    local v38, v39 = v3.useState({});
    local v40, v41 = v3.useState(false);
    local v42, v43 = v3.useState(true);
    local v44, v45 = v3.useState("");
    local v46, v47 = v3.useState(false);
    local v48, v49 = v3.useState(Vector2.new(0, 0));
    local v50 = v31.navigation.getParam("userID");
    local v51 = false;
    if v50 ~= nil then
        v51 = v50 ~= 0;
    end;
    l_useClearFocusOnUnmount_0();
    local function _(v52) --[[ Line: 73 ]]
        -- upvalues: v36 (copy), v24 (ref), v37 (copy)
        return v36(v24(v37, {
            recoverySessionId = v52
        }));
    end;
    local function _(v54, v55, v56, v57) --[[ Line: 79 ]]
        -- upvalues: v47 (copy), v45 (copy), v32 (copy)
        v47(true);
        v45("");
        v32.utils.handleContinueRecovery(v32.state.recoverySessionId, v54, v55, v56, v57, nil, nil, nil);
    end;
    v3.useEffect(function() --[[ Line: 99 ]]
        -- upvalues: v43 (copy), v32 (copy), v36 (copy), v24 (ref), v37 (copy), l_Logger_0 (ref), l_HttpService_0 (ref), v39 (copy), v47 (copy), v41 (copy), v51 (copy), v31 (copy), v28 (ref), v50 (copy), l_GetFFlagEnableContinueRecovery_0 (ref), v45 (copy)
        v43(true);
        local l_recoverySessionId_0 = v32.state.recoverySessionId;
        v36(v24(v37, {
            recoverySessionId = l_recoverySessionId_0
        })):andThen(function(v60) --[[ Line: 102 ]]
            -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), v39 (ref), v43 (ref), v47 (ref), v41 (ref), v51 (ref), v31 (ref), v28 (ref), v50 (ref), l_GetFFlagEnableContinueRecovery_0 (ref), v45 (ref), v32 (ref)
            if v60.isError then
                l_Logger_0:warning("Error getting recovery session metadata: {}", l_HttpService_0:JSONEncode(v60));
                return;
            else
                local function v61() --[[ Line: 107 ]]
                    -- upvalues: v39 (ref), v60 (copy), v43 (ref), v47 (ref)
                    v39(v60.data.eligibleUserIDsToRecover);
                    v43(false);
                    v47(false);
                end;
                v41(v60.data.shouldAddContactMethod);
                if v51 then
                    v31.navigation.replace(v28.ResetPasswordScreen, {
                        userID = v50, 
                        shouldAddContactMethod = v60.data.shouldAddContactMethod
                    });
                    return;
                elseif v60.data.eligibleUserIDsToRecover and #v60.data.eligibleUserIDsToRecover == 1 then
                    if l_GetFFlagEnableContinueRecovery_0() then
                        local v62 = v60.data.eligibleUserIDsToRecover[1];
                        local function v63() --[[ Line: 120 ]]
                            -- upvalues: v31 (ref), v28 (ref), v60 (copy)
                            v31.navigation.replace(v28.ResetPasswordScreen, {
                                userID = v60.data.eligibleUserIDsToRecover[1], 
                                shouldAddContactMethod = v60.data.shouldAddContactMethod
                            });
                        end;
                        v47(true);
                        v45("");
                        v32.utils.handleContinueRecovery(v32.state.recoverySessionId, v62, v63, v61, v61, nil, nil, nil);
                        return;
                    else
                        v31.navigation.replace(v28.ResetPasswordScreen, {
                            userID = v60.data.eligibleUserIDsToRecover[1], 
                            shouldAddContactMethod = v60.data.shouldAddContactMethod
                        });
                        return;
                    end;
                elseif v60.data.eligibleUserIDsToRecover then
                    v39(v60.data.eligibleUserIDsToRecover);
                    v43(false);
                    v47(false);
                    return;
                else
                    l_Logger_0:warning("Eligible user IDs to recover is nil");
                    v43(false);
                    return;
                end;
            end;
        end):await();
    end, {});
    local function v69(v64, v65) --[[ Line: 142 ]]
        -- upvalues: v3 (ref), v27 (ref)
        if v64 == nil or #v64 == 0 then
            return nil;
        else
            local v66 = {};
            for v67, v68 in ipairs(v64) do
                v66["Profile_" .. tostring(v67)] = v3.createElement(v27, {
                    index = v67, 
                    userId = v68, 
                    onProfileActivated = v65
                });
            end;
            return v66;
        end;
    end;
    local function v71(v70) --[[ Line: 160 ]]
        -- upvalues: v48 (copy), v49 (copy)
        if v48 ~= v70.AbsoluteSize then
            v49(v70.AbsoluteSize);
        end;
    end;
    local v72 = l_useLocalization_0({
        resetPasswordHeadingText = "Authentication.AccountRecovery.Heading.ResetPassword", 
        chooseAccountText = "Authentication.AccountRecovery.Description.ChooseAccount", 
        requestErrorText = if v44 ~= "" then v44 else nil
    });
    local l_createElement_0 = v3.createElement;
    local l_l_FullscreenPageWithSafeArea_0_0 = l_FullscreenPageWithSafeArea_0;
    local v75 = {
        includeStatusBar = true, 
        BackgroundColor3 = v33.Theme.BackgroundDefault.Color
    };
    local v76 = {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v35.Global.Space_100), 
            PaddingLeft = UDim.new(0, v35.Global.Space_150), 
            PaddingRight = UDim.new(0, v35.Global.Space_150), 
            PaddingBottom = UDim.new(0, v35.Global.Space_100)
        })
    };
    local l_createElement_1 = v3.createElement;
    local v78 = "Frame";
    local v79 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0)
    };
    local v80 = {
        UIListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        Header = v3.createElement(v26, {
            LayoutOrder = 1, 
            onBackActivated = function() --[[ Line: 193 ]] --[[ Name: onBackActivated ]]
                -- upvalues: v31 (copy)
                v31.navigation.goBack();
            end, 
            backButtonDisabled = v46 or v42, 
            recoveryHeadingText = v72.resetPasswordHeadingText, 
            currentComponent = "chooseAccount", 
            recoverySessionId = v32.state.recoverySessionId
        }), 
        Loading = v42 and v3.createElement("Frame", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v35.Global.Space_20), 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            LoadingIcon = v3.createElement(l_Loading_0, {
                size = l_IconSize_0.Medium
            })
        })
    };
    local v81 = not v42;
    if v81 then
        v81 = v3.createElement;
        local v82 = "Frame";
        local v83 = {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        };
        local v84 = {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            })
        };
        local l_createElement_2 = v3.createElement;
        local v86 = "Frame";
        local v87 = {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            [v3.Change.AbsoluteSize] = v71
        };
        local v88 = {
            UIPadding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v35.Global.Space_100), 
                PaddingRight = UDim.new(0, v35.Global.Space_100)
            }), 
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v35.Global.Space_20)
            }), 
            HeaderSpacing = v3.createElement("Frame", {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, v34.Size.Size_400), 
                BackgroundTransparency = 1
            }), 
            BodyText = v3.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v72.chooseAccountText, 
                TextWrapped = true, 
                fontStyle = v34.Typography.BodyMedium, 
                textStyle = v34.Color.Content.Default, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            BodyTextSpacing = v3.createElement("Frame", {
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, v34.Size.Size_300), 
                BackgroundTransparency = 1
            })
        };
        local v89 = false;
        if v44 ~= "" then
            v89 = v3.createElement(l_Text_0, {
                LayoutOrder = 4, 
                Text = v72.requestErrorText or "", 
                fontStyle = v34.Typography.CaptionSmall, 
                textStyle = v34.Color.System.Alert, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                padding = {
                    bottom = UDim.new(0, v34.Size.Size_300)
                }
            });
        end;
        v88.RequestErrorTextLabel = v89;
        v84.PreScrollContent = l_createElement_2(v86, v87, v88);
        v84.AccountListScrollView = v3.createElement(l_ScrollView_0, {
            LayoutOrder = 2, 
            scroll = {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.new(1, 0, 0, 0), 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                scrollBarVisibility = l_Visibility_0.Always
            }, 
            Size = UDim2.new(1, 0, 1, -v48.Y)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v35.Global.Space_20)
            }), 
            ProfilesList = v3.createElement(v3.Fragment, nil, (v69(v38, function(v90) --[[ Line: 296 ]]
                -- upvalues: v29 (ref), v32 (copy), l_GetFFlagEnableContinueRecovery_0 (ref), v47 (copy), v31 (copy), v28 (ref), v40 (copy), v45 (copy), v30 (ref)
                v29.sendUserSelectedEvent(v32.state.recoverySessionId);
                if l_GetFFlagEnableContinueRecovery_0() then
                    local function v91() --[[ Line: 299 ]]
                        -- upvalues: v47 (ref), v31 (ref), v28 (ref), v90 (copy), v40 (ref)
                        v47(false);
                        v31.navigation.navigate(v28.ResetPasswordScreen, {
                            userID = v90, 
                            shouldAddContactMethod = v40
                        });
                    end;
                    local function v93(v92) --[[ Line: 305 ]]
                        -- upvalues: v45 (ref), v30 (ref), v47 (ref)
                        v45(v92 or v30.UnknownErrorKey);
                        v47(false);
                    end;
                    local function v94() --[[ Line: 308 ]]
                        -- upvalues: v47 (ref)
                        v47(false);
                    end;
                    v47(true);
                    v45("");
                    v32.utils.handleContinueRecovery(v32.state.recoverySessionId, v90, v91, v93, v94, nil, nil, nil);
                    return;
                else
                    v31.navigation.navigate(v28.ResetPasswordScreen, {
                        userID = v90, 
                        shouldAddContactMethod = v40
                    });
                    return;
                end;
            end)))
        });
        v81 = v81(v82, v83, v84);
    end;
    v80.Content = v81;
    v76.Wrapper = l_createElement_1(v78, v79, v80);
    return l_createElement_0(l_l_FullscreenPageWithSafeArea_0_0, v75, v76);
end;