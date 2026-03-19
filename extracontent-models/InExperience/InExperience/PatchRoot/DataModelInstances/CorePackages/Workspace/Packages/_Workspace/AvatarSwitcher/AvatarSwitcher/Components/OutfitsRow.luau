local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Components.OutfitTile);
local _ = require(l_script_FirstAncestor_0.types);
return v2.memo(function(v6) --[[ Line: 22 ]] --[[ Name: OutfitsRow ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    local v7 = {};
    for v8, v9 in v6.outfits do
        v7["Outfit" .. (v9.id or v8)] = v2.createElement(v4, {
            outfitInfo = v9, 
            disabled = v6.disabled, 
            LayoutOrder = v8, 
            gridPosition = {
                row = v6.rowNumber, 
                column = v8
            }
        });
    end;
    for v10 = #v6.outfits + 1, v6.desiredItemsCount do
        v7["Filler" .. v10] = v2.createElement(v3.View, {
            tag = "size-full-0", 
            LayoutOrder = v10
        });
    end;
    return v2.createElement(v3.View, {
        tag = "row size-full-0 auto-y gap-medium flex-x-fill padding-bottom-large"
    }, v7);
end);