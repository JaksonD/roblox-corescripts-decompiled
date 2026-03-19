local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v2.llama;
local l_Roact_0 = v2.Roact;
local l_memoize_0 = v2.memoize;
local l_Dictionary_0 = l_llama_0.Dictionary;
local v7 = require(l_script_FirstAncestor_0.Components.FriendsLandingPage);
local v8 = require(script.helpers.limitFriends);
local v9 = require(script.helpers.updateFriendsWithWidth);
local v10 = require(script.helpers.loadFriendGroup);
local v11 = require(script.helpers.friendsPerRow);
local v12 = require(script.helpers.friendsPerLoadGroup);
local v13 = require(l_script_FirstAncestor_0.Components.ShowMoreButton);
local v14 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local v15 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v16 = require(l_script_FirstAncestor_0.Enums.ShowMoreSectionTypeEnum);
local l_React_0 = v2.React;
local l_GridMetrics_0 = v2.UIBlox.App.Grid.GridMetrics;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v22 = l_Roact_0.PureComponent:extend("ShowMoreWrapper");
v22.defaultProps = {
    listComponent = v7, 
    itemSize = 175, 
    visibleRows = 6, 
    friends = {}, 
    analytics = nil, 
    filter = v15.All, 
    overrideRenderShowMore = nil, 
    handleShowMore = nil, 
    spacingIfEmpty = 48, 
    sectionType = v16.Friends
};
v22.init = function(v23) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: l_Dictionary_0 (copy), v15 (copy), v9 (copy), v12 (copy), v14 (copy), v11 (copy), v10 (copy), l_memoize_0 (copy), v8 (copy), l_Roact_0 (copy), v13 (copy)
    v23.state = {
        width = 100, 
        filterFriendCounts = l_Dictionary_0.map(v15, function() --[[ Line: 52 ]]
            -- upvalues: v23 (copy)
            return v23.props.visibleRows;
        end), 
        selectedItemIndex = nil
    };
    v23.updateWidth = function(v24) --[[ Line: 58 ]]
        -- upvalues: v23 (copy), v9 (ref)
        v23:setState(v9(v24.AbsoluteSize.X));
        if v23.props.onWidthUpdated then
            v23.props.onWidthUpdated(v24.AbsoluteSize.X);
        end;
    end;
    v23.reset = function() --[[ Line: 66 ]]
        -- upvalues: v23 (copy), l_Dictionary_0 (ref), v12 (ref)
        v23:setState(function(v25, v26) --[[ Line: 67 ]]
            -- upvalues: l_Dictionary_0 (ref), v23 (ref), v12 (ref)
            return {
                filterFriendCounts = l_Dictionary_0.join(v23.state.filterFriendCounts, {
                    [v23.props.filter] = v12(v25, v26)
                })
            };
        end);
    end;
    v23.showMore = function() --[[ Line: 77 ]]
        -- upvalues: v23 (copy), v14 (ref), v11 (ref), l_Dictionary_0 (ref), v10 (ref)
        if v23.props.analytics then
            v23.props.analytics:buttonClick(v14.LoadMoreUsers, {
                sectionType = v23.props.sectionType
            });
        end;
        if v23.props.fireOnShowMore then
            v23.props.fireOnShowMore(v23.props.sectionType);
        end;
        if v23.props.handleShowMore then
            v23.props.handleShowMore(v11(l_Dictionary_0.join({
                width = v23.state.width
            }, v23.props)));
            return;
        else
            v23:setState(function(v27, v28) --[[ Line: 95 ]]
                -- upvalues: l_Dictionary_0 (ref), v10 (ref)
                local v29 = v27.filterFriendCounts[v28.filter];
                return l_Dictionary_0.join(v10(v27, v28), {
                    selectedItemIndex = v29 + 1
                });
            end);
            return;
        end;
    end;
    v23.limitFriends = l_memoize_0(v8);
    v23.renderShowMore = l_memoize_0(function(v30, v31, v32) --[[ Line: 108 ]]
        -- upvalues: l_Roact_0 (ref), v13 (ref), v23 (copy)
        return function(v33) --[[ Line: 109 ]]
            -- upvalues: v32 (copy), v31 (copy), v30 (copy), l_Roact_0 (ref), v13 (ref), v23 (ref)
            local v34 = v32 and v32(v31);
            if v31 < v30 or v34 then
                return l_Roact_0.createElement(v13, {
                    layoutOrder = v33, 
                    onSizeChange = v23.updateWidth, 
                    onActivated = v23.showMore
                });
            else
                return l_Roact_0.createElement("Frame", {
                    Name = "showMoreSpacing", 
                    Size = UDim2.fromOffset(0, v23.props.spacingIfEmpty), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v33
                });
            end;
        end;
    end);
    v23.checkAndResetIfNeeded = function(v35) --[[ Line: 130 ]]
        -- upvalues: v23 (copy)
        if #v23.props.friends ~= #v35.friends or v35.visibleRows ~= v23.props.visibleRows then
            v23.reset();
        end;
    end;
