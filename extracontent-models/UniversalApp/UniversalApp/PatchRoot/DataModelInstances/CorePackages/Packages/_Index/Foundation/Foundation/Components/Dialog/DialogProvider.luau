local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.DialogSize);
local v4 = require(script.Parent.getResponsiveSize);
local v5 = require(l_script_FirstAncestor_0.Providers.Overlay.useOverlay);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v7 = require(script.Parent.DialogContext);
return function(v8) --[[ Line: 23 ]] --[[ Name: DialogProvider ]]
    -- upvalues: v5 (copy), v6 (copy), v2 (copy), v4 (copy), v7 (copy)
    local v9 = v5();
    local v10 = v6();
    local v11, v12 = v2.useState(function() --[[ Line: 27 ]]
        -- upvalues: v9 (copy), v4 (ref), v8 (copy), v10 (copy)
        if v9 then
            return v4(v9.AbsoluteSize.X, v8.size, v10);
        else
            return v8.responsiveSize or v8.size;
        end;
    end);
    local v13, v14 = v2.useState(v8.hasHeroMedia);
    local v15 = v2.useRef(nil);
    local v16, v17 = v2.useState(nil);
    return v2.createElement(v7.Provider, {
        value = {
            size = v8.size, 
            responsiveSize = v11, 
            setResponsiveSize = v12, 
            hasHeroMedia = v13, 
            setHasHeroMedia = v14, 
            testId = v8.testId, 
            closeAffordanceRef = v15, 
            contentStartRef = v16, 
            setContentStartRef = v17
        }
    }, v8.children);
end;