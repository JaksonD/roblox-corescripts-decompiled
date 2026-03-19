local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_View_0 = v3.View;
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_InputSize_0 = v3.Enums.InputSize;
local v9 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v10 = require(l_script_FirstAncestor_0.Contexts.useGroupsWrapperContext);
local v11 = require(l_script_FirstAncestor_0.Hooks.useGroupsAnalytics);
local v12 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v13 = require(script.Parent.SearchBarWrapper);
return function(v14) --[[ Line: 26 ]] --[[ Name: GroupsListToolbar ]]
    -- upvalues: v10 (copy), v11 (copy), l_useLocalization_0 (copy), v9 (copy), v2 (copy), v12 (copy), l_View_0 (copy), v13 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v15 = v10();
    local v16 = v11();
    local v17 = l_useLocalization_0({
        searchPlaceholder = v9.LabelSearchMyGroups, 
        createGroup = v9.ActionCreateGroup
    });
    local v18 = v14.searchPlaceholder or v17.searchPlaceholder;
    local v19 = v2.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: v16 (copy), v12 (ref), v15 (copy)
        v16.fireAnalyticsEvent(v12.GroupsListCreateGroupClicked);
        v15.navigateTo.createGroup();
    end, {
        v15.navigateTo.createGroup, 
        v16
    });
    return v2.createElement(l_View_0, {
        LayoutOrder = v14.layoutOrder, 
        tag = "col size-full-0 auto-y align-x-left gap-medium"
    }, {
        Search = v2.createElement(v13, {
            LayoutOrder = 1, 
            placeholderText = v18, 
            onTextChanged = v14.onSearchTextChanged
        }), 
        CreateGroupButton = v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "col", 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Button = v2.createElement(l_Button_0, {
                text = v17.createGroup, 
                variant = l_ButtonVariant_0.Standard, 
                size = l_InputSize_0.Medium, 
                width = UDim.new(1, 0), 
                isDisabled = v14.canCreateGroup == false, 
                onActivated = v19
            })
        })
    });
end;