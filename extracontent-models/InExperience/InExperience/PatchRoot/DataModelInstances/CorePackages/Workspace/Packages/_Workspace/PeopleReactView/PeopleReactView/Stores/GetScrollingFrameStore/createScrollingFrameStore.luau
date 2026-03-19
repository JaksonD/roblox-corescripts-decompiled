local l_Parent_0 = script:FindFirstAncestor("PeopleReactView").Parent;
local v1 = require(l_Parent_0.Signals);
return function() --[[ Line: 15 ]] --[[ Name: createScrollingFrameStore ]]
    -- upvalues: v1 (copy)
    local v2, v3 = v1.createSignal(0);
    local v4, v5 = v1.createSignal(0);
    local v6, v7 = v1.createSignal(0);
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    local function v12(v11) --[[ Line: 24 ]]
        -- upvalues: v8 (ref), v9 (ref), v10 (ref), v3 (copy), v5 (copy), v7 (copy)
        if v8 then
            v8:Disconnect();
        end;
        if v9 then
            v9:Disconnect();
        end;
        if v10 then
            v10:Disconnect();
        end;
        v3(v11.AbsolutePosition.Y);
        v5(v11.AbsoluteSize.Y);
        v7(v11.CanvasPosition.Y);
        v8 = v11:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 39 ]]
            -- upvalues: v3 (ref), v11 (copy)
            v3(v11.AbsolutePosition.Y);
        end);
        v9 = v11:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 43 ]]
            -- upvalues: v5 (ref), v11 (copy)
            v5(v11.AbsoluteSize.Y);
        end);
        v10 = v11:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 47 ]]
            -- upvalues: v7 (ref), v11 (copy)
            v7(v11.CanvasPosition.Y);
        end);
    end;
    local function v13() --[[ Line: 52 ]]
        -- upvalues: v8 (ref), v9 (ref), v10 (ref)
        if v8 then
            v8:Disconnect();
        end;
        if v9 then
            v9:Disconnect();
        end;
        if v10 then
            v10:Disconnect();
        end;
    end;
    return {
        getAbsolutePositionY = v2, 
        getAbsoluteSizeY = v4, 
        getCanvasPositionY = v6, 
        setScrollingFrame = v12, 
        cleanUp = v13
    };
end;