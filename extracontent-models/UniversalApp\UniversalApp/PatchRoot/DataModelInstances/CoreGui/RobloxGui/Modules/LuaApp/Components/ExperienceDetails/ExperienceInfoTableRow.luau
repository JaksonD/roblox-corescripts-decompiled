local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v3.Core.Style.withStyle;
local l_Cell_0 = v3.App.Table.Cell;
local l_CellHeadDetail_0 = v3.App.Table.CellHeadDetail;
local l_CellTailDescription_0 = v3.App.Table.CellTailDescription;
local v8 = require(l_CorePackages_0.Packages.t);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_EnableCommunityProfilePageIXP_0 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform).EnableCommunityProfilePageIXP;
local l_GameDetailsSubpage_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents.GameDetailsSubpage;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v13 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v14 = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens);
local l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents;
local l_FStringLuaAppBadgesSeeAllIxpLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringLuaAppBadgesSeeAllIxpLayer;
local l_FFlagLuaAppBadgesSeeAllLogExposure_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllLogExposure;
local function _(v18, v19) --[[ Line: 31 ]] --[[ Name: applyTokenScaling ]]
    return v18 * (v19.Stroke and v19.Stroke.Standard or v19.Global and v19.Global.Stroke_100 or 1);
end;
local v21 = v2.PureComponent:extend("ExperienceInfoTableRow");
v21.validateProps = v8.strictInterface({
    horizontalPadding = v8.optional(v8.number), 
    infoName = v8.string, 
    infoData = v8.string, 
    infoIcon = v8.optional(v8.string), 
    renderTextOverride = v8.optional(v8.callback), 
    linkProps = v8.optional(v8.strictInterface({
        linkPage = v8.optional(v8.string), 
        analyticsSubPage = v8.string, 
        rootPlaceId = v8.string, 
        eventIngest = v8.table, 
        navigate = v8.callback, 
        navigateProps = v8.optional(v8.any)
    })), 
    externalLinkProps = v8.optional(v8.strictInterface({
        linkUrl = v8.string, 
        openLeaveRobloxAlert = v8.callback, 
        closeAlert = v8.callback, 
        linking = v8.table, 
        clickCallback = v8.optional(v8.callback)
    })), 
    universeId = if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v8.optional(v8.string) else nil, 
    testId = v8.optional(v8.string)
});
v21.init = function(v22) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: l_AppPage_0 (copy), v13 (copy), l_GameDetailsSubpage_0 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (copy), l_EnableCommunityProfilePageIXP_0 (copy), l_FFlagLuaAppBadgesSeeAllLogExposure_0 (copy), l_IXPService_0 (copy), l_FStringLuaAppBadgesSeeAllIxpLayer_0 (copy)
    v22.onActivated = function() --[[ Line: 64 ]]
        -- upvalues: v22 (copy), l_AppPage_0 (ref), v13 (ref), l_GameDetailsSubpage_0 (ref), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref), l_EnableCommunityProfilePageIXP_0 (ref), l_FFlagLuaAppBadgesSeeAllLogExposure_0 (ref), l_IXPService_0 (ref), l_FStringLuaAppBadgesSeeAllIxpLayer_0 (ref)
        local l_externalLinkProps_0 = v22.props.externalLinkProps;
        if l_externalLinkProps_0 then
            l_externalLinkProps_0.openLeaveRobloxAlert(function() --[[ Line: 67 ]]
                -- upvalues: l_externalLinkProps_0 (copy)
                l_externalLinkProps_0.linking:openURL(l_externalLinkProps_0.linkUrl);
                l_externalLinkProps_0.closeAlert();
                local l_clickCallback_0 = l_externalLinkProps_0.clickCallback;
                if l_clickCallback_0 then
                    l_clickCallback_0();
                end;
            end);
            return;
        else
            local l_linkProps_0 = v22.props.linkProps;
            if not l_linkProps_0 then
                return;
            else
                local l_infoName_0 = v22.props.infoName;
                local l_linkPage_0 = l_linkProps_0.linkPage;
                local l_rootPlaceId_0 = l_linkProps_0.rootPlaceId;
                local l_analyticsSubPage_0 = l_linkProps_0.analyticsSubPage;
                local l_eventIngest_0 = l_linkProps_0.eventIngest;
                local l_navigate_0 = l_linkProps_0.navigate;
                local v32 = if l_linkProps_0.navigateProps then l_linkProps_0.navigateProps else {
                    name = l_AppPage_0.GenericWebPage, 
                    detail = l_linkPage_0, 
                    extraProps = {
                        title = l_infoName_0, 
                        transitionAnimation = v13.SlideInFromRight
                    }
                };
                l_GameDetailsSubpage_0(l_eventIngest_0, "GameInfoRow", l_rootPlaceId_0, l_analyticsSubPage_0, if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v22.props.universeId else nil);
                if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and (l_analyticsSubPage_0 == "Developer" or l_analyticsSubPage_0 == "Group") then
                    l_EnableCommunityProfilePageIXP_0.logExposure();
                end;
                if l_FFlagLuaAppBadgesSeeAllLogExposure_0 and l_analyticsSubPage_0 == "Badges" then
                    l_IXPService_0:LogFlagLinkedUserLayerExposure(l_FStringLuaAppBadgesSeeAllIxpLayer_0);
                end;
                l_navigate_0(v32);
                return;
            end;
        end;
    end;
