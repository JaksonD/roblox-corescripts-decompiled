local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_Parent_0.ArgCheck);
local _ = require(l_Parent_0.DiscoveryTypes);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v8 = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetFeedItemRenderedRows);
local v9 = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearFeedItemRenderedRows);
return function(v10, v11, v12, v13) --[[ Line: 13 ]] --[[ Name: useUpdateFeedItemRenderedRows ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v2 (copy), v5 (copy), v8 (copy), v9 (copy)
    local v14 = l_useDispatch_0();
    local v17 = l_useSelector_0(function(v15) --[[ Line: 15 ]]
        -- upvalues: v10 (copy), v11 (copy), v12 (copy)
        local v16 = v15.Personalization.OrderedOmniItems[v10] or {};
        if v11 then
            v16 = v16[v11] or {};
        end;
        return v16.allItems and v16.allItems[v12] or nil;
    end);
    v2.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: v5 (ref), v17 (copy), v12 (copy), v10 (copy), v11 (copy), v14 (copy), v8 (ref), v13 (copy), v9 (ref)
        v5.assert(v17, (("Trying to update the number of rows for a feed item but could not find it.  At position: %*, Page: %* (optional key: %*)"):format(v12, v10, v11)));
        if not v17 then
            return function() --[[ Line: 35 ]]

            end;
        else
            v14(v8(v10, v11, v12, v17, v13));
            return function() --[[ Line: 40 ]]
                -- upvalues: v14 (ref), v9 (ref), v10 (ref), v11 (ref), v12 (ref), v17 (ref)
                v14(v9(v10, v11, v12, v17));
            end;
        end;
    end, {
        v10, 
        v11, 
        v12, 
        v17, 
        v13
    });
end;