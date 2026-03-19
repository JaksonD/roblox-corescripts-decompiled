local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_VerticalUserListSection_0 = require(l_script_FirstAncestor_0.Components.VerticalUserList).VerticalUserListSection;
local l_HorizontalUserList_0 = require(l_script_FirstAncestor_0.Components.HorizontalUserList).HorizontalUserList;
local v5 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Common.Types);
return v2.memo(function(v7) --[[ Line: 36 ]] --[[ Name: UserListLayoutAdaptor ]]
    -- upvalues: v5 (copy), l_VerticalUserListSection_0 (copy), l_HorizontalUserList_0 (copy), v2 (copy)
    local v8 = if v7.layoutMode == v5.LayoutMode.Vertical then l_VerticalUserListSection_0 else l_HorizontalUserList_0;
    local v9 = table.clone(v7);
    v9.layoutMode = nil;
    return v2.createElement(v8, v9);
end);