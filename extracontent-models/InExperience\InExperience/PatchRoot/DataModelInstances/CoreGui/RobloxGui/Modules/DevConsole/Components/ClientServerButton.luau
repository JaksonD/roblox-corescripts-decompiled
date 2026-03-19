local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.Parent.Constants);
local l_FrameHeight_0 = v2.UtilityBarFormatting.FrameHeight;
local l_SmallFrameHeight_0 = v2.UtilityBarFormatting.SmallFrameHeight;
local l_ClientServerButtonWidth_0 = v2.UtilityBarFormatting.ClientServerButtonWidth;
local l_ClientServerDropDownWidth_0 = v2.UtilityBarFormatting.ClientServerDropDownWidth;
local l_UtilBar_0 = v2.Font.UtilBar;
local l_UtilBar_1 = v2.DefaultFontSize.UtilBar;
local l_Text_0 = v2.Color.Text;
local v10 = require(script.Parent.FullScreenDropDownButton);
local v11 = require(script.Parent.DropDown);
local v12 = UDim2.new(0, l_ClientServerButtonWidth_0, 0, l_FrameHeight_0);
local v13 = {
    "Client", 
    "Server"
};
local v14 = v1.Component:extend("ClientServerButton");
v14.init = function(v15) --[[ Line: 21 ]] --[[ Name: init ]]
    v15.dropDownCallback = function(v16) --[[ Line: 22 ]]
        -- upvalues: v15 (copy)
        if v16 == 1 then
            v15.props.onClientButton();
            return;
        else
            if v16 == 2 then
                v15.props.onServerButton();
            end;
            return;
        end;
    end;
end;
v14.render = function(v17) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v1 (copy), v10 (copy), l_ClientServerDropDownWidth_0 (copy), l_SmallFrameHeight_0 (copy), v13 (copy), v11 (copy), l_ClientServerButtonWidth_0 (copy), l_FrameHeight_0 (copy), l_UtilBar_1 (copy), l_Text_0 (copy), l_UtilBar_0 (copy), v12 (copy)
    local l_formFactor_0 = v17.props.formFactor;
    local l_useDropDown_0 = v17.props.useDropDown;
    local l_isClientView_0 = v17.props.isClientView;
    local l_layoutOrder_0 = v17.props.layoutOrder;
    local l_onServerButton_0 = v17.props.onServerButton;
    local l_onClientButton_0 = v17.props.onClientButton;
    local l_SelectedBlue_0 = v2.Color.SelectedBlue;
    local l_UnselectedGray_0 = v2.Color.UnselectedGray;
    if l_isClientView_0 then
        l_UnselectedGray_0 = v2.Color.SelectedBlue;
        l_SelectedBlue_0 = v2.Color.UnselectedGray;
    end;
    if l_formFactor_0 == v2.FormFactor.Small then
        return v1.createElement(v10, {
            buttonSize = UDim2.new(0, l_ClientServerDropDownWidth_0, 0, l_SmallFrameHeight_0), 
            dropDownList = v13, 
            selectedIndex = l_isClientView_0 and 1 or 2, 
            onSelection = v17.dropDownCallback, 
            layoutOrder = l_layoutOrder_0
        });
    elseif l_useDropDown_0 then
        return v1.createElement(v11, {
            buttonSize = UDim2.new(0, l_ClientServerDropDownWidth_0, 0, l_SmallFrameHeight_0), 
            dropDownList = v13, 
            selectedIndex = l_isClientView_0 and 1 or 2, 
            onSelection = v17.dropDownCallback, 
            layoutOrder = l_layoutOrder_0
        });
    else
        return v1.createElement("Frame", {
            Size = UDim2.new(0, 2 * l_ClientServerButtonWidth_0, 0, l_FrameHeight_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0
        }, {
            ClientButton = v1.createElement("TextButton", {
                Text = v13[1], 
                TextSize = l_UtilBar_1, 
                TextColor3 = l_Text_0, 
                Font = l_UtilBar_0, 
                Size = v12, 
                AutoButtonColor = false, 
                BackgroundColor3 = l_UnselectedGray_0, 
                BackgroundTransparency = 0, 
                LayoutOrder = 1, 
                [v1.Event.Activated] = l_onClientButton_0
            }), 
            ServerButton = v1.createElement("TextButton", {
                Text = v13[2], 
                TextSize = l_UtilBar_1, 
                TextColor3 = l_Text_0, 
                Font = l_UtilBar_0, 
                Size = v12, 
                AutoButtonColor = false, 
                Position = UDim2.new(0, l_ClientServerButtonWidth_0, 0, 0), 
                BackgroundColor3 = l_SelectedBlue_0, 
                BackgroundTransparency = 0, 
                LayoutOrder = 2, 
                [v1.Event.Activated] = l_onServerButton_0
            })
        });
    end;
end;
return v14;