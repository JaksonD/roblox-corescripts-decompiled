local l_Parent_0 = script:FindFirstAncestor("UserList").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Enums_0 = v2.Enums;
local l_View_0 = v2.View;
local l_Button_0 = v2.Button;
local l_InputSize_0 = l_Enums_0.InputSize;
return function(v8) --[[ Line: 19 ]] --[[ Name: UserListFooter ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), l_View_0 (copy), l_Button_0 (copy), l_InputSize_0 (copy), l_Enums_0 (copy)
    local v9 = l_useLocalization_0({
        showMore = "Feature.Friends.Action.ShowMore"
    });
    return v1.createElement(l_View_0, {
        tag = "size-full-0 auto-y padding-top-medium padding-bottom-medium", 
        LayoutOrder = v8.layoutOrder
    }, {
        ShowMoreButton = if v8.hasMore and v8.onLoadMore then v1.createElement(l_Button_0, {
            size = l_InputSize_0.Small, 
            onActivated = v8.onLoadMore, 
            text = v9.showMore, 
            fillBehavior = l_Enums_0.FillBehavior.Fill
        }) else nil
    });
end;