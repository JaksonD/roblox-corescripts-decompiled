local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useSignal_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useSignal;
local l_useThrottledCallback_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useThrottledCallback;
local v7 = require(l_CorePackages_0.Packages.Dash);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v10 = game:DefineFastInt("AXSponsoredItemsImpressionsPeriod", 1);
local function v12(v11) --[[ Line: 22 ]] --[[ Name: selectScreenSize ]]
    return v11.ScreenSize;
end;
local function v14(v13) --[[ Line: 26 ]] --[[ Name: selectGlobalGuiInset ]]
    return v13.GlobalGuiInset;
end;
local function _(v15) --[[ Line: 40 ]] --[[ Name: getItemKey ]]
    if not v15 or not v15.id or not v15.type then
        return "";
    else
        return tostring(v15.type) .. "-" .. tostring(v15.id);
    end;
end;
return function(v17) --[[ Line: 47 ]] --[[ Name: SponsoredItemsImpressionsTracker ]]
    -- upvalues: l_useSelector_0 (copy), v12 (copy), l_getUseSelectorDeepEquals_0 (copy), v14 (copy), v3 (copy), v7 (copy), l_useThrottledCallback_0 (copy), v10 (copy), l_useSignal_0 (copy)
    local l_visibleItems_0 = v17.visibleItems;
    local l_scrollingFrameRef_0 = v17.scrollingFrameRef;
    local l_sponsoredGridRef_0 = v17.sponsoredGridRef;
    local l_requestImpressionsSignal_0 = v17.requestImpressionsSignal;
    local v22 = l_useSelector_0(v12, l_getUseSelectorDeepEquals_0());
    local v23 = l_useSelector_0(v14, l_getUseSelectorDeepEquals_0());
    local v24 = v3.useRef({});
    local function _() --[[ Line: 56 ]] --[[ Name: getSponsoredItemsCenterHeight ]]
        -- upvalues: l_sponsoredGridRef_0 (copy)
        if not l_sponsoredGridRef_0.current then
            return nil;
        else
            local l_current_0 = l_sponsoredGridRef_0.current;
            local l_AbsolutePosition_0 = l_current_0.AbsolutePosition;
            local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
            return l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y / 2;
        end;
    end;
    local function _() --[[ Line: 68 ]] --[[ Name: isSponsoredItemsGridVisible ]]
        -- upvalues: l_scrollingFrameRef_0 (copy), v22 (copy), v23 (copy), l_sponsoredGridRef_0 (copy)
        if not l_scrollingFrameRef_0 or not l_scrollingFrameRef_0.current then
            return false;
        else
            assert(l_scrollingFrameRef_0, "");
            local l_Y_0 = l_scrollingFrameRef_0.current.AbsolutePosition.Y;
            local v30 = v22.Y - v23.bottom;
            local v31;
            if not l_sponsoredGridRef_0.current then
                v31 = nil;
            else
                local l_current_1 = l_sponsoredGridRef_0.current;
                local l_AbsolutePosition_1 = l_current_1.AbsolutePosition;
                local l_AbsoluteSize_1 = l_current_1.AbsoluteSize;
                v31 = l_AbsolutePosition_1.Y + l_AbsoluteSize_1.Y / 2;
            end;
            return if v31 then l_Y_0 < v31 and (v31 < v30 or false) else false;
        end;
    end;
    local function v42() --[[ Line: 82 ]] --[[ Name: sendImpressions ]]
        -- upvalues: v24 (copy), l_visibleItems_0 (copy), v7 (ref)
        local v36 = {};
        local l_current_2 = v24.current;
        for v38, v39 in l_visibleItems_0 do
            local l_v39_0 = v39;
            local v41 = if l_v39_0 and l_v39_0.id and l_v39_0.type then tostring(l_v39_0.type) .. "-" .. tostring(l_v39_0.id) else "";
            if not l_current_2[v41] then
                table.insert(v36, (v7.join(v39, {
                    index = v38
                })));
                l_current_2[v41] = true;
            end;
        end;
    end;
    local v50 = l_useThrottledCallback_0(function() --[[ Line: 97 ]] --[[ Name: updateImpressions ]]
        -- upvalues: l_scrollingFrameRef_0 (copy), v22 (copy), v23 (copy), l_sponsoredGridRef_0 (copy), v42 (copy)
        local v43;
        if not l_scrollingFrameRef_0 or not l_scrollingFrameRef_0.current then
            v43 = false;
        else
            assert(l_scrollingFrameRef_0, "");
            local l_Y_1 = l_scrollingFrameRef_0.current.AbsolutePosition.Y;
            local v45 = v22.Y - v23.bottom;
            local v46;
            if not l_sponsoredGridRef_0.current then
                v46 = nil;
            else
                local l_current_3 = l_sponsoredGridRef_0.current;
                local l_AbsolutePosition_2 = l_current_3.AbsolutePosition;
                local l_AbsoluteSize_2 = l_current_3.AbsoluteSize;
                v46 = l_AbsolutePosition_2.Y + l_AbsoluteSize_2.Y / 2;
            end;
            v43 = if v46 then l_Y_1 < v46 and (v46 < v45 or false) else false;
        end;
        if v43 then
            v42();
        end;
    end, v10);
    l_useSignal_0(l_requestImpressionsSignal_0, v50);
    return nil;
end;