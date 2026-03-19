local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.UserListPeekView);
local l_AppFormFactor_0 = require(l_script_FirstAncestor_0.Common.Enums).AppFormFactor;
local l_View_0 = require(l_Parent_0.Foundation).View;
local v6 = require(l_script_FirstAncestor_0.Hooks.useListFormFactor);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v8 = {
    position = UDim2.fromScale(0, 0), 
    size = UDim2.fromScale(1, 1), 
    anchorPoint = Vector2.new(0, 0)
};
return function(v9) --[[ Line: 28 ]] --[[ Name: UserListViewAdaptor ]]
    -- upvalues: v6 (copy), l_AppFormFactor_0 (copy), v2 (copy), v8 (copy), l_View_0 (copy), v3 (copy)
    local v10 = v6();
    local v11 = v10.formFactor == l_AppFormFactor_0.Compact;
    local v12 = not v11 and v9.wideModePeekViewLayout ~= nil;
    local v13 = v2.useMemo(function() --[[ Line: 32 ]]
        -- upvalues: v12 (copy), v9 (copy), v8 (ref)
        if v12 then
            return v9.wideModePeekViewLayout;
        else
            return v8;
        end;
    end, {
        v10.formFactor, 
        v9.wideModePeekViewLayout
    });
    if not v11 and not v12 then
        return nil;
    else
        return v2.createElement(l_View_0, {
            Size = v13.size, 
            Position = v13.position, 
            AnchorPoint = v13.anchorPoint
        }, {
            UserListPeekView = v2.createElement(v3, {
                users = v9.users, 
                title = v9.title, 
                onLoadMore = v9.onLoadMore, 
                onUserSelected = v9.onUserSelected, 
                hasMore = v9.hasMore
            })
        });
    end;
end;