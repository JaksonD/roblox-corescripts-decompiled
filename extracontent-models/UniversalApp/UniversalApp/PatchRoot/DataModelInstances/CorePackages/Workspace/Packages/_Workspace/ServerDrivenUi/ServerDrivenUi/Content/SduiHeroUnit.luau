local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_HeroUnitContainer_0 = require(l_Parent_0.DiscoveryHeroUnit).HeroUnitContainer;
local v5 = require(l_script_FirstAncestor_0.Content.SduiAttributionRow);
local v6 = require(l_script_FirstAncestor_0.Content.SduiTextPill);
local _ = require(l_Parent_0.SduiCoreSystem);
return v3.memo(function(v8) --[[ Line: 110 ]] --[[ Name: SduiHeroUnit ]]
    -- upvalues: v3 (copy), v5 (copy), v6 (copy), v2 (copy), l_HeroUnitContainer_0 (copy)
    local l_children_0 = v8.children;
    local v10 = v3.useMemo(function() --[[ Line: 115 ]]
        -- upvalues: v8 (copy), v3 (ref), v5 (ref)
        if v8.asset then
            return v3.createElement(v5, {
                image = v8.asset.image, 
                title = v8.asset.title, 
                subtitle = v8.asset.subtitle, 
                rightButtonContent = v8.ctaButtonComponent, 
                sduiContext = v8.sduiContext, 
                onActivated = v8.onActivated
            });
        else
            return nil;
        end;
    end, {
        v8.asset, 
        v8.ctaButtonComponent, 
        v8.sduiContext, 
        v8.onActivated
    });
    local v11 = v3.useMemo(function() --[[ Line: 131 ]]
        -- upvalues: v8 (copy), v3 (ref), v6 (ref)
        if v8.badgeText then
            return v3.createElement(v6, {
                sduiContext = v8.sduiContext, 
                text = v8.badgeText
            });
        else
            return nil;
        end;
    end, {
        v8.badgeText, 
        v8.sduiContext
    });
    local v12 = v3.useMemo(function() --[[ Line: 141 ]]
        -- upvalues: v2 (ref), v10 (copy), v11 (copy), v8 (copy)
        return (v2.Dictionary.join({
            bottomRowComponent = v10, 
            overlayComponent = v11, 
            sideMargin = v8.pageSideMargin
        }, v8));
    end, {
        v8, 
        v10, 
        v11, 
        v8.pageSideMargin
    });
    return v3.createElement(l_HeroUnitContainer_0, v12, l_children_0);
end);