local l_Parent_0 = script.Parent.Parent;
local l_isSubjectToDesktopPolicies_0 = require(l_Parent_0.SharedFlags).isSubjectToDesktopPolicies;
return function(v2) --[[ Line: 5 ]] --[[ Name: SharePolicies ]]
    -- upvalues: l_isSubjectToDesktopPolicies_0 (copy)
    return {
        getAccountProviderName = function() --[[ Line: 7 ]] --[[ Name: getAccountProviderName ]]
            -- upvalues: v2 (copy)
            return v2.AccountProviderName or "";
        end, 
        shouldShowGameDetailsShareButton = function() --[[ Line: 10 ]] --[[ Name: shouldShowGameDetailsShareButton ]]
            -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), v2 (copy)
            if l_isSubjectToDesktopPolicies_0() then
                return false;
            else
                return v2.GameDetailsShareButton or false;
            end;
        end, 
        shouldShowCatalogShareButton = function() --[[ Line: 17 ]] --[[ Name: shouldShowCatalogShareButton ]]
            -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), v2 (copy)
            if l_isSubjectToDesktopPolicies_0() then
                return false;
            else
                return v2.CatalogShareButton or false;
            end;
        end, 
        shouldShareToAccountProvider = function() --[[ Line: 24 ]] --[[ Name: shouldShareToAccountProvider ]]
            -- upvalues: v2 (copy)
            return v2.ShareToAccountProvider or false;
        end, 
        shouldInviteFromAccountProvider = function() --[[ Line: 27 ]] --[[ Name: shouldInviteFromAccountProvider ]]
            -- upvalues: v2 (copy)
            return v2.InviteFromAccountProvider or false;
        end, 
        getShareToAccountProviderTimeout = function() --[[ Line: 30 ]] --[[ Name: getShareToAccountProviderTimeout ]]
            -- upvalues: v2 (copy)
            return v2.ShareToAccountProviderTimeout or 5;
        end
    };
end;