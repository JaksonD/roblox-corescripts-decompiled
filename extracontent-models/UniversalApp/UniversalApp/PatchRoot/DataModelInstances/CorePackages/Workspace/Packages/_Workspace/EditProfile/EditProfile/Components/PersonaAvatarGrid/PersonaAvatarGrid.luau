local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_ScrollView_0 = require(l_Parent_0.Foundation).ScrollView;
local v5 = require(l_script_FirstAncestor_0.Components.PersonaAvatarTile);
return function(v6) --[[ Line: 29 ]] --[[ Name: PersonaAvatarGrid ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), l_ScrollView_0 (copy)
    local v8 = v2.useMemo(function() --[[ Line: 30 ]]
        -- upvalues: v6 (copy)
        local v7 = math.max(math.floor((v6.width - 20 - 10) / 110), 1);
        return (math.floor((v6.width - 20 - (v7 - 1) * 10) / v7));
    end, {
        v6.width
    });
    local v11 = v2.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: v2 (ref), v5 (ref), v6 (copy), v8 (copy), v3 (ref)
        return {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10), 
                PaddingTop = UDim.new(0, 10), 
                PaddingBottom = UDim.new(0, 10)
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Wraps = true, 
                Padding = UDim.new(0, 10), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            RedirectTile = v2.createElement(v5, {
                caption = "", 
                outfitId = -1, 
                checked = false, 
                onActivated = v6.onRedirect, 
                width = v8, 
                layoutOrder = 1
            }), 
            Tiles = v2.createElement(v2.Fragment, nil, v3.List.map(v6.outfitTiles, function(v9, v10) --[[ Line: 68 ]]
                -- upvalues: v2 (ref), v5 (ref), v6 (ref), v8 (ref)
                return v2.createElement(v5, {
                    caption = v9.caption, 
                    outfitId = v9.outfitId, 
                    checked = v6.selectedOutfit == v9.outfitId, 
                    onActivated = function() --[[ Line: 73 ]] --[[ Name: onActivated ]]
                        -- upvalues: v9 (copy), v6 (ref)
                        if v9.outfitId == -1 then
                            v6.onRedirect();
                            return;
                        else
                            v6.setSelectedOutfit(v9.outfitId);
                            return;
                        end;
                    end, 
                    width = v8, 
                    layoutOrder = v10 + 1
                });
            end))
        };
    end, {
        v8, 
        v6.outfitTiles, 
        v6.selectedOutfit, 
        v6.onRedirect, 
        v6.setSelectedOutfit
    });
    return v2.createElement(l_ScrollView_0, {
        LayoutOrder = v6.layoutOrder or 1, 
        tag = "size-full-0 grow", 
        scroll = {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            CanvasSize = UDim2.new(1, 0, 0, 0)
        }
    }, v11);
end;