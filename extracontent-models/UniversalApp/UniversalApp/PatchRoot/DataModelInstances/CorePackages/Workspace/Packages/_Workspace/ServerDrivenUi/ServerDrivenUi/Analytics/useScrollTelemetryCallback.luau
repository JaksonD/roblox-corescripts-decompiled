local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.UnifiedLogging);
local l_GetDisplayStore_0 = require(l_Parent_0.Display).GetDisplayStore;
local l_feedScroll_0 = require(l_Parent_0.ScrollTelemetry).feedScroll;
local l_SduiErrors_0 = require(l_Parent_0.SduiCoreSystem).SduiErrors;
return function(v6, v7, v8) --[[ Line: 17 ]] --[[ Name: useScrollTelemetryCallback ]]
    -- upvalues: v1 (copy), l_SduiErrors_0 (copy), l_GetDisplayStore_0 (copy), l_feedScroll_0 (copy)
    return (v1.useCallback(function(v9, v10, v11) --[[ Line: 23 ]]
        -- upvalues: v6 (copy), v7 (copy), v8 (copy), l_SduiErrors_0 (ref), l_GetDisplayStore_0 (ref), l_feedScroll_0 (ref)
        if v6 and v6.current ~= nil and v7.current then
            local l_current_0 = v7.current;
            local l_ScrollingDirection_0 = v6.current.ScrollingDirection;
            local v14 = 0;
            if l_ScrollingDirection_0 == Enum.ScrollingDirection.X then
                v14 = v6.current.AbsoluteSize.X;
            elseif l_ScrollingDirection_0 == Enum.ScrollingDirection.Y then
                v14 = v6.current.AbsoluteSize.Y;
            else
                v8.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.InvalidScrollDirection, {
                    name = ("%*"):format(l_current_0.collectionId), 
                    message = ("Direction %* is an unsupported option for feedScroll event"):format(l_ScrollingDirection_0.Name)
                }, v8.appPage);
            end;
            local v15 = l_GetDisplayStore_0(false).getViewportSize(false);
            local v16 = {
                distance = v9, 
                screenSizeX = v15.X, 
                screenSizeY = v15.Y, 
                scrollAreaSize = v14, 
                scrollDepth = if v14 > 0 then v9 / v14 else nil, 
                startDepth = if v14 > 0 then v11 / v14 else nil, 
                startPos = v11, 
                scrollDuration = v10, 
                sortPos = l_current_0.collectionPosition, 
                gameSetTypeId = tostring(l_current_0.collectionId), 
                gameSetTargetId = nil
            };
            l_feedScroll_0(v8.dependencies.eventIngest, v8.appPage, l_ScrollingDirection_0, v16);
        end;
    end, {
        v8, 
        v7, 
        v6
    }));
end;