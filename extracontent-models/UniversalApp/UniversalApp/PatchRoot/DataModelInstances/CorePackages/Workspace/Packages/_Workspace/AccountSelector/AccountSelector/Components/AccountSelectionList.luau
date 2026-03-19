local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_Dash_0 = v1.Dash;
local l_ScrollingListTable_0 = l_UIBlox_0.App.Table.ScrollingListTable;
local l_ListTable_0 = l_UIBlox_0.App.Table.ListTable;
local v7 = require(script.Parent.AccountSelection);
local v8 = game:DefineFastFlag("DisableAccountSelectionListScrollingRelease2", false);
return function(v9) --[[ Line: 22 ]]
    -- upvalues: l_React_0 (copy), v7 (copy), v8 (copy), l_ScrollingListTable_0 (copy), l_Dash_0 (copy), l_ListTable_0 (copy)
    local function v11(v10) --[[ Line: 23 ]] --[[ Name: createAccountSelectionCell ]]
        -- upvalues: l_React_0 (ref), v7 (ref), v9 (copy)
        return l_React_0.createElement(v7, {
            user = v10, 
            onAccountSelection = v9.onAccountSelection, 
            isDisabled = v9.isDisabled
        });
    end;
    if not v8 or v9.isScrollable then
        return l_React_0.createElement(l_ScrollingListTable_0, {
            size = UDim2.new(1, 0, 0, v9.height), 
            cells = l_Dash_0.map(v9.users, v11)
        });
    else
        return l_React_0.createElement(l_ListTable_0, {
            size = UDim2.new(1, 0, 0, v9.height), 
            showDividers = false, 
            cells = l_Dash_0.map(v9.users, v11)
        });
    end;
end;