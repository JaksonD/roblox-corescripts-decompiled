local l_Parent_0 = script:FindFirstAncestor("UserList").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Radius_0 = v2.Enums.Radius;
local l_Skeleton_0 = v2.Skeleton;
local l_Avatar_0 = v2.Avatar;
local l_InputSize_0 = v2.Enums.InputSize;
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v8) --[[ Line: 26 ]] --[[ Name: UserRow ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_Avatar_0 (copy), l_InputSize_0 (copy), v2 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    local v9 = true;
    if v8.displayName ~= "" then
        v9 = v8.username == "";
    end;
    local l_displayName_0 = v8.displayName;
    local v11 = ("@%*"):format(v8.username);
    local v12 = tonumber(v8.userId);
    local v13 = l_useTokens_0();
    if v12 == nil then
        return nil;
    else
        return v1.createElement("TextButton", {
            Size = UDim2.new(1, 0, 0, 48), 
            BackgroundTransparency = 1, 
            Text = "", 
            BorderSizePixel = 0, 
            [v1.Event.Activated] = v8.onActivated
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 12)
            }), 
            Avatar = v1.createElement(l_Avatar_0, {
                userId = v12, 
                size = l_InputSize_0.Large, 
                userPresence = v8.userPresence, 
                backgroundStyle = v13.Color.Shift.Shift_300, 
                LayoutOrder = 1
            }), 
            UserInfo = v1.createElement(v2.View, {
                tag = "size-full-0 auto-y col gap-xsmall align-x-left align-y-center", 
                LayoutOrder = 2
            }, {
                DisplayName = if not v9 then v1.createElement(v2.Text, {
                    LayoutOrder = 1, 
                    Text = l_displayName_0, 
                    tag = "auto-xy text-title-medium content-emphasis text-align-x-left"
                }) else nil, 
                Username = if not v9 then v1.createElement(v2.Text, {
                    LayoutOrder = 2, 
                    Text = v11, 
                    tag = "auto-xy text-body-medium content-default text-align-x-left"
                }) else nil, 
                ShimmerDisplayName = if v9 then v1.createElement(l_Skeleton_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.new(0.8, 0, 0, v13.Typography.TitleMedium.FontSize + v13.Typography.BodyMedium.FontSize), 
                    radius = l_Radius_0.Circle
                }) else nil
            })
        });
    end;
end;