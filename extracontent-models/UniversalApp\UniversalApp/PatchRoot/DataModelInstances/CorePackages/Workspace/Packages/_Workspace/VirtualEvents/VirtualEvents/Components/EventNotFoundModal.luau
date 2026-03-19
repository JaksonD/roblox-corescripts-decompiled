local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useSelector_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local l_PartialPageModal_0 = v2.App.Dialog.Modal.PartialPageModal;
local l_EmptyState_0 = v2.App.Indicator.EmptyState;
local function v8(v7) --[[ Line: 11 ]] --[[ Name: selectScreenSize ]]
    return v7.ScreenSize;
end;
return function(v9) --[[ Line: 19 ]] --[[ Name: EventNotFoundModal ]]
    -- upvalues: l_useSelector_0 (copy), v8 (copy), l_useLocalization_0 (copy), v1 (copy), l_PartialPageModal_0 (copy), l_EmptyState_0 (copy)
    local v10 = l_useSelector_0(v8);
    local v11 = l_useLocalization_0({
        notFound = "Feature.VirtualEvents.EventNotFound"
    });
    return v1.createElement(l_PartialPageModal_0, {
        position = UDim2.fromScale(0.5, 0.5), 
        anchorPoint = Vector2.new(0.5, 0.5), 
        screenSize = v10 - Vector2.new(40, 0), 
        contentPadding = UDim.new(0, 24), 
        onCloseClicked = v9.onClose
    }, {
        Wrapper = v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            Padding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 80), 
                PaddingBottom = UDim.new(0, 20)
            }), 
            EventNotFound = v1.createElement(l_EmptyState_0, {
                text = v11.notFound
            })
        })
    });
end;