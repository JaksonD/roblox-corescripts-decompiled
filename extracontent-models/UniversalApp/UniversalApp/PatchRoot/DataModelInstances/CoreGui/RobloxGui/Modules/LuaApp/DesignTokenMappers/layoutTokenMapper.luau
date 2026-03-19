local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local v5 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_WideGameTileViewConfig_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).WideGameTileViewConfig;
local l_GetFFlagLuaAppUpdateGameSortGridRowHeight10ft_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Flags.GetFFlagLuaAppUpdateGameSortGridRowHeight10ft;
local function _(v8, v9) --[[ Line: 17 ]] --[[ Name: scaleSizeForPlatform ]]
    return v8 * v9.Global.Stroke_100;
end;
local l_Kind_0 = l_LayoutConfig_0.Kind;
local l_Keys_0 = l_LayoutConfig_0.Keys;
local v13 = {
    sd = {
        min = 0, 
        max = 1024
    }, 
    hd = {
        min = 1024, 
        max = 1280
    }, 
    hd_ts = {
        min = 1280, 
        max = 1440
    }, 
    fhd = {
        min = 1440, 
        max = 1920
    }, 
    fhd_ts = {
        min = 1920, 
        max = 2260
    }, 
    ["2k"] = {
        min = 2260, 
        max = 2560
    }, 
    ["2k_ts"] = {
        min = 2560, 
        max = 3240
    }, 
    ["4k"] = {
        min = 3240, 
        max = 3840
    }, 
    ["6k"] = {
        min = 3840, 
        max = 1e999
    }
};
local v14 = nil;
return function(v15, v16) --[[ Line: 126 ]] --[[ Name: makeLayoutTokens ]]
    -- upvalues: v14 (ref), v13 (copy), l_Kind_0 (copy), l_Keys_0 (copy), l_GetFFlagLuaAppUpdateGameSortGridRowHeight10ft_0 (copy), l_UiMode_0 (copy), v5 (copy), l_WideGameTileViewConfig_0 (copy)
    v14 = {};
    for v17, v18 in v13 do
        v14[v17] = {
            min = v18.min * v16.Global.Stroke_100, 
            max = v18.max * v16.Global.Stroke_100
        };
    end;
    local v19 = {
        breakpoints = if v14 then v14 else v13, 
        kinds = l_Kind_0, 
        grid = {
            default = {
                margin = v16.Global.Space_600, 
                gutter = v16.Global.Space_600, 
                scrollableMaxTilesPerRow = 20, 
                columns = {
                    default = 4
                }
            }, 
            sd = {
                margin = v16.Global.Space_150, 
                gutter = v16.Global.Space_150, 
                verticalGutter = 34 * v16.Global.Stroke_100, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 4, 
                    [l_Kind_0.Experiences.WithFooter] = 4, 
                    [l_Kind_0.Experiences.AppGameTile] = 4, 
                    [l_Kind_0.Experiences.GridTile] = 4, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 8
                }
            }, 
            hd = {
                margin = 18 * v16.Global.Stroke_100, 
                gutter = 18 * v16.Global.Stroke_100, 
                verticalGutter = 34 * v16.Global.Stroke_100, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 6, 
                    [l_Kind_0.Experiences.WithFooter] = 6, 
                    [l_Kind_0.Experiences.AppGameTile] = 6, 
                    [l_Kind_0.Experiences.GridTile] = 4, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 10
                }
            }, 
            hd_ts = {
                margin = v16.Global.Space_300, 
                gutter = v16.Global.Space_300, 
                verticalGutter = 34 * v16.Global.Stroke_100, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 7, 
                    [l_Kind_0.Experiences.WithFooter] = 7, 
                    [l_Kind_0.Experiences.AppGameTile] = 7, 
                    [l_Kind_0.Experiences.GridTile] = 4, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 12
                }
            }, 
            fhd = {
                margin = 34 * v16.Global.Stroke_100, 
                gutter = 34 * v16.Global.Stroke_100, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 8, 
                    [l_Kind_0.Experiences.WithFooter] = 8, 
                    [l_Kind_0.Experiences.AppGameTile] = 8, 
                    [l_Kind_0.Experiences.GridTile] = 4, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 12
                }
            }, 
            fhd_ts = {
                margin = 38 * v16.Global.Stroke_100, 
                gutter = 38 * v16.Global.Stroke_100, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 9, 
                    [l_Kind_0.Experiences.WithFooter] = 9, 
                    [l_Kind_0.Experiences.AppGameTile] = 9, 
                    [l_Kind_0.Experiences.GridTile] = 4, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 12
                }
            }, 
            ["2k"] = {
                columns = {
                    [l_Kind_0.Experiences.Default] = 10, 
                    [l_Kind_0.Experiences.WithFooter] = 10, 
                    [l_Kind_0.Experiences.AppGameTile] = 10, 
                    [l_Kind_0.Experiences.GridTile] = 6, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 14
                }
            }, 
            ["2k_ts"] = {
                columns = {
                    [l_Kind_0.Experiences.Default] = 11, 
                    [l_Kind_0.Experiences.WithFooter] = 11, 
                    [l_Kind_0.Experiences.AppGameTile] = 11, 
                    [l_Kind_0.Experiences.GridTile] = 6, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 16
                }
            }, 
            ["4k"] = {
                columns = {
                    [l_Kind_0.Experiences.Default] = 12, 
                    [l_Kind_0.Experiences.WithFooter] = 12, 
                    [l_Kind_0.Experiences.AppGameTile] = 12, 
                    [l_Kind_0.Experiences.GridTile] = 6, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 20
                }
            }, 
            ["6k"] = {
                width = 3840 * v16.Global.Stroke_100, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 12, 
                    [l_Kind_0.Experiences.WithFooter] = 12, 
                    [l_Kind_0.Experiences.AppGameTile] = 12, 
                    [l_Kind_0.Experiences.GridTile] = 6, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 20
                }
            }
        }, 
        tiles = {
            hover = {
                topOffset = 10 * v16.Global.Stroke_100, 
                bottomOffset = 22 * v16.Global.Stroke_100, 
                horizontalOffset = -4 * v16.Global.Stroke_100
            }
        }, 
        topBar = {
            gutter = v16.Global.Space_200, 
            columns = 1, 
            [l_Keys_0.PaddingRightItems] = v16.Global.Space_200, 
            [l_Keys_0.PaddingVertical] = v16.Global.Space_200
        }, 
        layoutTypes = {
            [l_Kind_0.Friends] = {
                relativeHeight = {
                    Scale = 1, 
                    Offset = 44 * v16.Global.Stroke_100
                }
            }, 
            [l_Kind_0.Experiences.Default] = {
                relativeHeight = {
                    Scale = 1, 
                    Offset = 60 * v16.Global.Stroke_100
                }
            }, 
            [l_Kind_0.Experiences.WithFooter] = {
                relativeHeight = {
                    Scale = 1, 
                    Offset = if l_GetFFlagLuaAppUpdateGameSortGridRowHeight10ft_0() and v15.uiMode == l_UiMode_0.TenFoot then 98 * v16.Global.Stroke_100 else 82 * v16.Global.Stroke_100
                }
            }, 
            [l_Kind_0.Experiences.AppGameTile] = {
                relativeHeight = {
                    Scale = 1, 
                    Offset = v5.Constants.GAME_GRID_TILE_FOOTER_HEIGHT * v16.Global.Stroke_100
                }
            }, 
            [l_Kind_0.Experiences.GridTile] = {
                gutter = v16.Global.Space_300, 
                relativeHeight = {
                    Scale = 0.5625, 
                    Offset = l_WideGameTileViewConfig_0.getFooterHeight(v16)
                }
            }, 
            [l_Kind_0.Experiences.EventTile] = {
                gutter = v16.Global.Space_300, 
                relativeHeight = {
                    Scale = 0.5625, 
                    Offset = l_WideGameTileViewConfig_0.getFooterHeight(v16)
                }
            }
        }
    };
    if v15.uiMode == l_UiMode_0.TenFoot then
        v19.grid.fhd.margin = 0 * v16.Global.Stroke_100;
        v19.grid.fhd.gutter = v16.Global.Space_300;
        v19.grid.fhd.verticalGutter = 0 * v16.Global.Stroke_100;
        v19.grid.fhd.columns[l_Kind_0.Friends] = 12;
    end;
    return v19;
end;