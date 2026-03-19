local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.DialogSize);
local v4 = require(l_script_FirstAncestor_0.Utility.Flags);
local v5 = require(script.Parent.getResponsiveSize);
local v6 = require(l_script_FirstAncestor_0.Providers.Overlay.useOverlay);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v8 = require(script.Parent.DialogContext);
return function(v9) --[[ Line: 24 ]] --[[ Name: DialogProvider ]]
    -- upvalues: v6 (copy), v7 (copy), v2 (copy), v4 (copy), v5 (copy), v8 (copy)
    local v10 = v6();
    local v11 = v7();
    local v12, v13 = v2.useState(function() --[[ Line: 28 ]]
        -- upvalues: v4 (ref), v10 (copy), v5 (ref), v9 (copy), v11 (copy)
        if v4.FoundationDialogFixResponsiveSize and v10 then
            return v5(v10.AbsoluteSize.X, v9.size, v11);
        else
            return v9.responsiveSize or v9.size;
        end;
    end);
    local v14, v15 = v2.useState(v9.hasHeroMedia);
    local v16 = v2.useRef(nil);
    local v17, v18 = v2.useState(nil);
    return v2.createElement(v8.Provider, {
        value = {
            size = v9.size, 
            responsiveSize = v12, 
            setResponsiveSize = v13, 
            hasHeroMedia = v14, 
            setHasHeroMedia = v15, 
            testId = v9.testId, 
            closeAffordanceRef = v16, 
            contentStartRef = v17, 
            setContentStartRef = v18
        }
    }, v9.children);
end;