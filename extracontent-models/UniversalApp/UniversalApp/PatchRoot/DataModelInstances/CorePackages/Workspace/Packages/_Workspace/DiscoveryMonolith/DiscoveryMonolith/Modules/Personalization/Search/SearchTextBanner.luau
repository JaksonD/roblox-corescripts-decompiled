local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Parent_0.DiscoveryUtils);
local l_extractAndStyleRichTextLinks_0 = v4.extractAndStyleRichTextLinks;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v9 = require(l_Parent_0.CentralOverlay);
local l_SetCentralOverlay_0 = v9.Actions.SetCentralOverlay;
local l_CloseCentralOverlay_0 = v9.Thunks.CloseCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
return function(v13) --[[ Line: 26 ]]
    -- upvalues: l_useStyle_0 (copy), l_useSelector_0 (copy), v1 (copy), v4 (copy), l_useRoactService_0 (copy), l_AppLinking_0 (copy), l_extractAndStyleRichTextLinks_0 (copy), l_useDispatch_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_CloseCentralOverlay_0 (copy)
    local v14 = l_useStyle_0();
    local l_Font_0 = v14.Font;
    local l_Font_1 = l_Font_0.Body.Font;
    local v17 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v19 = l_useSelector_0(function(v18) --[[ Line: 32 ]]
        return v18.ScreenSize;
    end);
    local v20, v21 = v1.useState(v19);
    local function v23(v22) --[[ Line: 37 ]]
        -- upvalues: v21 (copy)
        if v22 then
            v21(v22.AbsoluteSize);
        end;
    end;
    local v24 = v20.X and v4.getPageSideMargin(v20.X) or 0;
    local v25 = v13.sidePadding or v24;
    local v26 = l_useRoactService_0(l_AppLinking_0);
    local v29 = v1.useMemo(function() --[[ Line: 48 ]]
        -- upvalues: l_extractAndStyleRichTextLinks_0 (ref), v13 (copy)
        local v27, v28 = l_extractAndStyleRichTextLinks_0(v13.text);
        return {
            link = if #v27 > 0 then v27[1] else nil, 
            styledText = v28
        };
    end, {
        v13.text
    });
    local v30 = l_useDispatch_0();
    local v31 = v1.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v30 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v26 (copy), v29 (copy), l_CloseCentralOverlay_0 (ref)
        v30(l_SetCentralOverlay_0(l_CentralOverlayType_0.LeaveRobloxAlert, {
            continueFunc = function() --[[ Line: 62 ]] --[[ Name: continueFunc ]]
                -- upvalues: v26 (ref), v29 (ref), v30 (ref), l_CloseCentralOverlay_0 (ref)
                v26:openURL(v29.link);
                v30(l_CloseCentralOverlay_0());
            end
        }));
    end, {
        v29.link, 
        v30
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 32), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = v14.Theme.BackgroundContrast.Transparency, 
        BackgroundColor3 = v14.Theme.BackgroundContrast.Color, 
        BorderSizePixel = 0, 
        [v1.Change.AbsoluteSize] = v23
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v25), 
            PaddingRight = UDim.new(0, v25), 
            PaddingTop = UDim.new(0, 16), 
            PaddingBottom = UDim.new(0, 16)
        }), 
        BannerText = v1.createElement("TextButton", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            RichText = true, 
            Size = UDim2.new(1, 0, 0, 32), 
            Text = v29.styledText, 
            TextSize = v17, 
            Font = l_Font_1, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = v14.Theme.TextEmphasis.Color, 
            Active = v29.link ~= nil, 
            Selectable = v29.link ~= nil, 
            [v1.Event.Activated] = if v29.link then v31 else nil
        })
    });
end;