end;
v21.render = function(v33) --[[ Line: 121 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), l_Cell_0 (copy), l_CellHeadDetail_0 (copy), v14 (copy), l_CellTailDescription_0 (copy)
    local l_infoName_1 = v33.props.infoName;
    local l_infoData_0 = v33.props.infoData;
    local l_infoIcon_0 = v33.props.infoIcon;
    local l_testId_0 = v33.props.testId;
    local l_linkProps_1 = v33.props.linkProps;
    local l_externalLinkProps_1 = v33.props.externalLinkProps;
    local v40 = not not l_linkProps_1 or l_externalLinkProps_1 and true or false;
    local l_renderTextOverride_0 = v33.props.renderTextOverride;
    return l_withStyle_0(function(v42) --[[ Line: 132 ]]
        -- upvalues: v2 (ref), l_Cell_0 (ref), v40 (copy), v33 (copy), l_CellHeadDetail_0 (ref), l_infoName_1 (copy), v14 (ref), l_CellTailDescription_0 (ref), l_infoData_0 (copy), l_renderTextOverride_0 (copy), l_infoIcon_0 (copy), l_testId_0 (copy)
        local l_createElement_0 = v2.createElement;
        local l_l_Cell_0_0 = l_Cell_0;
        local v45 = {};
        local l_new_0 = UDim2.new;
        local v47 = 1;
        local v48 = 0;
        local v49 = 0;
        local l_Tokens_0 = v42.Tokens;
        v45.size = l_new_0(v47, v48, v49, 56 * (l_Tokens_0.Stroke and l_Tokens_0.Stroke.Standard or l_Tokens_0.Global and l_Tokens_0.Global.Stroke_100 or 1));
        v45.selectable = true;
        v45.userInteractionEnabled = v40;
        v45.onActivated = v40 and v33.onActivated or nil;
        v45.horizontalPadding = v33.props.horizontalPadding;
        v45.head = v2.createElement(l_CellHeadDetail_0, {
            labelText = l_infoName_1, 
            labelTextColor = v42.Theme.TextDefault, 
            labelTextFont = if v14 then v42.Tokens.Semantic.Typography.Body else v42.Font.Body
        });
        v45.tail = v2.createElement(l_CellTailDescription_0, {
            text = l_infoData_0, 
            textColor = v42.Theme.TextEmphasis, 
            textFont = if v14 then v42.Tokens.Semantic.Typography.Subheader else v42.Font.Body, 
            renderTextOverride = l_renderTextOverride_0, 
            showArrow = v40, 
            infoIcon = l_infoIcon_0, 
            testId = l_testId_0
        });
        return l_createElement_0(l_l_Cell_0_0, v45);
    end);
end;
return v21;