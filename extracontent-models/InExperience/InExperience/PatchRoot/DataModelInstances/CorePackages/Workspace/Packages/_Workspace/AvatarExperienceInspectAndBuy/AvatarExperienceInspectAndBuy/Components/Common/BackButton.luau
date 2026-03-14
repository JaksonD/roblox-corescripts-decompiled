local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_FFlagAXUseNewChevronIcon_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXUseNewChevronIcon;
return function(v5) --[[ Line: 21 ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v2 (copy), l_FFlagAXUseNewChevronIcon_0 (copy)
    local v6 = l_useTokens_0();
    return v1.createElement(v2.IconButton, {
        icon = l_FFlagAXUseNewChevronIcon_0 and "chevron-large-left" or "icons/actions/cycleLeft", 
        Size = v5.Size or UDim2.new(0, v6.Size.Size_1000, 1, 0), 
        Position = v5.Position, 
        LayoutOrder = 1, 
        onActivated = v5.onBackButtonClick or function() --[[ Line: 30 ]]

        end
    });
end;