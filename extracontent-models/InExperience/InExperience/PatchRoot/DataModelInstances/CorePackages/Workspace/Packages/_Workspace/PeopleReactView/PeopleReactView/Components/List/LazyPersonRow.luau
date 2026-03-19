local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RobloxAppEnums);
local l_useDeviceOrientation_0 = require(l_Parent_0.RobloxAppHooks).useDeviceOrientation;
local v5 = require(l_Parent_0.Foundation);
local l_Radius_0 = v5.Enums.Radius;
local l_useTokens_0 = v5.Hooks.useTokens;
local l_Skeleton_0 = v5.Skeleton;
local l_View_0 = v5.View;
local v10 = require(l_Parent_0.PeopleService);
local _ = require(l_script_FirstAncestor_0.Stores.GetScrollingFrameStore);
local v12 = require(l_script_FirstAncestor_0.Components.List.PersonRow);
local v13 = require(l_script_FirstAncestor_0.Components.Common.LazyScrollingComponent);
local v14 = v10.getService("Flags");
local l_FFlagPeoplePageRemoveSkeletons_0 = v14.FFlagPeoplePageRemoveSkeletons;
local l_FFlagPeoplePageRemoveUseMemoElements_0 = v14.FFlagPeoplePageRemoveUseMemoElements;
local v19 = v2.memo(function(v17) --[[ Line: 33 ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagPeoplePageRemoveSkeletons_0 (copy), v2 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    local v18 = l_useTokens_0();
    if l_FFlagPeoplePageRemoveSkeletons_0 then
        return v2.createElement(l_View_0, {
            tag = {
                ["bg-surface-200 radius-medium"] = true, 
                ["size-full-2600"] = v17.isPortrait, 
                ["size-full-1500"] = not v17.isPortrait
            }
        });
    else
        return v2.createElement(l_View_0, {
            tag = {
                ["row bg-surface-200 gap-medium padding-small radius-medium"] = true, 
                ["size-full-2600"] = v17.isPortrait, 
                ["size-full-1500"] = not v17.isPortrait
            }
        }, {
            ThumbnailContainer = v2.createElement(l_View_0, {
                tag = "size-1200", 
                LayoutOrder = 1
            }, {
                ThumbnailSkeleton = v2.createElement(l_Skeleton_0, {
                    Size = UDim2.fromScale(1, 1), 
                    radius = l_Radius_0.Circle
                })
            }), 
            Details = v2.createElement(l_View_0, {
                tag = "col grow size-0-full gap-medium", 
                LayoutOrder = 2
            }, {
                NameSkeleton = v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.9, 0, 0, v18.Size.Size_350), 
                    radius = l_Radius_0.Small, 
                    LayoutOrder = 1
                }), 
                HandleSkeleton = v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.6, 0, 0, v18.Size.Size_350), 
                    radius = l_Radius_0.Small, 
                    LayoutOrder = 2
                })
            })
        });
    end;
end);
return v2.memo(function(v20) --[[ Line: 88 ]]
    -- upvalues: l_useTokens_0 (copy), l_useDeviceOrientation_0 (copy), v3 (copy), l_FFlagPeoplePageRemoveUseMemoElements_0 (copy), v2 (copy), v12 (copy), v19 (copy), l_FFlagPeoplePageRemoveSkeletons_0 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), v13 (copy)
    local v21 = l_useTokens_0();
    local v22 = l_useDeviceOrientation_0() == v3.DeviceOrientationMode.Portrait;
    local v23 = if l_FFlagPeoplePageRemoveUseMemoElements_0 then v2.createElement(v12, {
        person = v20.person, 
        layoutOrder = v20.layoutOrder
    }) else v2.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: v2 (ref), v12 (ref), v20 (copy)
        return v2.createElement(v12, {
            person = v20.person, 
            layoutOrder = v20.layoutOrder
        });
    end, {
        v20.person, 
        v20.layoutOrder
    });
    local v24 = if l_FFlagPeoplePageRemoveUseMemoElements_0 then v2.createElement(v19, {
        isPortrait = v22
    }) else v2.useMemo(function() --[[ Line: 116 ]]
        -- upvalues: l_FFlagPeoplePageRemoveSkeletons_0 (ref), v2 (ref), l_View_0 (ref), v22 (copy), l_Skeleton_0 (ref), l_Radius_0 (ref), v21 (copy)
        if l_FFlagPeoplePageRemoveSkeletons_0 then
            return v2.createElement(l_View_0, {
                tag = {
                    ["bg-surface-200 radius-medium"] = true, 
                    ["size-full-2600"] = v22, 
                    ["size-full-1500"] = not v22
                }
            });
        else
            return v2.createElement(l_View_0, {
                tag = {
                    ["row bg-surface-200 gap-medium padding-small radius-medium"] = true, 
                    ["size-full-2600"] = v22, 
                    ["size-full-1500"] = not v22
                }
            }, {
                ThumbnailContainer = v2.createElement(l_View_0, {
                    tag = "size-1200", 
                    LayoutOrder = 1
                }, {
                    ThumbnailSkeleton = v2.createElement(l_Skeleton_0, {
                        Size = UDim2.fromScale(1, 1), 
                        radius = l_Radius_0.Circle
                    })
                }), 
                Details = v2.createElement(l_View_0, {
                    tag = "col grow size-0-full gap-medium", 
                    LayoutOrder = 2
                }, {
                    NameSkeleton = v2.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0.9, 0, 0, v21.Size.Size_350), 
                        radius = l_Radius_0.Small, 
                        LayoutOrder = 1
                    }), 
                    HandleSkeleton = v2.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0.6, 0, 0, v21.Size.Size_350), 
                        radius = l_Radius_0.Small, 
                        LayoutOrder = 2
                    })
                })
            });
        end;
    end, {
        v22, 
        v21
    });
    if v20.scrollingFrameStore then
        return v2.createElement(v13, {
            scrollingFrameAbsolutePositionY = v20.scrollingFrameStore.getAbsolutePositionY, 
            scrollingFrameAbsoluteSizeY = v20.scrollingFrameStore.getAbsoluteSizeY, 
            scrollingFrameCanvasPositionY = v20.scrollingFrameStore.getCanvasPositionY, 
            placeholder = v24, 
            placeholderLayoutOrder = v20.layoutOrder
        }, {
            PersonRow = v23
        });
    else
        return v23;
    end;
end);