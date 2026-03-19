local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local v1 = require(l_script_FirstAncestor_0.Modules.Personalization.Search.SearchTextBanner);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_Parent_0.SignalsReact);
local v6 = require(l_Parent_0.CollectionViews);
local l_CollectionItemSize_0 = v6.CollectionViewTypes.CollectionItemSize;
local l_usePageSideMargin_0 = v6.usePageSideMargin;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v10 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local l_FFlagLuaAppLayoutParamsInContext_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLayoutParamsInContext;
return function(v12) --[[ Line: 23 ]]
    -- upvalues: l_FFlagLuaAppLayoutParamsInContext_0 (copy), v10 (copy), l_CollectionItemSize_0 (copy), v3 (copy), v5 (copy), l_usePageSideMargin_0 (copy), l_useSelector_0 (copy), v1 (copy)
    local v13 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local l_sduiContext_0 = v12[v10.key].sduiContext;
        local l_Small_0 = l_CollectionItemSize_0.Small;
        local l_l_sduiContext_0_0 = l_sduiContext_0 --[[ copy: 2 -> 5 ]];
        local l_l_Small_0_0 = l_Small_0 --[[ copy: 3 -> 6 ]];
        local v19 = v3.useCallback(function(v18) --[[ Line: 30 ]]
            -- upvalues: l_l_sduiContext_0_0 (copy), l_l_Small_0_0 (copy)
            return l_l_sduiContext_0_0.getPageLayoutConfig(l_l_Small_0_0)(v18).sideMargin;
        end, {
            l_Small_0, 
            l_sduiContext_0.getPageLayoutConfig
        });
        v13 = v5.useSignalState(v19);
    else
        v13 = l_usePageSideMargin_0(v12[v10.key].verticalScrollingFrameRef.current);
    end;
    local l_v13_0 = v13;
    local v23 = l_useSelector_0(function(v21) --[[ Line: 40 ]]
        -- upvalues: v12 (copy)
        local v22 = v21.TextSearchResults[v12.searchUuid] and v21.TextSearchResults[v12.searchUuid][v12.topicId] or nil;
        if v22 then
            return v22.text;
        else
            return nil;
        end;
    end);
    return v3.createElement(v1, {
        text = v23, 
        sidePadding = l_v13_0
    });
end;