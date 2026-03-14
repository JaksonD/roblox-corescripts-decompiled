local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.ReactRoblox);
local v7 = require(l_CorePackages_0.Packages.Foundation);
local v8 = require(l_RobloxGui_0.Modules.InGameMenu.Resources.Constants);
local l_View_0 = v7.View;
local v10 = require(script.BaseComponent);
local v11 = require(script.NextUpComponent);
local v12 = require(script.LeaveButtonsContainer);
local v13 = require(script.useNextUpSort);
local v14 = game:DefineFastInt("NextUpShadowTrafficPercent", 0);
local l_FFlagEnableInGameExitModalNextUpUi_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableInGameExitModalNextUpUi;
local v16 = require(script.Flags.FFlagEnableInGameExitModalNextUpUiRequestCache);
local v17 = require(script.Flags.FFlagInGameExitModalFixModalPadding);
if not l_FFlagEnableInGameExitModalNextUpUi_0 then
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if (l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 99) % 100 < v14 then
        v6.createRoot(Instance.new("ScreenGui")):render(v5.createElement(v10, nil, {
            nextUpShadowTraffic = v5.createElement(function() --[[ Line: 34 ]]
                -- upvalues: v13 (copy)
                v13();
                return nil;
            end)
        }));
    end;
    return require(script.Parent.LeaveGame);
else
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.TabHeader = nil;
    l_NewPage_0.Page.Name = "LeaveGamePage";
    l_NewPage_0.ShouldShowBottomBar = false;
    l_NewPage_0.ShouldShowHubBar = false;
    l_NewPage_0.ShrinkwrapPageViewClipper = true;
    l_NewPage_0.DisableTopPadding = true;
    l_NewPage_0.MaintainVerticalSize = true;
    l_NewPage_0.Page.Size = UDim2.fromScale(1, 0);
    l_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    l_NewPage_0.GetSize = function(v20) --[[ Line: 58 ]] --[[ Name: GetSize ]]
        local l_AbsoluteSize_0 = v20.Page.AbsoluteSize;
        return Vector2.new(math.ceil(l_AbsoluteSize_0.X), (math.max(math.ceil(l_AbsoluteSize_0.Y), 350)));
    end;
    local function v23(v22) --[[ Line: 65 ]] --[[ Name: onDontLeave ]]
        -- upvalues: l_NewPage_0 (copy), l_RbxAnalyticsService_0 (copy), v8 (copy)
        if l_NewPage_0.HubRef then
            l_NewPage_0.HubRef:PopMenu(v22, true);
        end;
        l_RbxAnalyticsService_0:SendEventDeferred(v8.AnalyticsTargetName, v8.AnalyticsInGameMenuName, v8.AnalyticsLeaveGameName, {
            confirmed = v8.AnalyticsCancelledName, 
            universeid = tostring(game.GameId), 
            source = v8.AnalyticsLeaveGameSource, 
            playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId()
        });
    end;
    local v24 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled() and 300 or 200;
    v6.createRoot(l_NewPage_0.Page):render(v5.createElement(v10, nil, {
        leaveGameWithNextUp = v5.createElement(function() --[[ Line: 86 ]] --[[ Name: LeaveGameWithNextUpComponent ]]
            -- upvalues: v5 (copy), v16 (copy), v13 (copy), l_NewPage_0 (copy), v10 (copy), l_View_0 (copy), v17 (copy), v12 (copy), v23 (copy), v24 (copy), v11 (copy)
            local v25, v26 = v5.useState(false);
            local v27 = if v16 then v13() else nil;
            v5.useEffect(function() --[[ Line: 90 ]]
                -- upvalues: l_NewPage_0 (ref), v26 (copy)
                local v28 = {};
                table.insert(v28, l_NewPage_0.Displayed.Event:connect(function() --[[ Line: 94 ]]
                    -- upvalues: v26 (ref)
                    v26(true);
                end));
                table.insert(v28, l_NewPage_0.Hidden.Event:connect(function() --[[ Line: 101 ]]
                    -- upvalues: v26 (ref)
                    v26(false);
                end));
                return function() --[[ Line: 106 ]]
                    -- upvalues: v28 (copy)
                    for _, v30 in v28 do
                        v30:Disconnect();
                    end;
                end;
            end, {});
            if not v25 then
                return v5.None;
            else
                return v5.createElement(v10, nil, {
                    mainContainer = v5.createElement(l_View_0, {
                        tag = v17 and "size-full-0 auto-y padding-large col gap-xxlarge" or "size-full-0 auto-y padding-large col gap-large"
                    }, {
                        LeaveButtonsContainer = v5.createElement(v12, {
                            onDontLeave = v23, 
                            buttonSize = v24
                        }), 
                        nextUpComponent = v5.createElement(v11, {
                            tilePairWidth = v24, 
                            nextUpSort = if v16 then v27 else nil
                        })
                    })
                });
            end;
        end)
    }));
    return l_NewPage_0;
end;