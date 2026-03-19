local l_script_FirstAncestor_0 = script:FindFirstAncestor("Badges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Navigation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SduiSharedUtilities);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_SduiLoadTimer_0 = v4.SduiLoadTimer;
local l_SduiPageEntryPoint_0 = v4.SduiPageEntryPoint;
local v8 = require(l_script_FirstAncestor_0.BadgesSeeAllPage.fetchBadgesSeeAllPageIfNeeded);
local v9 = require(l_script_FirstAncestor_0.BadgesSeeAllPage.getBadgesSeeAllPageKey);
local function _(v10, v11) --[[ Line: 29 ]] --[[ Name: getFromPropsOrNavigationParams ]]
    return v10[v11] or v10.navigation and v10.navigation.getParam(v11);
end;
return v3.memo(function(v13) --[[ Line: 33 ]] --[[ Name: BadgesSeeAllPage ]]
    -- upvalues: v9 (copy), l_useLocalization_0 (copy), v3 (copy), l_SduiLoadTimer_0 (copy), v8 (copy), l_SduiPageEntryPoint_0 (copy)
    local v14 = v13.universeId or v13.navigation and v13.navigation.getParam("universeId");
    local v15 = v9(v14);
    local v16 = l_useLocalization_0({
        pageTitle = "CommonUI.Features.Label.Badges"
    });
    local v18 = v3.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: v13 (copy), l_SduiLoadTimer_0 (ref)
        local l_v13_0 = v13;
        return l_v13_0.pageTimer or l_v13_0.navigation and l_v13_0.navigation.getParam("pageTimer") or l_SduiLoadTimer_0.createLoadTimer("BadgesSeeAll");
    end, {
        v15
    });
    v3.useEffect(function() --[[ Line: 45 ]]
        -- upvalues: v14 (copy), v8 (ref), v18 (copy)
        if v14 then
            v8(v14, v18);
        end;
    end, {
        v14, 
        v18
    });
    local v20 = v3.useCallback(function() --[[ Line: 51 ]]
        -- upvalues: v14 (copy), l_SduiLoadTimer_0 (ref), v8 (ref)
        if v14 then
            local v19 = l_SduiLoadTimer_0.createLoadTimer("BadgesSeeAll");
            v19.start("refresh");
            v8(v14, v19, true);
        end;
    end, {
        v14
    });
    if v14 == nil then
        return nil;
    else
        return v3.createElement(l_SduiPageEntryPoint_0, {
            appPage = "BadgesSeeAll", 
            configKey = v15, 
            pageTimer = v18, 
            includeNavigationHeaderBar = true, 
            pageTitle = v16.pageTitle, 
            refresh = v20
        });
    end;
end);