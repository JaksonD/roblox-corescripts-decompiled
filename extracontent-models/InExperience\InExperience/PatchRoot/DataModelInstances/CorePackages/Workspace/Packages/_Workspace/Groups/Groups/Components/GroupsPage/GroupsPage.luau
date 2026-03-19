local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useEffectOnce_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnce;
local v4 = require(l_Parent_0.Foundation);
local l_View_0 = v4.View;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local v8 = require(l_script_FirstAncestor_0.Components.GroupsList);
local v9 = require(l_script_FirstAncestor_0.Contexts.useGroupsWrapperContext);
local l_useGroupsListData_0 = require(l_script_FirstAncestor_0.Hooks).useGroupsListData;
local v11 = require(l_script_FirstAncestor_0.Hooks.useGroupsAnalytics);
local v12 = require(l_script_FirstAncestor_0.Analytics.EventNames);
return function(_) --[[ Line: 25 ]] --[[ Name: GroupsPage ]]
    -- upvalues: v9 (copy), l_useTokens_0 (copy), l_useGroupsListData_0 (copy), v11 (copy), l_useEffectOnce_0 (copy), v12 (copy), v2 (copy), l_FullscreenPageWithSafeArea_0 (copy), l_View_0 (copy), v8 (copy)
    local v14 = v9();
    local v15 = l_useTokens_0();
    local v16 = l_useGroupsListData_0(v14.userId);
    local v17 = v11();
    l_useEffectOnce_0(function() --[[ Line: 32 ]]
        -- upvalues: v17 (copy), v12 (ref)
        v17.fireAnalyticsEvent(v12.GroupsListPageExposure);
    end, not v16.isLoading and not v16.loadFailure);
    return v2.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v15.Color.Surface.Surface_0.Color3, 
        BackgroundTransparency = v15.Color.Surface.Surface_0.Transparency
    }, {
        GroupsPageContent = v2.createElement(l_View_0, {
            tag = "col size-full-full padding-x-xlarge padding-y-xxlarge"
        }, {
            Content = v2.createElement(v8, {
                layoutOrder = 1, 
                groupsList = v16.groupsList, 
                canCreateGroup = v16.canCreateGroup, 
                isLoading = v16.isLoading, 
                loadFailure = v16.loadFailure
            })
        })
    });
end;