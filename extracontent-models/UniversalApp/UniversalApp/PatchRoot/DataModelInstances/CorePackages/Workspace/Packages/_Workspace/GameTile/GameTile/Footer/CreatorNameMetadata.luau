local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Footer.GridTileTextFooter);
local v3 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = utf8.char(57344);
return function(v6) --[[ Line: 18 ]] --[[ Name: CreatorNameMetadata ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy), v5 (copy), v2 (copy)
    local l_creatorByLabel_0 = l_useLocalization_0({
        creatorByLabel = "Feature.GameDetails.Label.By"
    }).creatorByLabel;
    local v8 = v3.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v6 (copy), l_creatorByLabel_0 (copy), v5 (ref)
        if v6.name == nil or v6.name == "" then
            return "";
        else
            return (("<b>%* %*</b>%*"):format(l_creatorByLabel_0, v6.name, if v6.hasVerifiedBadge then v5 else ""));
        end;
    end, {
        l_creatorByLabel_0, 
        v6.name, 
        v6.hasVerifiedBadge
    });
    return v3.createElement(v2, {
        LayoutOrder = v6.LayoutOrder, 
        AnchorPoint = v6.AnchorPoint, 
        Position = v6.Position, 
        RichText = true, 
        text = v8, 
        useLargerFont = true, 
        isUnifiedGameTile = true
    });
end;