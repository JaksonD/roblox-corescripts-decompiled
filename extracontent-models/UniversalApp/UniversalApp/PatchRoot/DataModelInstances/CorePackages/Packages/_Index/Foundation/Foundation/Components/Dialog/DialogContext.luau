local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.DialogSize);
return require(l_Parent_0.React).createContext({
    size = v2.Small, 
    responsiveSize = v2.Small, 
    setResponsiveSize = function(_) --[[ Line: 11 ]] --[[ Name: setResponsiveSize ]]

    end, 
    hasHeroMedia = false, 
    setHasHeroMedia = function(_) --[[ Line: 13 ]] --[[ Name: setHasHeroMedia ]]

    end, 
    testId = "", 
    closeAffordanceRef = nil, 
    contentStartRef = nil, 
    setContentStartRef = function(_) --[[ Line: 17 ]] --[[ Name: setContentStartRef ]]

    end
});