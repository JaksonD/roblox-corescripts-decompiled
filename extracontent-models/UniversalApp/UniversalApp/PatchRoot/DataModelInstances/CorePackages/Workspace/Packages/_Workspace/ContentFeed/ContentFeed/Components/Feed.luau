local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.CapturesCommon);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.Responsive);
local v7 = require(l_Parent_1.RoactUtils);
local v8 = require(l_Parent_1.RobloxAppHooks);
local v9 = require(l_Parent_0.Analytics.EventNames);
local v10 = require(l_Parent_0.App.FeedContext);
local v11 = require(l_Parent_0.Enums.FeedDirectionType);
local v12 = require(l_Parent_0.Components.FeedItem.FeedItem);
local v13 = require(l_Parent_0.Components.FeedItem.FeedItemPlaceholder);
local v14 = require(l_Parent_0.Components.FeedItem.FeedItemPostsNotFound);
local v15 = require(l_Parent_0.Components.FeedHeader.FeedTopBar);
local l_getDeepValue_0 = v4.SocialLibraries.config({}).Dictionary.getDeepValue;
local v17 = require(l_Parent_0.Utils.getFeedPostElements);
local v18 = require(l_Parent_0.Utils.getIsPlaceholder);
local v19 = require(l_Parent_0.Utils.getPostIndex);
local v20 = require(l_Parent_0.Actions.InspectClosed);
local v21 = require(l_Parent_0.Components.NavigationSidebar.NavigationSidebar);
local _ = require(l_Parent_0.Enums.NavigationType);
local v23 = require(l_Parent_0.Enums.PlaceholderType);
local v24 = require(l_Parent_0.Thunks.RetrievePosts);
local v25 = require(l_Parent_0.Enums.SortOrderType);
local _ = require(l_Parent_0.Types);
local l_View_0 = v3.View;
local v28 = require(l_Parent_0.Hooks.useAnalytics);
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v5.useEffect;
local l_useEffectOnce_0 = v7.Hooks.useEffectOnce;
local v32 = require(l_Parent_0.Hooks.useFeedMotionController);
local l_useGuiInset_0 = v2.Hooks.useGuiInset;
local l_usePreferredInput_0 = v6.usePreferredInput;
local l_useScreenSize_0 = v8.useScreenSize;
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local l_useState_0 = v5.useState;
local l_useTokens_0 = v3.Hooks.useTokens;
local v39 = game:DefineFastFlag("ContentFeedCloseInspectOnOpen", false);
local v40 = require(l_Parent_0.Flags.FIntContentFeedZoomEventThrottle);
local v41 = require(l_Parent_0.Flags.FIntContentPostFetchThreshold);
local function v51(v42, v43, v44, v45, v46, v47) --[[ Line: 58 ]]
    -- upvalues: v23 (copy), v5 (copy), v14 (copy), v13 (copy), v12 (copy)
    local v48 = {};
    if v46 then
        v48[v23.PostsNotFound] = v5.createElement(v14, {
            layoutOrder = 1
        });
        return v48;
    elseif #v42 == 0 or v45 == nil then
        v48[v23.PostsNotLoaded] = v5.createElement(v13, {
            layoutOrder = 1
        });
        return v48;
    else
        if v43 then
            v48[v23.NextPostsLoading] = v5.createElement(v13, {
                layoutOrder = 0
            });
        end;
        for v49 = 1, #v42 do
            local v50 = v42[v49];
            v48[v50.postId] = v5.createElement(v12, {
                additionalInfo = v50.additionalInfo, 
                assetId = v50.assetId, 
                caption = v50.caption, 
                creatorUserId = v50.creatorUserId, 
                currentPostId = v47, 
                layoutOrder = v49, 
                placeId = v50.experienceContext.placeId, 
                postId = v50.postId, 
                screenshotMetadata = v50.screenshotMetadata, 
                universeId = v50.experienceContext.experienceId, 
                type = v50.type, 
                uploadedAtTimestamp = v50.uploadedAtTimestamp
            });
        end;
        if v44 then
            v48[v23.PreviousPostsLoading] = v5.createElement(v13, {
                layoutOrder = #v42 + 1
            });
        end;
        return v48;
    end;
