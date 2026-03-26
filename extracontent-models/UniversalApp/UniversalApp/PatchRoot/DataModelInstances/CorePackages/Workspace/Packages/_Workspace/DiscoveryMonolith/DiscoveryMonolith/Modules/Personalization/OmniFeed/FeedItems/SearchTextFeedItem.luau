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
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
return function(v14) --[[ Line: 25 ]]
    -- upvalues: l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v10 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_CollectionItemSize_0 (copy), v3 (copy), v5 (copy), l_usePageSideMargin_0 (copy), l_useSelector_0 (copy), v1 (copy)
    local v15 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v14[v10.key].appCompositionEnabled else nil;
    local v16 = nil;
    if not l_FFlagLuaAppCompositionAlways_0 then
        if l_FFlagLuaAppLayoutParamsInContext_0 then
            local l_sduiContext_0 = v14[v10.key].sduiContext;
            local l_Small_0 = l_CollectionItemSize_0.Small;
            local l_l_sduiContext_0_0 = l_sduiContext_0 --[[ copy: 3 -> 6 ]];
            local l_l_Small_0_0 = l_Small_0 --[[ copy: 4 -> 7 ]];
            local v22 = v3.useCallback(function(v21) --[[ Line: 39 ]]
                -- upvalues: l_l_sduiContext_0_0 (copy), l_l_Small_0_0 (copy)
                return l_l_sduiContext_0_0.getPageLayoutConfig(l_l_Small_0_0)(v21).sideMargin;
            end, {
                l_Small_0, 
                l_sduiContext_0.getPageLayoutConfig
            });
            v16 = v5.useSignalState(v22);
        else
            v16 = l_usePageSideMargin_0(v14[v10.key].verticalScrollingFrameRef.current);
        end;
    end;
    local v23 = if v15 then nil else v16;
    local v26 = l_useSelector_0(function(v24) --[[ Line: 49 ]]
        -- upvalues: v14 (copy)
        local v25 = v24.TextSearchResults[v14.searchUuid] and v24.TextSearchResults[v14.searchUuid][v14.topicId] or nil;
        if v25 then
            return v25.text;
        else
            return nil;
        end;
    end);
    return v3.createElement(v1, {
        text = v26, 
        sidePadding = v23
    });
end;