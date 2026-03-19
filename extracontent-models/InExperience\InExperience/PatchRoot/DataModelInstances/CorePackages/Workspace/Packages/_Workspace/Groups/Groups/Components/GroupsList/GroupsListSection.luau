local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v7 = require(script.Parent.GroupListItem);
return v2.memo(function(v8) --[[ Line: 24 ]] --[[ Name: GroupsListSection ]]
    -- upvalues: v2 (copy), l_Text_0 (copy), l_View_0 (copy), v7 (copy)
    if #v8.groups == 0 then
        return nil;
    else
        local v9 = {};
        local v10 = false;
        if v8.heading and v8.heading ~= "" then
            v9.Heading = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = v8.heading, 
                tag = "content-default text-align-x-left size-full-0 auto-y text-title-large"
            });
        end;
        for v11, v12 in ipairs(v8.groups) do
            local v13 = not v8.visibleIds or v8.visibleIds[v12.id] == true;
            v10 = v10 or v13;
            v9[("Group_%*"):format(v12.id)] = v2.createElement(l_View_0, {
                Visible = v13, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v11 + 1
            }, {
                Item = v2.createElement(v7, {
                    group = v12, 
                    layoutOrder = v11 + 1, 
                    showRank = v8.showRank, 
                    showMemberCount = v8.showMemberCount
                })
            });
        end;
        return v2.createElement(l_View_0, {
            tag = "col gap-small", 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v8.layoutOrder, 
            Visible = v10
        }, v9);
    end;
end);