local l_Parent_0 = script:FindFirstAncestor("PageLoadTracker").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(script.Parent.Parent.createPageTracker);
local v5 = require(script.Parent.Parent.PageTrackerContext);
local v6 = require(script.Parent.Parent.isElementInScreenBounds);
local v7 = require(script.Parent.Parent.PageLoadConfig);
local v8 = require(script.Parent.Parent.VisualDebugManager);
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local function v14(v10, v11) --[[ Line: 16 ]] --[[ Name: usePageTracker ]]
    -- upvalues: v1 (copy), v4 (copy), v3 (copy), l_ExperienceService_0 (copy)
    local v12 = v1.useMemo(function() --[[ Line: 17 ]]
        -- upvalues: v4 (ref)
        return v4();
    end, {});
    if v10 then
        v12:start(v11);
    else
        v12:stop();
    end;
    v1.useEffect(function() --[[ Line: 27 ]]
        -- upvalues: v12 (copy), v3 (ref), l_ExperienceService_0 (ref)
        v12:sendMilestone("first_react_frame_rendered");
        local v13 = nil;
        if v3.FFlagLuaAppPageLoadTrackerJoinExperienceFix then
            v13 = l_ExperienceService_0:RegisterForExperienceJoin(function() --[[ Line: 35 ]]
                -- upvalues: v12 (ref)
                v12:stop();
            end);
        end;
        return function() --[[ Line: 40 ]]
            -- upvalues: v12 (ref), v3 (ref), v13 (ref)
            v12:stop();
            if v3.FFlagLuaAppPageLoadTrackerJoinExperienceFix and v13 then
                v13:Disconnect();
            end;
        end;
    end, {});
    return v12;
end;
return function(v15) --[[ Line: 57 ]] --[[ Name: ComponentTracker ]]
    -- upvalues: v14 (copy), v1 (copy), v3 (copy), v8 (copy), l_useSelector_0 (copy), v7 (copy), v6 (copy), v5 (copy)
    local v16 = v14(v15.isActive, v15.componentName);
    local v17 = v1.useRef(nil);
    local v18 = v1.useRef(nil);
    if v3.FFlagDebugEnablePageLoadTrackerVisualizer and v17.current == nil then
        v17.current = v8.new();
    end;
    local v20 = l_useSelector_0(function(v19) --[[ Line: 69 ]]
        -- upvalues: v7 (ref)
        return v19.ScreenSize or v7.SCREEN_BOUNDS.DEFAULT_SCREEN_SIZE;
    end);
    local v22 = l_useSelector_0(function(v21) --[[ Line: 73 ]]
        -- upvalues: v7 (ref)
        return v21.TopBar and v21.TopBar.topBarHeight or v7.SCREEN_BOUNDS.DEFAULT_TOP_BAR_HEIGHT;
    end);
    local function _(v23) --[[ Line: 77 ]] --[[ Name: addTrackingToChild ]]
        -- upvalues: v6 (ref), v20 (copy), v22 (copy), v16 (copy), v3 (ref), v17 (copy)
        if not v23:IsA("GuiObject") then
            return;
        else
            if v6(v23, v20, v22) then
                v16:onComponentAdded(v23);
                if v3.FFlagDebugEnablePageLoadTrackerVisualizer then
                    v17.current:highlightComponent(v23);
                end;
            end;
            return;
        end;
    end;
    local function v31(v25) --[[ Line: 90 ]] --[[ Name: setupChildTracking ]]
        -- upvalues: v3 (ref), v6 (ref), v20 (copy), v22 (copy), v16 (copy), v17 (copy)
        for _, v27 in v25:GetDescendants() do
            if v3.FFlagLuaAppImproveComponentTrackingTiming then
                task.defer(function() --[[ Line: 93 ]]
                    -- upvalues: v27 (copy), v6 (ref), v20 (ref), v22 (ref), v16 (ref), v3 (ref), v17 (ref)
                    local l_v27_0 = v27;
                    if not l_v27_0:IsA("GuiObject") then
                        return;
                    else
                        if v6(l_v27_0, v20, v22) then
                            v16:onComponentAdded(l_v27_0);
                            if v3.FFlagDebugEnablePageLoadTrackerVisualizer then
                                v17.current:highlightComponent(l_v27_0);
                            end;
                        end;
                        return;
                    end;
                end);
            elseif v27:IsA("GuiObject") and v6(v27, v20, v22) then
                v16:onComponentAdded(v27);
                if v3.FFlagDebugEnablePageLoadTrackerVisualizer then
                    v17.current:highlightComponent(v27);
                end;
            end;
        end;
        return (v25.DescendantAdded:Connect(function(v29) --[[ Line: 100 ]]
            -- upvalues: v3 (ref), v6 (ref), v20 (ref), v22 (ref), v16 (ref), v17 (ref)
            if v3.FFlagLuaAppImproveComponentTrackingTiming then
                task.defer(function() --[[ Line: 106 ]]
                    -- upvalues: v29 (copy), v6 (ref), v20 (ref), v22 (ref), v16 (ref), v3 (ref), v17 (ref)
                    local l_v29_0 = v29;
                    if not l_v29_0:IsA("GuiObject") then
                        return;
                    else
                        if v6(l_v29_0, v20, v22) then
                            v16:onComponentAdded(l_v29_0);
                            if v3.FFlagDebugEnablePageLoadTrackerVisualizer then
                                v17.current:highlightComponent(l_v29_0);
                            end;
                        end;
                        return;
                    end;
                end);
                return;
            elseif not v29:IsA("GuiObject") then
                return;
            else
                if v6(v29, v20, v22) then
                    v16:onComponentAdded(v29);
                    if v3.FFlagDebugEnablePageLoadTrackerVisualizer then
                        v17.current:highlightComponent(v29);
                    end;
                end;
                return;
            end;
        end));
    end;
    if v3.FFlagDebugEnablePageLoadTrackerVisualizer then
        v1.useEffect(function() --[[ Line: 117 ]]
            -- upvalues: v17 (copy)
            return function() --[[ Line: 118 ]]
                -- upvalues: v17 (ref)
                v17.current:destroy();
            end;
        end, {});
    end;
    v1.useLayoutEffect(function() --[[ Line: 124 ]]
        -- upvalues: v15 (copy), v18 (copy), v31 (copy), v3 (ref), v16 (copy)
        if v15.isActive then
            local l_current_0 = v18.current;
            local v33 = v31(l_current_0);
            if v3.FFlagPageLoadAllowImprovedDisconnectTiming then
                v16.onCompleteSignal:connect(function() --[[ Line: 129 ]]
                    -- upvalues: v33 (copy)
                    v33:Disconnect();
                end);
                return;
            else
                return function() --[[ Line: 134 ]]
                    -- upvalues: v33 (copy)
                    v33:Disconnect();
                end;
            end;
        else
            return;
        end;
    end, {
        v15.isActive
    });
    return v1.createElement("Frame", {
        ref = v18, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        PageTrackerContext = v1.createElement(v5.Provider, {
            value = v16
        }, v15.children)
    });
end;