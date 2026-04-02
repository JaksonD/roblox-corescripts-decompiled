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
local l_FFlagAppIaScrollAway_0 = require(l_Parent_0.SharedFlags).FFlagAppIaScrollAway;
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDialogRoundedCorners);
local l_HeaderBar_0 = v5.App.Bar.HeaderBar;
local v13 = require(l_Parent_0.AppHeaderBar);
local v14 = require(l_Parent_0.Foundation);
local v15 = require(l_Parent_0.React);
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDomLocatorFoundationMigration);
local l_FlyoutSidePanelIXP_0 = require(l_Parent_0.SharedExperimentDefinition).FlyoutSidePanelIXP;
local v18 = nil;
if l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() then
    v18 = require(l_Parent_0.FlyoutSidePanel).Components.FlyoutLeftHeader;
end;
local function v19() --[[ Line: 28 ]] --[[ Name: noOpt ]]
    return nil;
end;
return function(v20) --[[ Line: 35 ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy), l_FlyoutSidePanelIXP_0 (copy), v13 (copy), l_withLocalization_0 (copy), v2 (copy), v16 (copy), v15 (copy), v14 (copy), v19 (copy), v3 (copy), v18 (ref), v9 (copy), v7 (copy), l_VisibilityControl_0 (copy), l_withStyle_0 (copy), l_HeaderBar_0 (copy), v11 (copy)
    local v21 = if not not l_FFlagAppIaScrollAway_0 or l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() then v20.navigation.getScreenProps("isInExperience", false) else nil;
    local v22 = v20.navigation.getScreenProps("topBarHeight", 0);
    local v23 = v20.navigation.getScreenProps("navigateToRootStack", nil);
    local v24 = v20.shouldRenderCenter and v20.renderCenter ~= nil;
    local v25 = v20.headerText or {};
    local l_makeBackButton_0 = v13.makeBackButton;
    local l_makeCloseButton_0 = v13.makeCloseButton;
    return l_withLocalization_0({
        headerText = v25.shouldLocalize and v25.raw or nil
    })(function(v28) --[[ Line: 51 ]]
        -- upvalues: v25 (copy), v24 (copy), v20 (copy), v23 (copy), v2 (ref), l_makeBackButton_0 (copy), v16 (ref), v15 (ref), v14 (ref), l_makeCloseButton_0 (copy), v19 (ref), l_FlyoutSidePanelIXP_0 (ref), v21 (copy), v3 (ref), v18 (ref), v9 (ref), l_FFlagAppIaScrollAway_0 (ref), v7 (ref), l_VisibilityControl_0 (ref), v22 (copy), l_withStyle_0 (ref), l_HeaderBar_0 (ref), v11 (ref)
        local v29 = v25.shouldLocalize and v28.headerText or v25.raw;
        local v30 = nil;
        local v31 = nil;
        local v32 = nil;
        if v24 then
            v29 = "";
            v30 = nil;
            v32 = nil;
            v31 = v20.renderCenter;
        else
            v30 = function() --[[ Line: 62 ]]
                -- upvalues: v20 (ref)
                return not (not v20.renderRight or v20.rightHidden) and v20.renderRight() or nil;
            end;
            v31 = nil;
            local v33 = v23 and function() --[[ Line: 69 ]]
                -- upvalues: v20 (ref), v2 (ref), v23 (ref)
                if v20.closeInputBar then
                    v20.closeInputBar();
                end;
                if v20.isRoot then
                    v20.navigation.navigate(v2.EmptyConversation);
                    v23();
                    return;
                else
                    v20.navigation.pop();
                    return;
                end;
            end or function() --[[ Line: 81 ]]
                -- upvalues: v20 (ref)
                v20.navigation.pop();
            end;
            if v20.backButtonEnabled then
                v32 = l_makeBackButton_0(v33);
                if v16 and v20.backButtonTestId then
                    local l_v32_0 = v32;
                    local l_l_v32_0_0 = l_v32_0 --[[ copy: 6 -> 11 ]];
                    v32 = function() --[[ Line: 89 ]]
                        -- upvalues: v15 (ref), v14 (ref), v20 (ref), l_l_v32_0_0 (copy)
                        return v15.createElement(v14.View, {
                            tag = "auto-xy", 
                            testId = v20.backButtonTestId
                        }, {
                            backButton = l_l_v32_0_0()
                        });
                    end;
                end;
            else
                v32 = if v20.closeButtonEnabled then l_makeCloseButton_0(v33) else v19;
            end;
        end;
        local v36 = not v20.backButtonEnabled and not v24;
        if l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() and not v21 and v36 and not v20.conversationId then
            v32 = function() --[[ Line: 111 ]]
                -- upvalues: v3 (ref), v18 (ref), v29 (ref), l_FlyoutSidePanelIXP_0 (ref)
                return v3.createElement(v18, {
                    titleText = v29, 
                    isRobloxLogoEnabled = false, 
                    isAlternateEntryPointEnabled = l_FlyoutSidePanelIXP_0.isAlternateEntryPointEnabled()
                });
            end;
        end;
        if v20.shouldBoldHeader and v32 == v19 then
            v32 = nil;
        end;
        local function v37() --[[ Line: 126 ]]
            -- upvalues: v3 (ref), v9 (ref), v32 (ref), v19 (ref), v30 (ref), v29 (ref), v20 (ref)
            return v3.createElement(v9, {
                renderLeft = if v32 == v19 then nil else v32, 
                renderRight = v30, 
                titleText = v29, 
                conversationId = v20.conversationId, 
                navigateToChatDetails = v20.navigateToChatDetails, 
                ignoreRightMargin = v20.rightPaddingOverride ~= nil
            });
        end;
        local v38 = UDim.new(0, 12);
        local v39 = UDim.new(0, 12);
        if v20.leftPaddingOverride ~= nil then
            v38 = UDim.new(0, v20.leftPaddingOverride);
        end;
        if v20.rightPaddingOverride ~= nil then
            v39 = UDim.new(0, v20.rightPaddingOverride);
        end;
        local v42 = if not (not l_FFlagAppIaScrollAway_0 or v21) and v7.getScrollAwayEnabled() then l_VisibilityControl_0.getHeaderBinding():map(function(v40) --[[ Line: 149 ]]
            -- upvalues: v22 (ref)
            local v41 = (v40 - 1) * (v22 + 36);
            return UDim2.new(0, 0, 0, v41);
        end) else nil;
        local v43 = l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() and not v21 and v36;
        if v23 then
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v22), 
                LayoutOrder = -1, 
                ZIndex = l_FFlagAppIaScrollAway_0 and 2 or nil, 
                Position = if l_FFlagAppIaScrollAway_0 then v42 else nil
            }, {
                headerBar = l_withStyle_0(function(v44) --[[ Line: 167 ]]
                    -- upvalues: v3 (ref), l_HeaderBar_0 (ref), v20 (ref), v43 (copy), v29 (ref), v22 (ref), v32 (ref), v37 (copy), v31 (ref), v30 (ref), v38 (ref), v39 (ref), l_FFlagAppIaScrollAway_0 (ref), v21 (ref), v11 (ref)
                    return v3.createElement(l_HeaderBar_0, {
                        title = if not not v20.conversationId or v43 then nil else v29, 
                        barHeight = v22, 
                        renderLeft = if v20.conversationId then nil else v32, 
                        isSecondary = v20.isSecondary, 
                        renderCenter = if v20.conversationId then v37 else v31, 
                        renderRight = if v20.conversationId then nil else v30, 
                        paddingLeft = v38, 
                        paddingRight = v39, 
                        isTitleCentered = not v20.isTitleLeftAligned, 
                        contentPaddingRight = UDim.new(0, 0), 
                        backgroundTransparency = if not l_FFlagAppIaScrollAway_0 or v21 or v11 and v20.isDialog then v44.Tokens.Global.Color.None.Transparency else nil
                    });
                end)
            });
        else
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v22), 
                LayoutOrder = -1, 
                ZIndex = l_FFlagAppIaScrollAway_0 and 2 or nil, 
                Position = if l_FFlagAppIaScrollAway_0 then v42 else nil
            }, {
                headerBar = l_withStyle_0(function(v45) --[[ Line: 195 ]]
                    -- upvalues: v3 (ref), l_HeaderBar_0 (ref), v20 (ref), v43 (copy), v29 (ref), v22 (ref), v36 (copy), v32 (ref), v37 (copy), v31 (ref), v30 (ref), v38 (ref), v39 (ref), l_FFlagAppIaScrollAway_0 (ref), v21 (ref), v11 (ref)
                    return v3.createElement(l_HeaderBar_0, {
                        title = if not not v20.conversationId or v43 then nil else v29, 
                        barHeight = v22, 
                        renderLeft = if v20.conversationId then nil else not v36 and v32 or nil, 
                        isSecondary = v20.isSecondary, 
                        renderCenter = if v20.conversationId then v37 else v31, 
                        renderRight = if v20.conversationId then nil else v30, 
                        paddingLeft = v38, 
                        paddingRight = v39, 
                        isTitleCentered = not v20.isTitleLeftAligned, 
                        contentPaddingRight = UDim.new(0, 0), 
                        backgroundTransparency = if not l_FFlagAppIaScrollAway_0 or v21 or v11 and v20.isDialog then v45.Tokens.Global.Color.None.Transparency else nil
                    });
                end)
            });
        end;
    end);
end;