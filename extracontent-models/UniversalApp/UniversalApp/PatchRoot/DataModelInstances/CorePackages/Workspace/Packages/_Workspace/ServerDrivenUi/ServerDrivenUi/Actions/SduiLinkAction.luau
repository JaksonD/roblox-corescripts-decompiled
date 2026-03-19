local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local v4 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v4.SduiActionType;
local l_SduiErrorType_0 = v4.SduiErrors.SduiErrorType;
local l_SduiCounterName_0 = v4.SduiErrors.SduiCounterName;
local function _() --[[ Line: 19 ]] --[[ Name: isWebViewSupported ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy)
    return l_getAppFeaturePolicies_0().getWebViewSupport();
end;
return function(v9, _, v11) --[[ Line: 23 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_UrlBuilder_0 (copy), l_getAppFeaturePolicies_0 (copy), l_AppPage_0 (copy), l_SduiCounterName_0 (copy)
    local v12 = v9 and v9.actionParams or nil;
    if v12 == nil then
        v11.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.Link, 
            message = "Missing actionParams"
        }, v11.appPage);
        return;
    else
        assert(v12, "actionParams must exist");
        local l_url_0 = v12.url;
        if typeof(l_url_0) ~= "string" then
            v11.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = l_SduiActionType_0.Link, 
                message = ("Invalid or missing url: %*"):format(l_url_0), 
                propName = "url"
            }, v11.appPage);
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 50 ]]
                -- upvalues: l_UrlBuilder_0 (ref), l_url_0 (copy)
                return l_UrlBuilder_0.fromString(if string.find(l_url_0, "/") == 1 then l_url_0:gsub("/", "www:", 1) else l_url_0)();
            end);
            local v16 = nil;
            if l_status_0 then
                v16 = l_result_0;
            else
                v16 = l_url_0;
                v11.dependencies.logger.reportError(l_SduiErrorType_0.FailedtoParseUrl, {
                    name = l_url_0, 
                    message = if typeof(l_result_0) == "string" then l_result_0 else "Unknown reason"
                }, v11.appPage);
            end;
            local l_linkingProtocol_0 = v11.dependencies.linkingProtocol;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 65 ]]
                -- upvalues: l_linkingProtocol_0 (copy), v16 (ref), l_getAppFeaturePolicies_0 (ref), v11 (copy), l_AppPage_0 (ref), l_SduiCounterName_0 (ref)
                l_linkingProtocol_0:isURLRegistered(v16):andThen(function(v18) --[[ Line: 66 ]]
                    -- upvalues: l_linkingProtocol_0 (ref), v16 (ref), l_getAppFeaturePolicies_0 (ref), v11 (ref), l_AppPage_0 (ref), l_SduiCounterName_0 (ref)
                    if v18 then
                        l_linkingProtocol_0:detectURL(v16);
                        return;
                    elseif l_getAppFeaturePolicies_0().getWebViewSupport() then
                        v11.dependencies.getNavigation().navigate(l_AppPage_0.GenericWebPage, {
                            detail = v16
                        });
                        return;
                    else
                        v11.dependencies.logger.reportCounter(l_SduiCounterName_0.WebViewNotSupportedForLink, {
                            name = v16
                        });
                        return;
                    end;
                end);
            end);
            if not l_status_1 then
                v11.dependencies.logger.reportError(l_SduiErrorType_0.FailedToOpenLink, {
                    name = l_url_0, 
                    message = if typeof(l_result_1) == "string" then l_result_1 else "Unknown reason"
                }, v11.appPage);
            end;
            return;
        end;
    end;
end;