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
local l_FlyoutSidePanelIXP_0 = require(l_Parent_0.SharedExperimentDefinition).FlyoutSidePanelIXP;
local v15 = nil;
if l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() then
    v15 = require(l_Parent_0.FlyoutSidePanel).Components.FlyoutLeftHeader;
end;
local function v16() --[[ Line: 25 ]] --[[ Name: noOpt ]]
    return nil;
end;
return function(v17) --[[ Line: 32 ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy), l_FlyoutSidePanelIXP_0 (copy), v13 (copy), l_withLocalization_0 (copy), v2 (copy), v16 (copy), v3 (copy), v15 (ref), v9 (copy), v7 (copy), l_VisibilityControl_0 (copy), l_withStyle_0 (copy), l_HeaderBar_0 (copy), v11 (copy)
    local v18 = if not not l_FFlagAppIaScrollAway_0 or l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() then v17.navigation.getScreenProps("isInExperience", false) else nil;
    local v19 = v17.navigation.getScreenProps("topBarHeight", 0);
    local v20 = v17.navigation.getScreenProps("navigateToRootStack", nil);
    local v21 = v17.shouldRenderCenter and v17.renderCenter ~= nil;
    local v22 = v17.headerText or {};
    local l_makeBackButton_0 = v13.makeBackButton;
    local l_makeCloseButton_0 = v13.makeCloseButton;
    return l_withLocalization_0({
        headerText = v22.shouldLocalize and v22.raw or nil
    })(function(v25) --[[ Line: 48 ]]
        -- upvalues: v22 (copy), v21 (copy), v17 (copy), v20 (copy), v2 (ref), l_makeBackButton_0 (copy), l_makeCloseButton_0 (copy), v16 (ref), l_FlyoutSidePanelIXP_0 (ref), v18 (copy), v3 (ref), v15 (ref), v9 (ref), l_FFlagAppIaScrollAway_0 (ref), v7 (ref), l_VisibilityControl_0 (ref), v19 (copy), l_withStyle_0 (ref), l_HeaderBar_0 (ref), v11 (ref)
        local v26 = v22.shouldLocalize and v25.headerText or v22.raw;
        local v27 = nil;
        local v28 = nil;
        local v29 = nil;
        if v21 then
            v26 = "";
            v27 = nil;
            v29 = nil;
            v28 = v17.renderCenter;
        else
            v27 = function() --[[ Line: 59 ]]
                -- upvalues: v17 (ref)
                return not (not v17.renderRight or v17.rightHidden) and v17.renderRight() or nil;
            end;
            v28 = nil;
            local v30 = v20 and function() --[[ Line: 66 ]]
                -- upvalues: v17 (ref), v2 (ref), v20 (ref)
                if v17.closeInputBar then
                    v17.closeInputBar();
                end;
                if v17.isRoot then
                    v17.navigation.navigate(v2.EmptyConversation);
                    v20();
                    return;
                else
                    v17.navigation.pop();
                    return;
                end;
            end or function() --[[ Line: 78 ]]
                -- upvalues: v17 (ref)
                v17.navigation.pop();
            end;
            v29 = if v17.backButtonEnabled then l_makeBackButton_0(v30) else if v17.closeButtonEnabled then l_makeCloseButton_0(v30) else v16;
        end;
        local v31 = not v17.backButtonEnabled and not v21;
        if l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() and not v18 and v31 and not v17.conversationId then
            v29 = function() --[[ Line: 99 ]]
                -- upvalues: v3 (ref), v15 (ref), v26 (ref), l_FlyoutSidePanelIXP_0 (ref)
                return v3.createElement(v15, {
                    titleText = v26, 
                    isRobloxLogoEnabled = false, 
                    isAlternateEntryPointEnabled = l_FlyoutSidePanelIXP_0.isAlternateEntryPointEnabled()
                });
            end;
        end;
        if v17.shouldBoldHeader and v29 == v16 then
            v29 = nil;
        end;
        local function v32() --[[ Line: 114 ]]
            -- upvalues: v3 (ref), v9 (ref), v29 (ref), v16 (ref), v27 (ref), v26 (ref), v17 (ref)
            return v3.createElement(v9, {
                renderLeft = if v29 == v16 then nil else v29, 
                renderRight = v27, 
                titleText = v26, 
                conversationId = v17.conversationId, 
                navigateToChatDetails = v17.navigateToChatDetails, 
                ignoreRightMargin = v17.rightPaddingOverride ~= nil
            });
        end;
        local v33 = UDim.new(0, 12);
        local v34 = UDim.new(0, 12);
        if v17.leftPaddingOverride ~= nil then
            v33 = UDim.new(0, v17.leftPaddingOverride);
        end;
        if v17.rightPaddingOverride ~= nil then
            v34 = UDim.new(0, v17.rightPaddingOverride);
        end;
        local v37 = if not (not l_FFlagAppIaScrollAway_0 or v18) and v7.getScrollAwayEnabled() then l_VisibilityControl_0.getHeaderBinding():map(function(v35) --[[ Line: 137 ]]
            -- upvalues: v19 (ref)
            local v36 = (v35 - 1) * (v19 + 36);
            return UDim2.new(0, 0, 0, v36);
        end) else nil;
        local v38 = l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() and not v18 and v31;
        if v20 then
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v19), 
                LayoutOrder = -1, 
                ZIndex = l_FFlagAppIaScrollAway_0 and 2 or nil, 
                Position = if l_FFlagAppIaScrollAway_0 then v37 else nil
            }, {
                headerBar = l_withStyle_0(function(v39) --[[ Line: 155 ]]
                    -- upvalues: v3 (ref), l_HeaderBar_0 (ref), v17 (ref), v38 (copy), v26 (ref), v19 (ref), v29 (ref), v32 (copy), v28 (ref), v27 (ref), v33 (ref), v34 (ref), l_FFlagAppIaScrollAway_0 (ref), v18 (ref), v11 (ref)
                    return v3.createElement(l_HeaderBar_0, {
                        title = if not not v17.conversationId or v38 then nil else v26, 
                        barHeight = v19, 
                        renderLeft = if v17.conversationId then nil else v29, 
                        isSecondary = v17.isSecondary, 
                        renderCenter = if v17.conversationId then v32 else v28, 
                        renderRight = if v17.conversationId then nil else v27, 
                        paddingLeft = v33, 
                        paddingRight = v34, 
                        isTitleCentered = not v17.isTitleLeftAligned, 
                        contentPaddingRight = UDim.new(0, 0), 
                        backgroundTransparency = if not l_FFlagAppIaScrollAway_0 or v18 or v11 and v17.isDialog then v39.Tokens.Global.Color.None.Transparency else nil
                    });
                end)
            });
        else
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v19), 
                LayoutOrder = -1, 
                ZIndex = l_FFlagAppIaScrollAway_0 and 2 or nil, 
                Position = if l_FFlagAppIaScrollAway_0 then v37 else nil
            }, {
                headerBar = l_withStyle_0(function(v40) --[[ Line: 183 ]]
                    -- upvalues: v3 (ref), l_HeaderBar_0 (ref), v17 (ref), v38 (copy), v26 (ref), v19 (ref), v31 (copy), v29 (ref), v32 (copy), v28 (ref), v27 (ref), v33 (ref), v34 (ref), l_FFlagAppIaScrollAway_0 (ref), v18 (ref), v11 (ref)
                    return v3.createElement(l_HeaderBar_0, {
                        title = if not not v17.conversationId or v38 then nil else v26, 
                        barHeight = v19, 
                        renderLeft = if v17.conversationId then nil else not v31 and v29 or nil, 
                        isSecondary = v17.isSecondary, 
                        renderCenter = if v17.conversationId then v32 else v28, 
                        renderRight = if v17.conversationId then nil else v27, 
                        paddingLeft = v33, 
                        paddingRight = v34, 
                        isTitleCentered = not v17.isTitleLeftAligned, 
                        contentPaddingRight = UDim.new(0, 0), 
                        backgroundTransparency = if not l_FFlagAppIaScrollAway_0 or v18 or v11 and v17.isDialog then v40.Tokens.Global.Color.None.Transparency else nil
                    });
                end)
            });
        end;
    end);
end;