local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(script.Parent.Header);
local v4 = require(script.Parent.Body);
local v5 = require(script.Parent.FitFrameVertical);
local v6 = v1.PureComponent:extend("AssetCard");
v6.defaultProps = {
    cardTitle = nil, 
    cardIcon = nil, 
    cardBodyText = nil, 
    contentLoadedCallback = nil, 
    bodyActivated = function() --[[ Line: 25 ]] --[[ Name: bodyActivated ]]
        print("Card body was activated!");
    end
};
v6.render = function(v7) --[[ Line: 30 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v5 (copy), v3 (copy), v4 (copy)
    local v8 = v7.props[v1.Children];
    return v2.Style.withStyle(function(_) --[[ Line: 33 ]]
        -- upvalues: v1 (ref), v5 (ref), v3 (ref), v7 (copy), v4 (ref), v8 (copy)
        return v1.createElement(v5, {
            BackgroundTransparency = 1, 
            width = UDim.new(1, 0), 
            Visible = true, 
            contentPadding = UDim.new(0, 5), 
            LayoutOrder = 2
        }, {
            topSpacing = v1.createElement(v5, {
                BackgroundTransparency = 1, 
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 12)
            }, {
                header = v1.createElement(v3, {
                    cardTitle = v7.props.cardTitle or nil, 
                    isLoading = v7.props.isLoading, 
                    LayoutOrder = 1
                }), 
                body = v1.createElement(v4, {
                    cardIcon = v7.props.cardIcon, 
                    cardBodyText = v7.props.cardBodyText or nil, 
                    isLoading = v7.props.isLoading, 
                    contentLoadedCallback = v7.props.contentLoadedCallback, 
                    LayoutOrder = 2, 
                    bodyActivated = v7.props.bodyActivated
                })
            }), 
            bottomSpacing = v1.createElement(v5, {
                width = UDim.new(1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }, v8)
        });
    end);
end;
return v6;