local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.View);
local v4 = require(l_script_FirstAncestor_0.Components.Tile.useTile);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v6 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v7 = {
    LayoutOrder = 2
};
return function(v8) --[[ Line: 20 ]] --[[ Name: TileContent ]]
    -- upvalues: v6 (copy), v7 (copy), v5 (copy), v4 (copy), v2 (copy), v3 (copy)
    local v9 = v6(v8, v7);
    local v10 = v5();
    local v11 = v4();
    return v2.createElement(v3, {
        tag = "size-full col gap-small align-y-top", 
        flexItem = {
            FlexMode = Enum.UIFlexMode.Shrink
        }, 
        padding = if v11.isContained then v10.Padding.Small else nil, 
        LayoutOrder = v9.LayoutOrder, 
        testId = ("%*--content"):format(v11.testId)
    }, v9.children);
end;