local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local v6 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v7 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v11 = require(l_Modules_0.AvatarExperience.Common.Hooks.useSendCounter);
local v12 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useCallback_0 = require(l_CorePackages_0.Packages.React).useCallback;
local v14 = require(l_Modules_0.AvatarExperience.Common.Hooks.useSharePolicy);
local v15 = l_Images_0["icons/actions/share"];
local v16 = l_Images_0["icons/menu/link"];
return function(v17, v18, v19, v20, v21) --[[ Line: 26 ]] --[[ Name: useShareButton ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), v11 (copy), v12 (copy), v8 (copy), l_useCallback_0 (copy), l_default_0 (copy), v4 (copy), v6 (copy), v7 (copy), v3 (copy), v14 (copy), v15 (copy), v16 (copy)
    local v22 = l_useDispatch_0();
    local v23 = l_useLocalization_0({
        copyLinkAction = "Feature.Catalog.Action.CopyLink", 
        shareAction = "Feature.SocialShare.Action.Share", 
        shareViaAction = "Feature.Catalog.Action.ShareVia"
    });
    local v24 = v11();
    local v25 = v12(v8);
    local v27 = l_useCallback_0(function(v26) --[[ Line: 46 ]]
        -- upvalues: v25 (copy), v17 (copy), v18 (copy), l_default_0 (ref)
        v25.clickShareItemButton(v17, v18);
        l_default_0:shareUrl({
            context = "MoreMenu", 
            url = v26
        });
    end, {
        v25, 
        v17, 
        v18, 
        l_default_0
    });
    local v31 = l_useCallback_0(function(v28) --[[ Line: 54 ]]
        -- upvalues: v17 (copy), v18 (copy), v22 (copy), v4 (ref), v6 (ref), v7 (ref), v24 (copy), v3 (ref), v27 (copy)
        if not v17 or not v18 then
            return;
        else
            v22(v4.GetOrGenerateShortShareLink(v17, v18)):andThen(function(v29) --[[ Line: 59 ]]
                -- upvalues: v28 (copy), v22 (ref), v6 (ref), v7 (ref), v24 (ref), v3 (ref), v27 (ref)
                if v29 and v29.responseBody and v29.responseBody.shortUrl then
                    if v28 then
                        v22(v6({
                            toastMessage = "Feature.Catalog.Toast.LinkCopied", 
                            toastType = v7.SuccessConfirmation
                        }));
                    end;
                    v24(v3.Counter.GetOrGenerateShortShareLink.HookSuccess);
                    v27(v29.responseBody.shortUrl);
                    return;
                else
                    v22(v6({
                        toastMessage = "Feature.Catalog.Response.GenericError", 
                        toastType = v7.InformationMessage
                    }));
                    v24(v3.Counter.GetOrGenerateShortShareLink.HookInvalid);
                    return;
                end;
            end):catch(function(_) --[[ Line: 78 ]]
                -- upvalues: v22 (ref), v6 (ref), v7 (ref), v24 (ref), v3 (ref)
                v22(v6({
                    toastMessage = "Feature.Catalog.Response.GenericError", 
                    toastType = v7.NetworkingError
                }));
                v24(v3.Counter.GetOrGenerateShortShareLink.HookFailure);
            end);
            return;
        end;
    end, {
        v17, 
        v18, 
        v24, 
        v6, 
        v22, 
        v27
    });
    local v33 = l_useCallback_0(function(v32) --[[ Line: 87 ]]
        -- upvalues: v20 (copy), v31 (copy)
        if v20 then
            v20(v32);
        end;
        v31(false);
    end, {
        v20, 
        v31
    });
    local v35 = l_useCallback_0(function(v34) --[[ Line: 94 ]]
        -- upvalues: v20 (copy), v31 (copy)
        if v20 then
            v20(v34);
        end;
        v31(true);
    end, {
        v20, 
        v31
    });
    local v36 = v14();
    local v37 = v36 and v36.supportShareButton or false;
    local v38 = v36 and v36.supportCopyLinkButton or false;
    if v37 then
        return {
            icon = v15, 
            text = if v19 then v23.shareViaAction else v23.shareAction, 
            onActivated = if type(v21) == "function" then v21 else v33
        };
    elseif v38 then
        return {
            icon = v16, 
            onActivated = if type(v21) == "function" then v21 else v35, 
            text = v23.copyLinkAction
        };
    else
        return nil;
    end;
end;