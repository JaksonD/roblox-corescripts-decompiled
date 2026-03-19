local l_CorePackages_0 = game:GetService("CorePackages");
local l_SocialService_0 = game:GetService("SocialService");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local v3 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService):IsContentSharingAllowed();
local v4 = require(l_CorePackages_0.Packages.PolicyProvider).GetPolicyImplementations.MemStorageService("app-policy");
local v5 = game:DefineFastFlag("DifferentiateSharingBaseOnPlatform", false);
local v6 = false;
if v5 then
    local v7 = v4.read();
    v6 = v7 and v7.EnableShareCaptureCTA and v7.EligibleForCapturesFeature or false;
end;
l_SocialService_0.OpenShareSheetWithLink:Connect(function(v8) --[[ Line: 21 ]]
    -- upvalues: l_default_0 (copy), v5 (copy), v6 (ref), v3 (copy)
    if not l_default_0 then
        return;
    else
        assert(l_default_0 ~= nil, "ExternalContentSharingProtocol is required");
        if v5 then
            if not v6 then
                l_default_0:setClipboardText({
                    context = "PromptLinkSharing", 
                    text = v8
                });
                return;
            end;
        elseif not v3 then
            l_default_0:setClipboardText({
                context = "PromptLinkSharing", 
                text = v8
            });
            return;
        end;
        l_default_0:shareUrl({
            context = "PromptLinkSharing", 
            url = v8
        });
        return;
    end;
end);