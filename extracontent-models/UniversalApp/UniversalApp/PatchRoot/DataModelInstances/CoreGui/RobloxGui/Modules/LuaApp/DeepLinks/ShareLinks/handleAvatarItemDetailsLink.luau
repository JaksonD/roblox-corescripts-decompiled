local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.LuaApp.DeepLinks.ShareLinks.ShareLinkTypes);
local l_getDeepValue_0 = require(script.Parent.dependencies).SocialLibraries.Dictionary.getDeepValue;
local v8 = require(script.Parent.LinkStatus);
local _ = require(script.Parent.Types);
local v10 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLookDetailsDeepLink);
return function(v11, v12) --[[ Line: 19 ]]
    -- upvalues: l_getDeepValue_0 (copy), l_AvatarScreen_0 (copy), v5 (copy), v2 (copy), v8 (copy), v6 (copy), v10 (copy)
    local l_shareLinksAnalytics_0 = v12.analyticsImpls.shareLinksAnalytics;
    local v14 = l_getDeepValue_0(v11, "responseBody.avatarItemDetailsData") or {};
    local l_itemType_0 = v14.itemType;
    if not l_itemType_0 or not v14.itemId or v14.itemId == "" or v14.itemId == "0" then
        return {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog
                }
            }
        };
    else
        local v16 = tostring(v14.itemId);
        local v17 = nil;
        for _, v19 in v5.ItemType do
            if string.lower(l_itemType_0) == string.lower(v19) then
                v17 = v19;
                break;
            end;
        end;
        local v20 = v2.Dictionary.join(v11, {
            responseBody = v2.None, 
            type = v2.None, 
            linkStatus = v8.Valid, 
            linkId = v16, 
            linkType = v6.AvatarItemDetails .. v17
        });
        l_shareLinksAnalytics_0.resolveLink(v20);
        local v21 = v17 .. v16;
        return {
            {
                {
                    name = l_AvatarScreen_0.AvatarExperienceLandingPage
                }, 
                {
                    name = l_AvatarScreen_0.Catalog
                }, 
                {
                    name = if v10 and v17 == v5.ItemType.Look then l_AvatarScreen_0.LookDetails else l_AvatarScreen_0.ItemDetails, 
                    detail = v21, 
                    extraProps = {
                        itemId = v16, 
                        itemType = v17, 
                        mountAsFullView = true, 
                        mountAnimation = false
                    }
                }
            }
        };
    end;
end;