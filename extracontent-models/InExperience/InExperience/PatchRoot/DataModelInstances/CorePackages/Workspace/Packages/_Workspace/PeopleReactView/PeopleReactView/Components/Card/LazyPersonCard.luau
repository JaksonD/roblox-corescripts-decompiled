local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local v4 = require(l_Parent_0.Signals);
local v5 = require(l_Parent_0.SignalsReact);
local v6 = require(l_Parent_0.Foundation);
local l_Radius_0 = v6.Enums.Radius;
local l_useTokens_0 = v6.Hooks.useTokens;
local l_Skeleton_0 = v6.Skeleton;
local l_View_0 = v6.View;
local v11 = require(l_Parent_0.PeopleService);
local _ = require(l_script_FirstAncestor_0.Stores.GetScrollingFrameStore);
local v13 = require(l_script_FirstAncestor_0.Components.Card.PersonCard);
local v14 = require(l_script_FirstAncestor_0.Components.Common.LazyScrollingComponent);
local v15 = v11.getService("Flags");
local l_GetFFlagPeoplePageEnablePersonSignalStore_0 = v15.GetFFlagPeoplePageEnablePersonSignalStore;
local l_FFlagPeoplePageRemoveSkeletons_0 = v15.FFlagPeoplePageRemoveSkeletons;
local l_FFlagPeoplePageRemoveUseMemoElements_0 = v15.FFlagPeoplePageRemoveUseMemoElements;
local v21 = v2.memo(function(v19) --[[ Line: 33 ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagPeoplePageRemoveSkeletons_0 (copy), v2 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    local v20 = l_useTokens_0();
    if l_FFlagPeoplePageRemoveSkeletons_0 then
        return v2.createElement(l_View_0, {
            tag = "bg-surface-100 radius-medium", 
            Size = v19.size
        });
    else
        return v2.createElement(l_View_0, {
            tag = "col bg-surface-100 radius-medium", 
            Size = v19.size
        }, {
            ThumbnailContainer = v2.createElement(l_View_0, {
                tag = "size-full aspect-1-1 padding-small", 
                LayoutOrder = 1
            }, {
                ThumbnailSkeleton = v2.createElement(l_Skeleton_0, {
                    Size = UDim2.fromScale(1, 1), 
                    radius = l_Radius_0.Small
                })
            }), 
            Details = v2.createElement(l_View_0, {
                tag = "size-full-1400 col align-y-center gap-xsmall padding-x-small", 
                LayoutOrder = 2
            }, {
                NameSkeleton = v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.9, 0, 0, v20.Size.Size_350), 
                    radius = l_Radius_0.Small, 
                    LayoutOrder = 1
                }), 
                HandleSkeleton = v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.6, 0, 0, v20.Size.Size_350), 
                    radius = l_Radius_0.Small, 
                    LayoutOrder = 2
                })
            })
        });
    end;
end);
return v2.memo(function(v22) --[[ Line: 86 ]]
    -- upvalues: l_useTokens_0 (copy), l_GetFFlagPeoplePageEnablePersonSignalStore_0 (copy), v5 (copy), v4 (copy), v3 (copy), l_FFlagPeoplePageRemoveUseMemoElements_0 (copy), v2 (copy), v13 (copy), v21 (copy), l_FFlagPeoplePageRemoveSkeletons_0 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), v14 (copy)
    local v23 = l_useTokens_0();
    local v25 = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then v5.useSignalBinding(v4.createComputed(function(v24) --[[ Line: 90 ]]
        -- upvalues: v22 (copy)
        if type(v22.layoutOrder) == "function" then
            return v22.layoutOrder(v24);
        else
            return v22.layoutOrder or 0;
        end;
    end)) else nil;
    local v26 = nil;
    v26 = if v3.isBinding(v22.width) then v22.width:map(function(v27) --[[ Line: 100 ]]
        -- upvalues: v23 (copy)
        return UDim2.new(0, v27, 0, v27 + v23.Size.Size_1400);
    end) else UDim2.new(0, v22.width, 0, v22.width + v23.Size.Size_1400);
    local v28 = if l_FFlagPeoplePageRemoveUseMemoElements_0 then v2.createElement(v13, {
        width = v22.width, 
        person = v22.person, 
        showTooltip = v22.showTooltip, 
        onDismissTooltip = v22.onDismissTooltip, 
        shouldShowMenu = v22.shouldShowMenu, 
        layoutOrder = v22.layoutOrder
    }) else v2.useMemo(function() --[[ Line: 117 ]]
        -- upvalues: v2 (ref), v13 (ref), v22 (copy)
        return v2.createElement(v13, {
            width = v22.width, 
            person = v22.person, 
            showTooltip = v22.showTooltip, 
            onDismissTooltip = v22.onDismissTooltip, 
            shouldShowMenu = v22.shouldShowMenu, 
            layoutOrder = v22.layoutOrder
        });
    end, {
        v22.width, 
        v22.person, 
        v22.showTooltip, 
        v22.onDismissTooltip, 
        v22.shouldShowMenu, 
        v22.layoutOrder
    });
    local v29 = if l_FFlagPeoplePageRemoveUseMemoElements_0 then v2.createElement(v21, {
        size = v26
    }) else v2.useMemo(function() --[[ Line: 141 ]]
        -- upvalues: l_FFlagPeoplePageRemoveSkeletons_0 (ref), v2 (ref), l_View_0 (ref), v26 (ref), l_Skeleton_0 (ref), l_Radius_0 (ref), v23 (copy)
        if l_FFlagPeoplePageRemoveSkeletons_0 then
            return v2.createElement(l_View_0, {
                tag = "bg-surface-100 radius-medium", 
                Size = v26
            });
        else
            return v2.createElement(l_View_0, {
                tag = "col bg-surface-100 radius-medium", 
                Size = v26
            }, {
                ThumbnailContainer = v2.createElement(l_View_0, {
                    tag = "size-full aspect-1-1 padding-small", 
                    LayoutOrder = 1
                }, {
                    ThumbnailSkeleton = v2.createElement(l_Skeleton_0, {
                        Size = UDim2.fromScale(1, 1), 
                        radius = l_Radius_0.Small
                    })
                }), 
                Details = v2.createElement(l_View_0, {
                    tag = "size-full-1400 col align-y-center gap-xsmall padding-x-small", 
                    LayoutOrder = 2
                }, {
                    NameSkeleton = v2.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0.9, 0, 0, v23.Size.Size_350), 
                        radius = l_Radius_0.Small, 
                        LayoutOrder = 1
                    }), 
                    HandleSkeleton = v2.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0.6, 0, 0, v23.Size.Size_350), 
                        radius = l_Radius_0.Small, 
                        LayoutOrder = 2
                    })
                })
            });
        end;
    end, {
        v26, 
        v23
    });
    if v22.scrollingFrameStore then
        return v2.createElement(v14, {
            scrollingFrameAbsolutePositionY = v22.scrollingFrameStore.getAbsolutePositionY, 
            scrollingFrameAbsoluteSizeY = v22.scrollingFrameStore.getAbsoluteSizeY, 
            scrollingFrameCanvasPositionY = v22.scrollingFrameStore.getCanvasPositionY, 
            placeholder = v29, 
            placeholderLayoutOrder = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then v25 else v22.layoutOrder
        }, {
            PersonCard = v28
        });
    else
        return v28;
    end;
end);