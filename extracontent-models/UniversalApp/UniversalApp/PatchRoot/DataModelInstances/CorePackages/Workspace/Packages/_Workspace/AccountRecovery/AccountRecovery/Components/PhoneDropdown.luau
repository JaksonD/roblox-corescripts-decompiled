local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local l_DropdownWithPopover_0 = require(l_Parent_0.AuthCommon).Components.DropdownWithPopover;
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
return function(v6) --[[ Line: 21 ]]
    -- upvalues: v2 (copy), l_View_0 (copy), l_DropdownWithPopover_0 (copy)
    local v10 = v2.useMemo(function() --[[ Line: 22 ]]
        -- upvalues: v6 (copy)
        if v6.phonePrefixList and #v6.phonePrefixList > 0 then
            local v7 = {};
            for v8, v9 in ipairs(v6.phonePrefixList) do
                table.insert(v7, {
                    value = v8, 
                    text = string.format("%s (+%s)", v9.localizedName, v9.prefix or "")
                });
            end;
            return v7;
        else
            return {};
        end;
    end, {
        v6.phonePrefixList
    });
    return v2.createElement(l_View_0, {
        tag = "size-full-0 auto-y col gap-small", 
        LayoutOrder = v6.LayoutOrder
    }, {
        DropdownMenuContainer = v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-small", 
            LayoutOrder = 1, 
            ZIndex = 3
        }, {
            DropdownWithPopover = v2.createElement(l_DropdownWithPopover_0, {
                value = v6.value, 
                onChange = v6.onChange, 
                cellDatas = v10, 
                errorState = false, 
                layoutOrder = 1, 
                topOffset = v6.topOffset
            })
        })
    });
end;