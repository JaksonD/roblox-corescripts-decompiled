local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v5 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local v7 = require(l_Parent_0.AppNavBar);
local l_VisibilityControl_0 = v7.VisibilityControl;
local v9 = require(l_script_FirstAncestor_0.Components.ChatConversation.HeaderBarTitleLeftAligned);
local v10 = require(l_Parent_0.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v10.FFlagAppIaScrollAway;
local l_FFlagEnableHomeRobloxLogo_0 = v10.FFlagEnableHomeRobloxLogo;
local l_HeaderBar_0 = v5.App.Bar.HeaderBar;
local v14 = require(l_Parent_0.AppHeaderBar);
local v15 = require(l_Parent_0.Foundation);
local v16 = require(l_Parent_0.React);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDomLocatorFoundationMigration);
local l_FlyoutSidePanelIXP_0 = require(l_Parent_0.SharedExperimentDefinition).FlyoutSidePanelIXP;
local v19 = nil;
if l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() then
    v19 = require(l_Parent_0.FlyoutSidePanel).Components.FlyoutLeftHeader;
end;
local function v20() --[[ Line: 28 ]] --[[ Name: noOpt ]]
    return nil;
end;
return function(v21) --[[ Line: 35 ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy), l_FlyoutSidePanelIXP_0 (copy), v14 (copy), l_withLocalization_0 (copy), v2 (copy), v17 (copy), v16 (copy), v15 (copy), v20 (copy), v3 (copy), v19 (ref), l_FFlagEnableHomeRobloxLogo_0 (copy), v9 (copy), v7 (copy), l_VisibilityControl_0 (copy), l_withStyle_0 (copy), l_HeaderBar_0 (copy)
    local v22 = if not not l_FFlagAppIaScrollAway_0 or l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() then v21.navigation.getScreenProps("isInExperience", false) else nil;
    local v23 = v21.navigation.getScreenProps("topBarHeight", 0);
    local v24 = v21.navigation.getScreenProps("navigateToRootStack", nil);
    local v25 = v21.shouldRenderCenter and v21.renderCenter ~= nil;
    local v26 = v21.headerText or {};
    local l_makeBackButton_0 = v14.makeBackButton;
    local l_makeCloseButton_0 = v14.makeCloseButton;
    return l_withLocalization_0({
        headerText = v26.shouldLocalize and v26.raw or nil
    })(function(v29) --[[ Line: 51 ]]
        -- upvalues: v26 (copy), v25 (copy), v21 (copy), v24 (copy), v2 (ref), l_makeBackButton_0 (copy), v17 (ref), v16 (ref), v15 (ref), l_makeCloseButton_0 (copy), v20 (ref), l_FlyoutSidePanelIXP_0 (ref), v22 (copy), v3 (ref), v19 (ref), l_FFlagEnableHomeRobloxLogo_0 (ref), v9 (ref), l_FFlagAppIaScrollAway_0 (ref), v7 (ref), l_VisibilityControl_0 (ref), v23 (copy), l_withStyle_0 (ref), l_HeaderBar_0 (ref)
        local v30 = v26.shouldLocalize and v29.headerText or v26.raw;
        local v31 = nil;
        local v32 = nil;
        local v33 = nil;
        if v25 then
            v30 = "";
            v31 = nil;
            v33 = nil;
            v32 = v21.renderCenter;
        else
            v31 = function() --[[ Line: 62 ]]
                -- upvalues: v21 (ref)
                return not (not v21.renderRight or v21.rightHidden) and v21.renderRight() or nil;
            end;
            v32 = nil;
            local v34 = v24 and function() --[[ Line: 69 ]]
                -- upvalues: v21 (ref), v2 (ref), v24 (ref)
                if v21.closeInputBar then
                    v21.closeInputBar();
                end;
                if v21.isRoot then
                    v21.navigation.navigate(v2.EmptyConversation);
                    v24();
                    return;
                else
                    v21.navigation.pop();
                    return;
                end;
            end or function() --[[ Line: 81 ]]
                -- upvalues: v21 (ref)
                v21.navigation.pop();
            end;
            if v21.backButtonEnabled then
                v33 = l_makeBackButton_0(v34);
                if v17 and v21.backButtonTestId then
                    local l_v33_0 = v33;
                    local l_l_v33_0_0 = l_v33_0 --[[ copy: 6 -> 11 ]];
                    v33 = function() --[[ Line: 89 ]]
                        -- upvalues: v16 (ref), v15 (ref), v21 (ref), l_l_v33_0_0 (copy)
                        return v16.createElement(v15.View, {
                            tag = "auto-xy", 
                            testId = v21.backButtonTestId
                        }, {
                            backButton = l_l_v33_0_0()
                        });
                    end;
                end;
            else
                v33 = if v21.closeButtonEnabled then l_makeCloseButton_0(v34) else v20;
            end;
        end;
        local v37 = not v21.backButtonEnabled and not v25;
        if l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() and not v22 and v37 and not v21.conversationId then
            v33 = function() --[[ Line: 111 ]]
                -- upvalues: v3 (ref), v19 (ref), v30 (ref), l_FFlagEnableHomeRobloxLogo_0 (ref), l_FlyoutSidePanelIXP_0 (ref)
                return v3.createElement(v19, {
                    titleText = v30, 
                    isRobloxLogoEnabled = false, 
                    isFlyoutEntrypointEnabled = if l_FFlagEnableHomeRobloxLogo_0 then l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() else nil, 
                    isAlternateEntryPointEnabled = l_FlyoutSidePanelIXP_0.isAlternateEntryPointEnabled()
                });
            end;
        end;
        if v21.shouldBoldHeader and v33 == v20 then
            v33 = nil;
        end;
        local function v38() --[[ Line: 129 ]]
            -- upvalues: v3 (ref), v9 (ref), v33 (ref), v20 (ref), v31 (ref), v30 (ref), v21 (ref)
            return v3.createElement(v9, {
                renderLeft = if v33 == v20 then nil else v33, 
                renderRight = v31, 
                titleText = v30, 
                conversationId = v21.conversationId, 
                navigateToChatDetails = v21.navigateToChatDetails, 
                ignoreRightMargin = v21.rightPaddingOverride ~= nil
            });
        end;
        local v39 = UDim.new(0, 12);
        local v40 = UDim.new(0, 12);
        if v21.leftPaddingOverride ~= nil then
            v39 = UDim.new(0, v21.leftPaddingOverride);
        end;
        if v21.rightPaddingOverride ~= nil then
            v40 = UDim.new(0, v21.rightPaddingOverride);
        end;
        local v43 = if not (not l_FFlagAppIaScrollAway_0 or v22) and v7.getScrollAwayEnabled() then l_VisibilityControl_0.getHeaderBinding():map(function(v41) --[[ Line: 152 ]]
            -- upvalues: v23 (ref)
            local v42 = (v41 - 1) * (v23 + 36);
            return UDim2.new(0, 0, 0, v42);
        end) else nil;
        local v44 = l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() and not v22 and v37;
        if v24 then
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v23), 
                LayoutOrder = -1, 
                ZIndex = l_FFlagAppIaScrollAway_0 and 2 or nil, 
                Position = if l_FFlagAppIaScrollAway_0 then v43 else nil
            }, {
                headerBar = l_withStyle_0(function(v45) --[[ Line: 170 ]]
                    -- upvalues: v3 (ref), l_HeaderBar_0 (ref), v21 (ref), v44 (copy), v30 (ref), v23 (ref), v33 (ref), v38 (copy), v32 (ref), v31 (ref), v39 (ref), v40 (ref), l_FFlagAppIaScrollAway_0 (ref), v22 (ref)
                    return v3.createElement(l_HeaderBar_0, {
                        title = if not not v21.conversationId or v44 then nil else v30, 
                        barHeight = v23, 
                        renderLeft = if v21.conversationId then nil else v33, 
                        isSecondary = v21.isSecondary, 
                        renderCenter = if v21.conversationId then v38 else v32, 
                        renderRight = if v21.conversationId then nil else v31, 
                        paddingLeft = v39, 
                        paddingRight = v40, 
                        isTitleCentered = not v21.isTitleLeftAligned, 
                        contentPaddingRight = UDim.new(0, 0), 
                        backgroundTransparency = if not l_FFlagAppIaScrollAway_0 or v22 or v21.isDialog then v45.Tokens.Global.Color.None.Transparency else nil
                    });
                end)
            });
        else
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v23), 
                LayoutOrder = -1, 
                ZIndex = l_FFlagAppIaScrollAway_0 and 2 or nil, 
                Position = if l_FFlagAppIaScrollAway_0 then v43 else nil
            }, {
                headerBar = l_withStyle_0(function(v46) --[[ Line: 198 ]]
                    -- upvalues: v3 (ref), l_HeaderBar_0 (ref), v21 (ref), v44 (copy), v30 (ref), v23 (ref), v37 (copy), v33 (ref), v38 (copy), v32 (ref), v31 (ref), v39 (ref), v40 (ref), l_FFlagAppIaScrollAway_0 (ref), v22 (ref)
                    return v3.createElement(l_HeaderBar_0, {
                        title = if not not v21.conversationId or v44 then nil else v30, 
                        barHeight = v23, 
                        renderLeft = if v21.conversationId then nil else not v37 and v33 or nil, 
                        isSecondary = v21.isSecondary, 
                        renderCenter = if v21.conversationId then v38 else v32, 
                        renderRight = if v21.conversationId then nil else v31, 
                        paddingLeft = v39, 
                        paddingRight = v40, 
                        isTitleCentered = not v21.isTitleLeftAligned, 
                        contentPaddingRight = UDim.new(0, 0), 
                        backgroundTransparency = if not l_FFlagAppIaScrollAway_0 or v22 or v21.isDialog then v46.Tokens.Global.Color.None.Transparency else nil
                    });
                end)
            });
        end;
    end);
end;