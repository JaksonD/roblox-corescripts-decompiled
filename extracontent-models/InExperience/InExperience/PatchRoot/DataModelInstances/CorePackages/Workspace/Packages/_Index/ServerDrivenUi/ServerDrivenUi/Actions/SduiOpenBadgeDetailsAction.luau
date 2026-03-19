local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_FFlagLuaAppBadgeDetailsEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppBadgeDetailsEnabled;
local l_fetchBadgeDetailsPage_0 = require(l_Parent_0.Badges).fetchBadgeDetailsPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v8 = require(l_Parent_0.SduiCoreSystem);
local l_SduiLoadTimer_0 = require(l_Parent_0.SduiSharedUtilities).SduiLoadTimer;
local l_FFlagLuaAppBadgeDetailsLogExposure_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppBadgeDetailsLogExposure;
local l_FStringLuaAppBadgeDetailsIxpLayer_0 = require(l_Parent_0.SharedFlags).FStringLuaAppBadgeDetailsIxpLayer;
local l_SduiErrorType_0 = v8.SduiErrors.SduiErrorType;
local l_SduiActionType_0 = v8.SduiActionType;
local v14 = l_UrlBuilder_0.fromString("www:badges")();
return function(v15, _, v17, _) --[[ Line: 28 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_FFlagLuaAppBadgeDetailsLogExposure_0 (copy), l_IXPService_0 (copy), l_FStringLuaAppBadgeDetailsIxpLayer_0 (copy), l_FFlagLuaAppBadgeDetailsEnabled_0 (copy), l_SduiLoadTimer_0 (copy), l_fetchBadgeDetailsPage_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v14 (copy)
    local v19 = v15 and v15.actionParams or nil;
    if v19 == nil then
        v17.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.OpenBadgeDetails, 
            message = "Missing actionParams"
        }, v17.appPage);
        return;
    else
        assert(v19, "actionParams must exist");
        if v19.badgeId == nil then
            v17.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.OpenBadgeDetails, 
                message = "Missing actionParam: badgeId"
            }, v17.appPage);
            return;
        else
            if l_FFlagLuaAppBadgeDetailsLogExposure_0 then
                l_IXPService_0:LogFlagLinkedUserLayerExposure(l_FStringLuaAppBadgeDetailsIxpLayer_0);
            end;
            if l_FFlagLuaAppBadgeDetailsEnabled_0 then
                local v20 = l_SduiLoadTimer_0.createLoadTimer("BadgeDetails");
                v20.start("navigate");
                l_fetchBadgeDetailsPage_0(v19.badgeId, v20);
                v17.dependencies.dispatch(l_NavigateDown_0({
                    name = l_AppPage_0.BadgeDetails, 
                    extraProps = {
                        badgeId = v19.badgeId, 
                        pageTimer = v20
                    }
                }));
                return;
            else
                local v21 = ("%*/%*"):format(v14, v19.badgeId);
                v17.dependencies.dispatch(l_NavigateDown_0({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = v21, 
                    extraProps = {
                        title = v19.titleText, 
                        transitionAnimation = "SlideInFromRight"
                    }
                }));
                return;
            end;
        end;
    end;
end;