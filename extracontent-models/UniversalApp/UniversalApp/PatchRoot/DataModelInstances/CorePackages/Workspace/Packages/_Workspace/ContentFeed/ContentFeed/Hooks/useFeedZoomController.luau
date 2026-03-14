local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_1.CapturesCommon);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.ReactOtter);
local v6 = require(l_Parent_1.RobloxAppHooks);
local v7 = require(l_Parent_1.ReactUtils);
local v8 = require(l_Parent_0.App.FeedContext);
local l_useAnimatedBinding_0 = v5.useAnimatedBinding;
local l_useCallback_0 = v4.useCallback;
local l_useEffect_0 = v4.useEffect;
local l_useEventConnection_0 = v7.useEventConnection;
local l_useGuiInset_0 = v3.Hooks.useGuiInset;
local l_useRef_0 = v4.useRef;
local l_useScreenSize_0 = v6.useScreenSize;
local l_useState_0 = v4.useState;
return function(v17, v18, v19, v20) --[[ Line: 26 ]] --[[ Name: useFeedZoomController ]]
    -- upvalues: v4 (copy), v8 (copy), l_useGuiInset_0 (copy), l_useScreenSize_0 (copy), l_useRef_0 (copy), l_useState_0 (copy), l_useAnimatedBinding_0 (copy), l_useEffect_0 (copy), v5 (copy), l_useCallback_0 (copy), l_useEventConnection_0 (copy), l_UserInputService_0 (copy)
    local v21 = v4.useContext(v8);
    local v22 = l_useGuiInset_0();
    local v23 = l_useScreenSize_0();
    local l_isZooming_0 = v21.isZooming;
    local l_setIsZooming_0 = v21.setIsZooming;
    local v26 = l_useRef_0(nil);
    local v27 = l_useRef_0(nil);
    local v28 = l_useRef_0(1);
    local v29 = l_useRef_0(false);
    local v30 = l_useRef_0(Vector2.new(0, 0));
    local v31, v32 = l_useState_0(false);
    local v33, v34 = l_useAnimatedBinding_0(0);
    local v35, v36 = l_useAnimatedBinding_0(0);
    l_useEffect_0(function() --[[ Line: 44 ]]
        -- upvalues: v31 (copy), v26 (copy)
        if not v31 then
            v26.current = nil;
        end;
    end, {
        v31
    });
    l_useEffect_0(function() --[[ Line: 50 ]]
        -- upvalues: v17 (copy), v20 (copy), l_isZooming_0 (copy), v34 (copy), v5 (ref)
        if not v17 or v20 then
            return;
        elseif l_isZooming_0 then
            v34(v5.spring(1, {
                frequency = 4, 
                dampingRatio = 1
            }));
            return;
        else
            v34(v5.spring(0, {
                frequency = 4, 
                dampingRatio = 1
            }));
            return;
        end;
    end, {
        v17, 
        l_isZooming_0, 
        v34
    });
    local v38 = l_useCallback_0(function() --[[ Line: 68 ]]
        -- upvalues: v17 (copy), v32 (copy), v36 (copy), v5 (ref)
        if not v17 then
            return;
        else
            v32(true);
            v36(v5.instant(0));
            task.delay(0.1, function() --[[ Line: 75 ]]
                -- upvalues: v5 (ref), v36 (ref)
                local v37 = v5.spring(1, {
                    dampingRatio = 1, 
                    frequency = 4
                });
                v36(v37);
            end);
            task.delay(0.2, function() --[[ Line: 82 ]]
                -- upvalues: v32 (ref)
                v32(false);
            end);
            return;
        end;
    end, {
        v17
    });
    l_useEffect_0(function() --[[ Line: 87 ]]
        -- upvalues: v17 (copy), v27 (copy), v18 (copy)
        if not v17 and v27.current then
            v27.current.Size = UDim2.new(1, 0, 0, v18);
            v27.current.Position = UDim2.fromScale(0.5, 0.5);
        end;
    end, {
        v17
    });
    l_useEventConnection_0(l_UserInputService_0.TouchPinch, function(v39, v40, _, v42, _) --[[ Line: 96 ]]
        -- upvalues: v29 (copy), v26 (copy), v38 (copy), l_setIsZooming_0 (copy), v17 (copy), v20 (copy), v31 (copy), v27 (copy), v22 (copy), v19 (copy), v18 (copy), v28 (copy), v30 (copy), v23 (copy)
        if v42 == Enum.UserInputState.End then
            if v29.current or not v26.current then
                return;
            else
                v38();
                l_setIsZooming_0(false);
                return;
            end;
        elseif not v17 or v20 or v31 then
            return;
        elseif not v27.current then
            return;
        else
            if v42 == Enum.UserInputState.Begin then
                v29.current = false;
                local v44 = (v39[1].X + v39[2].X) / 2;
                local v45 = v22.top + (v39[1].Y + v39[2].Y) / 2;
                local l_ContentFeedItem_0 = v27.current:FindFirstChild("ContentFeedItem");
                if not l_ContentFeedItem_0 then
                    return;
                else
                    local l_AbsolutePosition_0 = l_ContentFeedItem_0.AbsolutePosition;
                    if v44 < l_AbsolutePosition_0.X or l_AbsolutePosition_0.X + v19 < v44 then
                        return;
                    elseif v45 < v22.top + l_AbsolutePosition_0.Y or v22.top + l_AbsolutePosition_0.Y + v18 < v45 then
                        return;
                    else
                        v26.current = Vector2.new(v44, v45);
                        l_setIsZooming_0(true);
                    end;
                end;
            end;
            if not v26.current then
                return;
            elseif v29.current then
                return;
            elseif #v39 < 2 then
                v29.current = true;
                v38();
                l_setIsZooming_0(false);
                return;
            else
                local v48 = math.max(1, v40);
                v28.current = v48;
                local v49 = ((v39[1].X + v39[2].X) / 2 - v26.current.X) / v48;
                local v50 = ((v39[1].Y + v39[2].Y) / 2 - v26.current.Y) / v48;
                v30.current = Vector2.new(v49, v50);
                v27.current.Size = UDim2.new(v48, 0, 0, v48 * v18);
                v27.current.Position = UDim2.new(0.5, (0.5 - (v26.current.X - v49) / v23.X) * v23.X * (v48 - 1), 0.5, (0.5 - (v26.current.Y - v50) / v23.Y) * v23.Y * (v48 - 1));
                return;
            end;
        end;
    end);
    return {
        initialZoomFocusPosition = v26, 
        itemContainerRef = v27, 
        itemFinalScale = v28, 
        nonItemTransparency = v33, 
        zoomAverageDelta = v30, 
        zoomEndTransition = v35, 
        zoomEndTransitionActive = v31
    };
end;