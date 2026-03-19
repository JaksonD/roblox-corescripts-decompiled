local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.SduiCoreSystem);
local l_SduiActionType_0 = v2.SduiActionType;
local l_SduiErrorType_0 = v2.SduiErrors.SduiErrorType;
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_getSduiPageEntrySnackbarStore_0 = require(l_Parent_0.SduiSharedUtilities).getSduiPageEntrySnackbarStore;
local l_UserInputService_0 = game:GetService("UserInputService");
local function v17(v8, v9, v10, v11) --[[ Line: 23 ]] --[[ Name: handleGenericShare ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), l_default_0 (copy), l_UserInputService_0 (copy), l_getSduiPageEntrySnackbarStore_0 (copy), v1 (copy)
    local v12 = v9 and v9.url;
    local v13 = v9 and v9.shareUrlContext;
    if v12 == nil then
        v11.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.Share, 
            message = ("Missing url in shareLinkData for %* share type"):format(v8)
        }, v11.appPage);
        return;
    elseif v13 == nil then
        v11.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.Share, 
            message = ("Missing shareUrlContext in shareLinkData for %* share type"):format(v8)
        }, v11.appPage);
        return;
    else
        l_default_0:shareUrl({
            context = v13, 
            url = v12
        });
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v15 = true;
        if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
            v15 = true;
            if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
                v15 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
            end;
        end;
        if v15 then
            if v10 == nil then
                v11.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                    name = l_SduiActionType_0.Share, 
                    message = "Missing entryPointKey in SduiShareAction"
                }, v11.appPage);
                return;
            else
                local v16 = v11.dependencies.localization:Format("Feature.GameDetails.Toast.LinkCopied");
                l_getSduiPageEntrySnackbarStore_0().show(v10, {
                    title = v16, 
                    icon = v1.Enums.IconName.CircleCheck
                });
            end;
        end;
        return;
    end;
end;
return function(v18, _, v20) --[[ Line: 77 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_SduiActionType_0 (copy), v17 (copy)
    local v21 = v18 and v18.actionParams or nil;
    if v21 == nil then
        v20.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = l_SduiActionType_0.Share, 
            message = "Missing actionParams"
        }, v20.appPage);
        return;
    else
        local l_shareLinkType_0 = v21.shareLinkType;
        local v23 = v21.shareLinkData or {};
        local v24 = v21.entryPointKey or nil;
        v17(l_shareLinkType_0, v23, v24, v20);
        return;
    end;
end;