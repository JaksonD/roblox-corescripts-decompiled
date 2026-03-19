local l_Parent_0 = script:FindFirstAncestor("PeopleReactView").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Signals);
local l_View_0 = require(l_Parent_0.Foundation).View;
local l_FFlagEnablePeopleListLazyRender_0 = require(l_Parent_0.PeopleService).getService("Flags").FFlagEnablePeopleListLazyRender;
local v5 = game:DefineFastInt("PeoplePageLazyRenderThreshold", 100);
LazyScrollingComponent = function(v6) --[[ Line: 29 ]] --[[ Name: LazyScrollingComponent ]]
    -- upvalues: v1 (copy), v5 (copy), v2 (copy), l_View_0 (copy), l_FFlagEnablePeopleListLazyRender_0 (copy)
    local v7, v8 = v1.useState(false);
    local v12 = v1.useCallback(function(v9, v10, v11) --[[ Line: 33 ]]
        -- upvalues: v5 (ref)
        return v9 < v10 + v11 + v5;
    end, {});
    local v13 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: v7 (copy), v13 (copy), v8 (copy), v12 (copy), v6 (copy), v2 (ref)
        if v7 or not v13.current then
            return;
        else
            v8(v12(v13.current.AbsolutePosition.Y, v6.scrollingFrameAbsolutePositionY(false), v6.scrollingFrameAbsoluteSizeY(false)));
            local v14 = v13.current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 59 ]]
                -- upvalues: v13 (ref), v8 (ref), v12 (ref), v6 (ref)
                if not v13.current then
                    return;
                else
                    v8(v12(v13.current.AbsolutePosition.Y, v6.scrollingFrameAbsolutePositionY(false), v6.scrollingFrameAbsoluteSizeY(false)));
                    return;
                end;
            end);
            local v19 = v2.createEffect(function(v15) --[[ Line: 74 ]]
                -- upvalues: v6 (ref), v13 (ref), v8 (ref), v12 (ref)
                local _ = v6.scrollingFrameCanvasPositionY(v15);
                local v17 = v6.scrollingFrameAbsolutePositionY(v15);
                local v18 = v6.scrollingFrameAbsoluteSizeY(v15);
                if not v13.current then
                    return;
                else
                    v8(v12(v13.current.AbsolutePosition.Y, v17, v18));
                    return;
                end;
            end);
            return function() --[[ Line: 89 ]]
                -- upvalues: v14 (copy), v19 (copy)
                if v14 then
                    v14:Disconnect();
                end;
                v19();
            end;
        end;
    end, {
        v7
    });
    if not v7 then
        return v1.createElement(l_View_0, {
            tag = l_FFlagEnablePeopleListLazyRender_0 and "size-full-0 auto-xy" or "auto-xy", 
            ref = v13, 
            LayoutOrder = v6.placeholderLayoutOrder
        }, {
            Placeholder = v6.placeholder
        });
    else
        return v6.children;
    end;
end;
return v1.memo(LazyScrollingComponent);