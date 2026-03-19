local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.LuaApp.Reducers.Navigation);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v4 = require(script.Parent.LinkStatus);
local _ = require(script.Parent.Types);
return function(v6, v7) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), l_AppPage_0 (copy)
    local l_shareLinksAnalytics_0 = v7.analyticsImpls.shareLinksAnalytics;
    local l_code_0 = v6.code;
    local l_type_0 = v6.type;
    l_shareLinksAnalytics_0.resolveLink({
        isViaAppsFlyer = v6.isViaAppsFlyer, 
        linkId = l_code_0, 
        linkStatus = v4.Invalid, 
        linkType = l_type_0
    });
    return {
        {
            {
                name = l_AppPage_0.Home
            }, 
            {
                name = l_AppPage_0.ShareLinkInvalidModal, 
                extraProps = {
                    closeModal = function() --[[ Line: 31 ]] --[[ Name: closeModal ]]
                        -- upvalues: l_shareLinksAnalytics_0 (copy), l_code_0 (copy), v4 (ref), l_type_0 (copy)
                        l_shareLinksAnalytics_0.errorDialogButtonClick({
                            linkId = l_code_0, 
                            linkStatus = v4.Invalid, 
                            linkType = l_type_0
                        });
                    end
                }
            }
        }
    };
end;