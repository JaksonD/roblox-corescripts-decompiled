local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.HttpRequest);
local v6 = require(l_Parent_0.Promise);
local v7 = require(l_Parent_0.SduiCoreSystem);
local v8 = require(l_Parent_0.UrlBuilder);
local v9 = require(l_Parent_0.SharedFlags);
local l_SduiActionType_0 = v7.SduiActionType;
local l_SduiErrorType_0 = v7.SduiErrors.SduiErrorType;
local l_getSduiPageEntrySnackbarStore_0 = require(l_Parent_0.SduiSharedUtilities).getSduiPageEntrySnackbarStore;
local l_UrlBase_0 = v8.UrlBase;
local l_UrlBuilder_0 = v8.UrlBuilder;
local l_FFlagSduiExperienceDetailsSupport_0 = v9.FFlagSduiExperienceDetailsSupport;
local l_FFlagSduiEventDetailsSupport_0 = v9.FFlagSduiEventDetailsSupport;
local function v26(v17, v18, v19, v20) --[[ Line: 34 ]] --[[ Name: handleGenericShare ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_default_0 (copy), l_UserInputService_0 (copy), l_getSduiPageEntrySnackbarStore_0 (copy), v4 (copy)
    local v21 = v18 and v18.url;
    local v22 = v18 and v18.shareUrlContext;
    if v21 == nil then
        v20.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.Share, 
            message = ("Missing url in shareLinkData for %* share type"):format(v17)
        }, v20.appPage);
        return;
    elseif v22 == nil then
        v20.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.Share, 
            message = ("Missing shareUrlContext in shareLinkData for %* share type"):format(v17)
        }, v20.appPage);
        return;
    else
        l_default_0:shareUrl({
            context = v22, 
            url = v21
        });
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v24 = true;
        if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
            v24 = true;
            if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
                v24 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
            end;
        end;
        if v24 then
            if v19 == nil then
                v20.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                    name = l_SduiActionType_0.Share, 
                    message = "Missing entryPointKey in SduiShareAction"
                }, v20.appPage);
                return;
            else
                local v25 = v20.dependencies.localization:Format("Feature.GameDetails.Toast.LinkCopied");
                l_getSduiPageEntrySnackbarStore_0().show(v19, {
                    title = v25, 
                    icon = v4.Enums.IconName.CircleCheck
                });
            end;
        end;
        return;
    end;
end;
local function v36(v27, v28) --[[ Line: 88 ]] --[[ Name: fetchShareLinkId ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_UrlBase_0 (copy), l_HttpService_0 (copy), v5 (copy)
    local v29 = l_UrlBuilder_0.new({
        base = l_UrlBase_0.APIS, 
        path = "sharelinks/v1/get-or-create-link"
    })();
    local v30 = l_HttpService_0:JSONEncode({
        linkType = v27, 
        data = l_HttpService_0:JSONEncode(v28)
    });
    return v5.config({
        requestFunction = function(v31, v32, v33) --[[ Line: 100 ]] --[[ Name: requestFunction ]]
            -- upvalues: v5 (ref)
            return v5.requestFunctions.RequestInternal(v31, v32, v33);
        end
    })(v29, "POST", {
        postBody = v30
    }):andThen(function(v34) --[[ Line: 105 ]]
        local v35 = v34.responseBody or v34.result;
        if v35 and v35.linkId then
            return v35.linkId;
        else
            error("Share link response missing linkId");
            return;
        end;
    end);
end;
return function(v37, _, v39) --[[ Line: 115 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), l_FFlagSduiEventDetailsSupport_0 (copy), v6 (copy), v36 (copy), l_UrlBuilder_0 (copy), l_default_0 (copy), l_UserInputService_0 (copy), l_getSduiPageEntrySnackbarStore_0 (copy), v4 (copy), v26 (copy)
    local v40 = v37 and v37.actionParams or nil;
    if v40 == nil then
        v39.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.Share, 
            message = "Missing actionParams"
        }, v39.appPage);
        return;
    elseif l_FFlagSduiExperienceDetailsSupport_0 or l_FFlagSduiEventDetailsSupport_0 then
        local v41 = v40.shareLinkData or {};
        local v42 = v40.entryPointKey or nil;
        local v43 = v41.shareUrlContext or "";
        local v44 = v41.linkType ~= nil;
        local v45 = nil;
        if v44 then
            local l_linkType_0 = v41.linkType;
            local l_linkData_0 = v41.linkData;
            v45 = if l_linkData_0 == nil then v6.reject((("Missing linkData in ShareLinkFetchData (linkType=%*)"):format(l_linkType_0))) else v36(l_linkType_0, l_linkData_0):andThen(function(v48) --[[ Line: 143 ]]
                -- upvalues: l_UrlBuilder_0 (ref), l_linkType_0 (copy)
                local v49 = tostring(DateTime.now().UnixTimestampMillis);
                return l_UrlBuilder_0.sharelinks.shortUrl({
                    linkId = v48, 
                    type = l_linkType_0, 
                    stamp = v49
                });
            end);
        else
            local l_url_0 = v41.url;
            v45 = if l_url_0 == nil then v6.reject("Missing url in shareLinkData") else v6.resolve(l_url_0);
        end;
        v45:andThen(function(v51) --[[ Line: 162 ]]
            -- upvalues: l_default_0 (ref), v43 (copy), l_UserInputService_0 (ref), v42 (copy), v39 (copy), l_getSduiPageEntrySnackbarStore_0 (ref), v4 (ref)
            l_default_0:shareUrl({
                context = v43, 
                url = v51
            });
            local l_l_UserInputService_0_Platform_1 = l_UserInputService_0:GetPlatform();
            local v53 = true;
            if l_l_UserInputService_0_Platform_1 ~= Enum.Platform.Windows then
                v53 = true;
                if l_l_UserInputService_0_Platform_1 ~= Enum.Platform.OSX then
                    v53 = l_l_UserInputService_0_Platform_1 == Enum.Platform.UWP;
                end;
            end;
            if v53 and v42 then
                local v54 = v39.dependencies.localization:Format("Feature.GameDetails.Toast.LinkCopied");
                l_getSduiPageEntrySnackbarStore_0().show(v42, {
                    title = v54, 
                    icon = v4.Enums.IconName.CircleCheck
                });
            end;
        end):catch(function(v55) --[[ Line: 182 ]]
            -- upvalues: v39 (copy), l_SduiErrorType_0 (ref), l_SduiActionType_0 (ref), v42 (copy), l_getSduiPageEntrySnackbarStore_0 (ref), v4 (ref)
            v39.dependencies.logger.reportError(l_SduiErrorType_0.FailedToExecuteAction, {
                name = l_SduiActionType_0.Share, 
                message = tostring(v55)
            }, v39.appPage);
            if v42 then
                local v56 = v39.dependencies.localization:Format("Feature.Toast.NetworkingError.SomethingIsWrong");
                l_getSduiPageEntrySnackbarStore_0().show(v42, {
                    title = v56, 
                    icon = v4.Enums.IconName.TriangleExclamation
                });
            end;
        end);
        return;
    else
        local l_shareLinkType_0 = v40.shareLinkType;
        local v58 = v40.shareLinkData or {};
        local v59 = v40.entryPointKey or nil;
        v26(l_shareLinkType_0, v58, v59, v39);
        return;
    end;
end;