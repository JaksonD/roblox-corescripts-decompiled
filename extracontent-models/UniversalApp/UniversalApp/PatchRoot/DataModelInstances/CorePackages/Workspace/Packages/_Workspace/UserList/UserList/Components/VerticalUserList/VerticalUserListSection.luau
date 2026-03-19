local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Common.Enums);
local l_View_0 = require(l_Parent_0.Foundation).View;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v6 = require(l_script_FirstAncestor_0.Components.UserListHeader);
local v7 = require(l_script_FirstAncestor_0.Components.UserListFooter);
local v8 = require(script.Parent.VerticalUserList);
return function(v9) --[[ Line: 37 ]] --[[ Name: VerticalUserListSection ]]
    -- upvalues: v2 (copy), l_View_0 (copy), v6 (copy), v7 (copy), v8 (copy)
    local v10 = if v9.header then v2.createElement(l_View_0, {
        tag = {
            ["size-full-0 auto-y"] = true, 
            ["padding-bottom-large"] = v9.isScrollEnabled
        }, 
        LayoutOrder = not v9.isScrollEnabled and 1 or nil
    }, {
        HeaderContent = v2.createElement(v6, v9.header)
    }) else nil;
    local v11 = if v9.hasMore and v9.onLoadMore then v2.createElement(l_View_0, {
        tag = {
            ["size-full-0 auto-y"] = true, 
            ["padding-top-large"] = v9.isScrollEnabled
        }, 
        LayoutOrder = not v9.isScrollEnabled and 3 or nil
    }, {
        FooterContent = v2.createElement(v7, {
            hasMore = v9.hasMore, 
            onLoadMore = v9.onLoadMore
        })
    }) else nil;
    if #v9.entities == 0 then
        return nil;
    elseif v9.isScrollEnabled then
        return v2.createElement(v8, {
            entities = v9.entities, 
            initialRowCount = v9.initialRowCount, 
            onRowSelected = v9.onRowSelectedOverride, 
            ListHeaderComponent = v10, 
            ListFooterComponent = v11, 
            renderRow = v9.renderRow, 
            layoutOrder = v9.layoutOrder, 
            configs = v9.configs, 
            isScrollEnabled = true
        });
    else
        return v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-large", 
            LayoutOrder = v9.layoutOrder
        }, {
            Header = v10, 
            List = v2.createElement(v8, {
                entities = v9.entities, 
                initialRowCount = v9.initialRowCount, 
                onRowSelected = v9.onRowSelectedOverride, 
                renderRow = v9.renderRow, 
                layoutOrder = 2, 
                configs = v9.configs, 
                isScrollEnabled = false
            }), 
            Footer = v11
        });
    end;
end;