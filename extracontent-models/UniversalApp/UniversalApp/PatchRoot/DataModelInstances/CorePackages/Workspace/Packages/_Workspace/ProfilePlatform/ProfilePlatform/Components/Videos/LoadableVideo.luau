local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_Skeleton_0 = v3.Skeleton;
local l_View_0 = v3.View;
local l_LoadingState_0 = require(l_script_FirstAncestor_0.Common.Enums).LoadingState;
return function(v8) --[[ Line: 28 ]]
    -- upvalues: v4 (copy), l_LoadingState_0 (copy), l_ContentProvider_0 (copy), l_View_0 (copy), l_Skeleton_0 (copy)
    local v9, v10 = v4.useState(l_LoadingState_0.Loading);
    local v11, v12 = v4.useState(Vector2.new(0, 0));
    v4.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v8 (copy), l_ContentProvider_0 (ref), v10 (copy), l_LoadingState_0 (ref)
        if v8.Video == nil or v8.Video == "" then
            return;
        else
            local v14 = l_ContentProvider_0:GetAssetFetchStatusChangedSignal(v8.Video):Connect(function(v13) --[[ Line: 38 ]]
                -- upvalues: v10 (ref), l_LoadingState_0 (ref)
                if v13 == Enum.AssetFetchStatus.Failure then
                    v10(l_LoadingState_0.Failed);
                end;
            end);
            return function() --[[ Line: 44 ]]
                -- upvalues: v14 (copy), v10 (ref), l_LoadingState_0 (ref)
                v14:Disconnect();
                v10(l_LoadingState_0.Loading);
            end;
        end;
    end, {
        v8.Video
    });
    local v17 = v4.useCallback(function(v15) --[[ Line: 50 ]]
        -- upvalues: v12 (copy), v8 (copy)
        local l_Resolution_0 = v15.Resolution;
        v12(l_Resolution_0);
        if v8.onResolutionChanged then
            v8.onResolutionChanged(l_Resolution_0);
        end;
    end, {
        v8.onResolutionChanged, 
        v12
    });
    local v19 = v4.useCallback(function(v18) --[[ Line: 59 ]]
        -- upvalues: v9 (copy), l_LoadingState_0 (ref), v10 (copy), v8 (copy)
        if v9 == l_LoadingState_0.Loading then
            v10(l_LoadingState_0.Finished);
        end;
        if v8.onLoaded then
            v8.onLoaded(v18);
        end;
    end, {
        v9, 
        v8.onLoaded
    });
    if v9 == l_LoadingState_0.Failed then
        return v8.renderOnFailed();
    else
        local l_createElement_0 = v4.createElement;
        local l_l_View_0_0 = l_View_0;
        local v22 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            isDisabled = true, 
            Position = v8.Position, 
            Size = v8.Size, 
            ZIndex = v8.ZIndex
        };
        local v23 = {};
        local l_createElement_1 = v4.createElement;
        local v25 = "VideoFrame";
        local v26 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Looped = v8.Looped == nil or v8.Looped, 
            Playing = v8.Playing, 
            Position = UDim2.fromScale(0.5, 0.5), 
            ref = v8.videoRef, 
            Size = UDim2.fromScale(1, 1), 
            Video = v8.Video
        };
        local v27 = false;
        if v11.X > 0 then
            v27 = v11.Y > 0;
        end;
        v26.Visible = v27;
        v26[v4.Change.Resolution] = v17;
        v26[v4.Event.Loaded] = v19;
        v23.VideoFrame = l_createElement_1(v25, v26, {
            Corner = if v8.cornerRadius then v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v8.cornerRadius)
            }) else nil
        });
        v23.Shimmer = if v9 ~= l_LoadingState_0.Finished then v4.createElement(l_Skeleton_0, {
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 2
        }) else nil;
        return l_createElement_0(l_l_View_0_0, v22, v23);
    end;
end;