local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v7 = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetGameGridFlexFeedItemInput);
local v8 = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearGameGridFlexFeedItemBounds);
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
return function(v10, v11, v12, v13, v14) --[[ Line: 23 ]] --[[ Name: useGridFlexFeedItemBounds ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v2 (copy), v7 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), v8 (copy)
    local v15 = l_useDispatch_0();
    local v17 = l_useSelector_0(function(v16) --[[ Line: 32 ]]
        -- upvalues: v10 (copy), v11 (copy)
        return ((v16.Personalization.GameGridFlexFeedItemBounds[v10] or {}).flexItemsBounds or {})[v11];
    end);
    v2.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: v12 (copy), v15 (copy), v7 (ref), v10 (copy), v11 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v13 (copy), v14 (copy), v8 (ref)
        if v12 and v12 > 0 then
            v15(v7(v10, v11, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then nil else v12 * v13, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v13 else nil, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v12 else nil, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v14 else nil));
        end;
        return function() --[[ Line: 53 ]]
            -- upvalues: l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v12 (ref), v15 (ref), v8 (ref), v10 (ref), v11 (ref), v14 (ref)
            if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then
                if v12 and v12 > 0 then
                    v15(v8(v10, v11, v12, v14));
                    return;
                end;
            else
                v15(v8(v10, v11, nil, nil));
            end;
        end;
    end, {
        v10, 
        v11, 
        v12, 
        v13, 
        if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v14 else nil
    });
    return v17;
end;