local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.CentralOverlay);
local l_SetCentralOverlay_0 = v1.Actions.SetCentralOverlay;
local l_CloseCentralOverlay_0 = v1.Thunks.CloseCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local v5 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v5.SduiActionType;
local l_SduiErrorType_0 = v5.SduiErrors.SduiErrorType;
local v8 = require(l_Parent_0.DiscoveryAnalytics);
local l_sendSocialLinkClickEvent_0 = v8.Events.sendSocialLinkClickEvent;
local l_sendOpenLeavingRobloxModalEvent_0 = v8.Events.sendOpenLeavingRobloxModalEvent;
return function(v11, _, v13, _) --[[ Line: 20 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_sendSocialLinkClickEvent_0 (copy), l_CloseCentralOverlay_0 (copy), l_sendOpenLeavingRobloxModalEvent_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    local v15 = v11 and v11.actionParams or nil;
    if v15 == nil then
        v13.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.OpenSocialLink, 
            message = "Missing actionParams"
        }, v13.appPage);
        return;
    else
        assert(v15, "actionParams must exist");
        local l_socialLinkUrl_0 = v15.socialLinkUrl;
        if typeof(l_socialLinkUrl_0) ~= "string" or l_socialLinkUrl_0 == "" then
            v13.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.OpenSocialLink, 
                message = ("Invalid or missing socialLinkUrl: %*"):format(l_socialLinkUrl_0), 
                propName = "socialLinkUrl"
            }, v13.appPage);
            return;
        else
            local l_dispatch_0 = v13.dependencies.dispatch;
            local l_linkingProtocol_0 = v13.dependencies.linkingProtocol;
            local v19 = {
                assignment_id = tonumber(v15.assignmentId) or 0, 
                assignment_type = v15.assignmentType or "", 
                social_link_type = v15.socialLinkType or "", 
                social_link_display_type = v15.socialLinkDisplayType or ""
            };
            local function v21() --[[ Line: 56 ]]
                -- upvalues: l_sendSocialLinkClickEvent_0 (ref), v19 (copy), l_socialLinkUrl_0 (copy), l_linkingProtocol_0 (copy), v13 (copy), l_SduiErrorType_0 (ref), l_SduiActionType_0 (ref), l_dispatch_0 (copy), l_CloseCentralOverlay_0 (ref)
                l_sendSocialLinkClickEvent_0({
                    assignment_id = v19.assignment_id, 
                    assignment_type = v19.assignment_type, 
                    social_link_type = v19.social_link_type, 
                    social_link_url = l_socialLinkUrl_0, 
                    social_link_display_type = v19.social_link_display_type
                });
                l_linkingProtocol_0:openURL(l_socialLinkUrl_0):catch(function(v20) --[[ Line: 65 ]]
                    -- upvalues: v13 (ref), l_SduiErrorType_0 (ref), l_SduiActionType_0 (ref)
                    v13.dependencies.logger.reportError(l_SduiErrorType_0.FailedToOpenLink, {
                        name = l_SduiActionType_0.OpenSocialLink, 
                        message = if typeof(v20) == "string" then v20 else "Unknown reason"
                    }, v13.appPage);
                end);
                l_dispatch_0(l_CloseCentralOverlay_0());
            end;
            l_sendOpenLeavingRobloxModalEvent_0({
                assignment_id = v19.assignment_id, 
                assignment_type = v19.assignment_type, 
                social_link_type = v19.social_link_type, 
                social_link_display_type = v19.social_link_display_type
            });
            l_dispatch_0(l_SetCentralOverlay_0(l_CentralOverlayType_0.LeaveRobloxAlert, {
                continueFunc = v21
            }));
            return;
        end;
    end;
end;