end;
local function v58(v52, v53) --[[ Line: 115 ]]
    -- upvalues: v17 (copy)
    local v54 = v17(v52);
    for _, v56 in pairs(v54) do
        local l_Name_0 = v56.Name;
        if math.abs(v56.AbsolutePosition.Y + v53) < 5 then
            return l_Name_0;
        end;
    end;
    return nil;
end;
local function _(v59, v60) --[[ Line: 127 ]]
    -- upvalues: v41 (copy)
    for v61 = 1, math.min(#v59, v41) do
        if v59[v61].postId == v60 then
            return true;
        end;
    end;
    return false;
end;
local function _(v63, v64) --[[ Line: 137 ]]
    -- upvalues: v41 (copy)
    for v65 = math.max(1, #v63 - (v41 - 1)), #v63 do
        if v63[v65].postId == v64 then
            return true;
        end;
    end;
    return false;
end;
return function(v67) --[[ Line: 147 ]]
    -- upvalues: l_useGuiInset_0 (copy), l_usePreferredInput_0 (copy), l_useScreenSize_0 (copy), v5 (copy), v10 (copy), l_useState_0 (copy), v28 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v39 (copy), l_useEffectOnce_0 (copy), v20 (copy), l_useEffect_0 (copy), v19 (copy), v23 (copy), v32 (copy), v9 (copy), v40 (copy), v58 (copy), v11 (copy), v41 (copy), v24 (copy), v25 (copy), v18 (copy), v51 (copy), l_View_0 (copy), v15 (copy), v6 (copy), v21 (copy), v3 (copy)
    local v68 = false;
    local v69 = false;
    local v70 = l_useGuiInset_0();
    local v71 = l_usePreferredInput_0();
    local v72 = l_useScreenSize_0();
    local v73 = v5.useContext(v10);
    local v74, v75 = l_useState_0(v72);
    local v76 = v28();
    local v77 = l_useDispatch_0();
    local v78 = l_useTokens_0();
    local v79, v80 = l_useState_0({});
    local v86 = l_useSelector_0(function(v81) --[[ Line: 161 ]]
        -- upvalues: l_getDeepValue_0 (ref), v67 (copy), v79 (copy)
        local v82 = {};
        local v83 = l_getDeepValue_0(v81, "ContentSharing.byUserId." .. v67.creatorUserId .. ".posts") or {};
        for _, v85 in pairs(v83) do
            if not table.find(v79, v85.postId) then
                table.insert(v82, v85);
            end;
        end;
        return v82;
    end);
    local v87, v88 = l_useState_0(nil);
    local v90 = l_useSelector_0(function(v89) --[[ Line: 174 ]]
        return v89.ContentFeed.Inspect.IsOpen;
    end);
    if v39 then
        l_useEffectOnce_0(function() --[[ Line: 179 ]]
            -- upvalues: v90 (copy), v77 (copy), v20 (ref)
            if v90 then
                v77(v20());
            end;
        end, {});
    end;
    l_useEffect_0(function() --[[ Line: 186 ]]
        -- upvalues: v19 (ref), v86 (copy), v67 (copy), v88 (copy)
        local v91 = v19(v86, v67.initialPostId);
        if #v86 == 0 or v91 == nil then
            return;
        else
            v88(v91 - 1);
            return;
        end;
    end, {
        v86, 
        v67.initialPostId
    });
    local v93 = l_useSelector_0(function(v92) --[[ Line: 195 ]]
        -- upvalues: l_getDeepValue_0 (ref), v67 (copy)
        return l_getDeepValue_0(v92, "ContentSharing.byUserId." .. v67.creatorUserId .. ".nextTimeCursor");
    end);
    local v95 = l_useSelector_0(function(v94) --[[ Line: 199 ]]
        -- upvalues: l_getDeepValue_0 (ref), v67 (copy)
        return l_getDeepValue_0(v94, "ContentSharing.byUserId." .. v67.creatorUserId .. ".previousTimeCursor");
    end);
    local v96, v97 = l_useState_0(if #v86 ~= 0 then v67.initialPostId else v23.PostsNotLoaded);
    local v98 = true;
    if #v86 ~= 0 then
        v98 = v93 ~= nil and v96 == v23.NextPostsLoading or v93 == nil and v96 == v86[1].postId or v96 == v23.PostsNotLoaded or v96 == v23.PostsNotFound;
    end;
    local v99 = true;
    if #v86 ~= 0 then
        v99 = v95 ~= nil and v96 == v23.PreviousPostsLoading or v95 == nil and v96 == v86[#v86].postId or v96 == v23.PostsNotLoaded or v96 == v23.PostsNotFound;
    end;
    local v100 = #v86;
    local v101, v102, v103 = v32(v98, v99, v100, v90);
    l_useEffect_0(function() --[[ Line: 221 ]]
        -- upvalues: v76 (copy), v9 (ref), v96 (copy)
        v76.fireEvent(v9.ContentFeedPostViewed, {
            postId = v96
        });
    end, {
        v76.fireEvent, 
        v96
    });
    l_useEffect_0(function() --[[ Line: 227 ]]
        -- upvalues: v73 (copy), v40 (ref), v76 (copy), v9 (ref), v96 (copy)
        if v73.isZooming and math.random() < 1 / v40 then
            v76.fireEvent(v9.ContentFeedZoomOccurred, {
                postId = v96
            });
        end;
    end, {
        v76.fireEvent, 
        v96, 
        v73.isZooming
    });
    l_useEffect_0(function() --[[ Line: 235 ]]
        -- upvalues: v58 (ref), v101 (copy), v70 (copy), v97 (copy)
        local v104 = v58(v101, v70.top);
        if v104 then
            v97(v104);
        end;
    end, {
        v86, 
        v70.top
    });
    local v109 = v5.useCallback(function() --[[ Line: 243 ]]
        -- upvalues: v58 (ref), v101 (copy), v70 (copy), v97 (copy), v79 (copy), v96 (copy), v86 (copy), v73 (copy), v103 (copy), v11 (ref), v80 (copy)
        local v105 = v58(v101, v70.top);
        if v105 then
            v97(v105);
        end;
        local v106 = {};
        for _, v108 in pairs(v79) do
            table.insert(v106, v108);
        end;
        table.insert(v106, v96);
        if #v86 == 1 then
            v73.navigateBack(true);
        elseif v96 ~= v86[1].postId then
            v103(v11.Up);
            task.wait(0.1);
        end;
        v80(v106);
    end, {
        v86, 
        v73.navigateBack, 
        v70.top, 
        v102, 
        v79, 
        v87, 
        v103
    });
    l_useEffect_0(function() --[[ Line: 276 ]]
        -- upvalues: v102 (copy), v58 (ref), v101 (copy), v70 (copy), v97 (copy)
        local v112 = v102:connect(function(_) --[[ Line: 278 ]]
            -- upvalues: v58 (ref), v101 (ref), v70 (ref), v97 (ref)
            local v111 = v58(v101, v70.top);
            if v111 then
                v97(v111);
            end;
        end);
        return function() --[[ Line: 286 ]]
            -- upvalues: v112 (copy)
            v112:disconnect();
        end;
    end, {
        v86, 
        v96, 
        v70.top, 
        v102, 
        v93, 
        v95
    });
    local v113;
    for v114 = 1, math.min(#v86, v41) do
        if v86[v114].postId == v96 then
            v113 = true;
            v68 = true;
        end;
        if v68 then
            break;
        end;
    end;
    if not v68 then
        v113 = false;
    end;
    v68 = false;
    local v115;
    for v116 = math.max(1, #v86 - (v41 - 1)), #v86 do
        if v86[v116].postId == v96 then
            v115 = true;
            v69 = true;
        end;
        if v69 then
            break;
        end;
    end;
    if not v69 then
        v115 = false;
    end;
    v69 = false;
    l_useEffect_0(function() --[[ Line: 304 ]]
        -- upvalues: v113 (copy), v93 (copy), v77 (copy), v24 (ref), v67 (copy), v25 (ref), v115 (copy), v95 (copy)
        if v113 and v93 then
            assert(v93 ~= nil, "nextTimeCursor should not be nil");
            v77(v24(v67.creatorUserId, v93, v25.Ascending));
        end;
        if v115 and v95 then
            assert(v95 ~= nil, "previousTimeCursor should not be nil");
            v77(v24(v67.creatorUserId, v95, v25.Descending));
        end;
    end, {
        v77, 
        v113, 
        v115, 
        v93, 
        v95, 
        v24
    });
    local v117 = v5.useCallback(function() --[[ Line: 318 ]]
        -- upvalues: v77 (copy), v20 (ref)
        v77(v20());
    end, {
        v77, 
        v20
    });
    local v118 = v5.useCallback(function() --[[ Line: 322 ]]
        -- upvalues: v103 (copy), v11 (ref)
        v103(v11.Up);
    end, {
        v103
    });
    local v119 = v5.useCallback(function() --[[ Line: 326 ]]
        -- upvalues: v103 (copy), v11 (ref)
        v103(v11.Down);
    end, {
        v103
    });
    local v120 = v18(v96);
    local v121 = 0;
    if v93 then
        v121 = v121 + 1;
    end;
    v121 = v121 + (v87 == nil and 0 or v87);
    local v122 = -v72.Y * v121 - v70.top;
    local v123 = v51(v86, v93, v95, v87, v67.initialPostsCallFailed, v96);
    local v124 = math.min(v74.X, v74.Y * 0.5625);
    local v125 = v124 / 2 + v78.Padding.Medium;
    return v5.createElement(l_View_0, {
        onAbsoluteSizeChanged = function(v126) --[[ Line: 353 ]] --[[ Name: onAbsoluteSizeChanged ]]
            -- upvalues: v75 (copy)
            v75(v126.AbsoluteSize);
        end, 
        Size = UDim2.new(1, 0, 0, v72.Y), 
        tag = "bg-surface-0"
    }, {
        TopBar = v5.createElement(v15, {
            creatorId = v67.creatorUserId, 
            isPlaceholderPost = v120, 
            postId = v96, 
            removePostTransition = v109, 
            ZIndex = 3
        }), 
        FeedContainer = v5.createElement(l_View_0, {
            Size = UDim2.new(0, v124, 1, 0), 
            tag = "anchor-top-center bg-action-subtle position-top-center shrink size-0-full"
        }, {
            ContentFeed = v5.createElement(l_View_0, {
                LayoutOrder = 1, 
                Position = UDim2.fromOffset(0, v122), 
                ref = v101, 
                Size = UDim2.new(1, 0, 0, #v86 * v72.Y), 
                tag = "align-x-center bg-action-subtle col no-clip"
            }, v123)
        }), 
        NavigationSidebar = if v71 == v6.Input.Pointer and (v125 + v78.Size.Size_1200) * 2 <= v74.X then v5.createElement(v21, {
            isTerminalFinalPost = v99, 
            isTerminalInitialPost = v98, 
            position = UDim2.new(0.5, v125, 0.5, 0), 
            onNavigateDown = v119, 
            onNavigateUp = v118
        }) else nil, 
        ShadowBlock = if v90 then v5.createElement(l_View_0, {
            onActivated = v117, 
            stateLayer = {
                affordance = v3.Enums.StateLayerAffordance.None
            }, 
            tag = "align-x-center bg-over-media-0 col items-center size-full-full", 
            ZIndex = 3
        }) else nil
    });
end;