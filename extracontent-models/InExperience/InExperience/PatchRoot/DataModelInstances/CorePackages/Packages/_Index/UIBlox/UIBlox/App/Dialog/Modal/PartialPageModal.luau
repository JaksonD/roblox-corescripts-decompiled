local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Button.ButtonStack);
local v6 = require(script.Parent.Enum.CloseButtonIcon);
local l_FitFrameVertical_0 = require(l_Parent_2.FitFrame).FitFrameVertical;
local v8 = require(l_Parent_0.ModalTitle);
local v9 = require(l_Parent_0.ModalWindow);
local v10 = v3.PureComponent:extend("PartialPageModal");
v10.validateProps = v4.strictInterface({
    screenSize = v4.Vector2, 
    [v3.Children] = v4.table, 
    position = v4.optional(v4.UDim2), 
    anchorPoint = v4.optional(v4.Vector2), 
    title = v4.optional(v4.string), 
    titleBackgroundImageProps = v4.optional(v4.strictInterface({
        image = v4.string, 
        imageHeight = v4.number, 
        text = v4.optional(v4.string)
    })), 
    bottomPadding = v4.optional(v4.number), 
    marginSize = v4.optional(v4.number), 
    buttonStackProps = v4.optional(v5.validateProps), 
    footerContent = v4.optional(v4.callback), 
    closeButtonIcon = v4.optional(v6.isEnumValue), 
    onCloseClicked = v4.optional(v4.callback), 
    contentPadding = v4.optional(v4.UDim)
});
v10.defaultProps = {
    marginSize = 24, 
    closeButtonIcon = v6.Close
};
v10.render = function(v11) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v3 (copy), v8 (copy), l_FitFrameVertical_0 (copy), v5 (copy)
    local l_screenSize_0 = v11.props.screenSize;
    local v13 = v11.props.bottomPadding or 24;
    if not v9:isFullWidth(l_screenSize_0.X) then
        v13 = 24;
    end;
    return v3.createElement(v9, {
        isFullHeight = false, 
        screenSize = l_screenSize_0, 
        position = v11.props.position, 
        anchorPoint = v11.props.anchorPoint
    }, {
        TitleContainer = v3.createElement(v8, {
            title = v11.props.title, 
            titleBackgroundImageProps = v11.props.titleBackgroundImageProps, 
            closeButtonIcon = v11.props.closeButtonIcon, 
            onCloseClicked = v11.props.onCloseClicked
        }), 
        Content = v3.createElement(l_FitFrameVertical_0, {
            Position = UDim2.new(0, 0, 0, v8.TITLE_HEIGHT), 
            width = UDim.new(1, 0), 
            margin = {
                top = 0, 
                bottom = v13, 
                left = 0, 
                right = 0
            }, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            BackgroundTransparency = 1, 
            contentPadding = v11.props.contentPadding, 
            LayoutOrder = 1
        }, {
            MiddlContent = v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, -2 * v11.props.marginSize), 
                BackgroundTransparency = 1
            }, v11.props[v3.Children]), 
            Buttons = v11.props.buttonStackProps and v3.createElement(l_FitFrameVertical_0, {
                BackgroundTransparency = 1, 
                width = UDim.new(1, 0), 
                LayoutOrder = 2
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }); 
                v3.createElement(v5, v11.props.buttonStackProps)
            }), 
            BottomFrame = if v11.props.footerContent then v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                FooterContent = v11.props.footerContent()
            }) else nil
        })
    });
end;
return v10;