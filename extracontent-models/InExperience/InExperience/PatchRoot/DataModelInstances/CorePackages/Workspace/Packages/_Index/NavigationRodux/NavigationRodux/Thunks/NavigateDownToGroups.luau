local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GetFFlagUseCommunitiesTranslation_0 = require(l_Parent_0.SharedFlags).GetFFlagUseCommunitiesTranslation;
local v3 = require(l_script_FirstAncestor_0.Thunks.NavigateDown);
local v4 = require(l_Parent_0.RobloxAppEnums);
local v5 = require(l_Parent_0.UrlBuilder);
local v6 = require(l_Parent_0.t);
local l_AppPage_0 = v4.AppPage;
local l_UrlBuilder_0 = v5.UrlBuilder;
return function(v9) --[[ Line: 14 ]]
    -- upvalues: v6 (copy), v3 (copy), l_AppPage_0 (copy), l_UrlBuilder_0 (copy), l_GetFFlagUseCommunitiesTranslation_0 (copy)
    assert(v6.callback(v9) or v6.none(v9), "");
    return v3({
        name = l_AppPage_0.GenericWebPage, 
        detail = l_UrlBuilder_0.static.groups(), 
        extraProps = {
            titleKey = l_GetFFlagUseCommunitiesTranslation_0() and "CommonUI.Features.Label.Groups" or "CommonUI.Features.Label.sGroups", 
            onClose = v9
        }
    });
end;