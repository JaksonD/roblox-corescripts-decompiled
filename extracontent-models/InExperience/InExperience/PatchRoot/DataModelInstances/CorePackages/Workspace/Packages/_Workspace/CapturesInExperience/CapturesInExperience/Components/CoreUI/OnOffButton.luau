local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local l_SegmentedControl_0 = require(l_Parent_1.UIBlox).App.Control.SegmentedControl;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v9 = require(l_Parent_0.Constants);
local v10 = require(l_Parent_0.Analytics.EventNames);
local v11 = require(l_Parent_0.Utils.onToggleActivation);
local v12 = require(l_Parent_0.Analytics.useAnalytics);
return function(v13) --[[ Line: 25 ]]
    -- upvalues: v12 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v9 (copy), l_useLocalization_0 (copy), v3 (copy), v11 (copy), v10 (copy), l_SegmentedControl_0 (copy)
    local v14 = v12();
    local v15 = l_useDispatch_0();
    local v17 = l_useSelector_0(function(v16) --[[ Line: 29 ]]
        -- upvalues: v9 (ref)
        return v16[v9.RoduxKey].IsCapturesCoreGuiEnabled;
    end);
    local v19 = l_useSelector_0(function(v18) --[[ Line: 33 ]]
        -- upvalues: v9 (ref)
        return v18[v9.RoduxKey].IsActive;
    end);
    local v20 = l_useLocalization_0({
        offText = "Feature.Captures.Control.Off", 
        onText = "Feature.Captures.Control.On"
    });
    local v22 = v3.useCallback(function(v21) --[[ Line: 42 ]]
        -- upvalues: v11 (ref), v19 (copy), v14 (copy), v15 (copy), v10 (ref)
        v11(v19, v21, v14.fireEvent, v15, v10.CapturesActivatedInGameMenu, v10.CapturesDeactivatedInGameMenu);
    end, {
        v19
    });
    return v3.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(v13.width, v13.height)
    }, {
        Control = v3.createElement(l_SegmentedControl_0, {
            height = v13.height, 
            onTabActivated = v22, 
            selectedTabIndex = v19 and 1 or 2, 
            tabs = {
                {
                    tabName = v20.onText, 
                    isDisabled = not v17
                }, 
                {
                    tabName = v20.offText, 
                    isDisabled = not v17
                }
            }, 
            width = UDim.new(0, v13.width)
        })
    });
end;