end;
v22.didUpdate = function(v36, v37) --[[ Line: 137 ]] --[[ Name: didUpdate ]]
    v36.checkAndResetIfNeeded(v37);
end;
v22.render = function(v38) --[[ Line: 141 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_Dictionary_0 (copy)
    local v39 = v38.state.filterFriendCounts[v38.props.filter];
    return l_Roact_0.createElement(v38.props.listComponent, l_Dictionary_0.join(v38.props, {
        friends = v38.limitFriends(v39, v38.props.friends), 
        showMore = v38.showMore, 
        totalFilteredFriends = #v38.props.friends, 
        renderShowMore = v38.renderShowMore(#v38.props.friends, v39, v38.props.overrideRenderShowMore), 
        resetShowMore = v38.reset, 
        totalInactiveFriends = v38.props.totalInactiveFriends, 
        selectedItemIndex = v38.state.selectedItemIndex
    }));
end;
return function(v40) --[[ Line: 159 ]] --[[ Name: ShowMoreWrapperFn ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_React_0 (copy), l_GridMetrics_0 (copy), v22 (copy), l_llama_0 (copy)
    local v41 = l_useDesignTokens_0();
    local v42 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local l_GridViewItemMetrics_0 = v41.LuaApps.FriendsLanding.FriendsLandingPage.GridViewItemMetrics;
    local l_GridHorizontalSpacing_0 = v41.LuaApps.FriendsLanding.FriendsLandingPage.GridHorizontalSpacing;
    local l_GridVerticalSpacing_0 = v41.LuaApps.FriendsLanding.FriendsLandingPage.GridVerticalSpacing;
    local v46 = l_React_0.useMemo(function() --[[ Line: 168 ]]
        -- upvalues: v42 (copy), l_GridMetrics_0 (ref), l_GridViewItemMetrics_0 (copy)
        if v42 then
            return l_GridMetrics_0.makeCustomMetricsGetter(l_GridViewItemMetrics_0);
        else
            return nil;
        end;
    end, {
        v42, 
        l_GridViewItemMetrics_0
    });
    local v47, v48 = l_React_0.useState(100);
    local v49 = l_React_0.useMemo(function() --[[ Line: 177 ]]
        -- upvalues: v42 (copy), v46 (copy), l_GridHorizontalSpacing_0 (copy), v47 (copy)
        if v42 and v46 and l_GridHorizontalSpacing_0 then
            return v46(v47, l_GridHorizontalSpacing_0).itemWidth;
        else
            return nil;
        end;
    end, {
        v42, 
        v46, 
        v47, 
        l_GridHorizontalSpacing_0
    });
    return l_React_0.createElement(v22, l_llama_0.Dictionary.join({
        onWidthUpdated = if v42 then v48 else nil, 
        itemSize = v49, 
        getItemMetrics = v46, 
        gridHorizontalSpacing = l_GridHorizontalSpacing_0, 
        gridVerticalSpacing = l_GridVerticalSpacing_0
    }, v40));
end;