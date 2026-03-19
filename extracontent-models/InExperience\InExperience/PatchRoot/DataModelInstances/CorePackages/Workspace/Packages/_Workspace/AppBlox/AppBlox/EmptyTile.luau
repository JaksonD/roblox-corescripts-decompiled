local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_View_0 = v2.View;
return v3.memo(function(v5) --[[ Line: 19 ]] --[[ Name: EmptyTile ]]
    -- upvalues: v3 (copy), l_View_0 (copy), v1 (copy)
    return v3.createElement(l_View_0, {
        LayoutOrder = v5.layoutOrder, 
        ZIndex = v5.ZIndex, 
        tag = "size-full"
    }, v1.Dictionary.union(v5.children or {}, {
        Content = v3.createElement(l_View_0, {
            aspectRatio = v5.tileAspectRatio, 
            Size = v5.size, 
            tag = "bg-surface-100 padding-y-medium padding-x-small radius-medium"
        }, {
            ContentOverlay = v5.contentOverlayComponent
        })
    }));
end);