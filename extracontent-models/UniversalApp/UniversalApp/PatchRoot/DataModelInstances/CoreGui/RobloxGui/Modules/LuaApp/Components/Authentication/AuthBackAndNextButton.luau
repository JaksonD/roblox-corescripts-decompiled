local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_0 = v4.Button;
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_ButtonSize_0 = v4.Enums.ButtonSize;
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v10 = require(l_Modules_0.LuaApp.Flags.FFlagUseStandardFoundationButtonVariant);
local v11 = v2.PureComponent:extend("AuthBackAndContinueButton");
v11.defaultProps = {
    size = UDim2.new(1, 0, 0, 36)
};
v11.init = function(v12) --[[ Line: 26 ]] --[[ Name: init ]]
    v12.backButtonOnActivated = function() --[[ Line: 27 ]]
        -- upvalues: v12 (copy)
        local l_navigateBack_0 = v12.props.navigateBack;
        local l_backButtonIsDisabled_0 = v12.props.backButtonIsDisabled;
        local l_backButtonIsLoading_0 = v12.props.backButtonIsLoading;
        if not l_backButtonIsDisabled_0 and not l_backButtonIsLoading_0 then
            l_navigateBack_0();
        end;
    end;
end;
v11.render = function(v16) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v2 (copy), l_Button_0 (copy), v10 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy)
    local l_size_0 = v16.props.size;
    local l_position_0 = v16.props.position;
    local l_anchorPoint_0 = v16.props.anchorPoint;
    local l_layoutOrder_0 = v16.props.layoutOrder;
    local l_backButtonIsDisabled_1 = v16.props.backButtonIsDisabled;
    local l_backButtonIsLoading_1 = v16.props.backButtonIsLoading;
    local l_nextButtonText_0 = v16.props.nextButtonText;
    local l_nextButtonIsDisabled_0 = v16.props.nextButtonIsDisabled;
    local l_nextButtonIsLoading_0 = v16.props.nextButtonIsLoading;
    local l_nextButtonOnActivated_0 = v16.props.nextButtonOnActivated;
    return v8({
        backButtonText = "CommonUI.Controls.Action.Back"
    })(function(v27) --[[ Line: 54 ]]
        -- upvalues: v2 (ref), l_size_0 (copy), l_position_0 (copy), l_anchorPoint_0 (copy), l_layoutOrder_0 (copy), l_Button_0 (ref), v10 (ref), l_ButtonVariant_0 (ref), l_ButtonSize_0 (ref), l_backButtonIsDisabled_1 (copy), l_backButtonIsLoading_1 (copy), v16 (copy), l_nextButtonText_0 (copy), l_nextButtonIsDisabled_0 (copy), l_nextButtonIsLoading_0 (copy), l_nextButtonOnActivated_0 (copy)
        return v2.createElement("Frame", {
            Size = l_size_0, 
            Position = l_position_0, 
            AnchorPoint = l_anchorPoint_0, 
            LayoutOrder = l_layoutOrder_0, 
            BackgroundTransparency = 1
        }, {
            BackButton = v2.createElement(l_Button_0, {
                variant = if v10 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Subtle, 
                size = l_ButtonSize_0.Medium, 
                text = v27.backButtonText, 
                isDisabled = l_backButtonIsDisabled_1, 
                isLoading = l_backButtonIsLoading_1, 
                onActivated = v16.backButtonOnActivated, 
                width = UDim.new(0.5, -6)
            }), 
            NextButton = v2.createElement(l_Button_0, {
                variant = l_ButtonVariant_0.SubEmphasis, 
                size = l_ButtonSize_0.Medium, 
                text = l_nextButtonText_0, 
                isDisabled = l_nextButtonIsDisabled_0, 
                isLoading = l_nextButtonIsLoading_0, 
                onActivated = l_nextButtonOnActivated_0, 
                width = UDim.new(0.5, -6), 
                Position = UDim2.new(1, 0, 0, 0), 
                AnchorPoint = Vector2.new(1, 0)
            })
        });
    end);
end;
return (v3.connect(nil, function(v28) --[[ Line: 88 ]]
    -- upvalues: v9 (copy)
    return {
        navigateBack = function() --[[ Line: 90 ]] --[[ Name: navigateBack ]]
            -- upvalues: v28 (copy), v9 (ref)
            return v28(v9());
        end
    };
end)(v11));