local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Tile.useTile);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Components.View);
return function(v6) --[[ Line: 17 ]] --[[ Name: TileActions ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy)
    local v7 = v3();
    return v2.createElement(v5, {
        Visible = v6.Visible, 
        LayoutOrder = 3, 
        tag = "auto-y size-full-0 shrink", 
        testId = ("%*--actions"):format(v7.testId)
    }, v6.children);
end;