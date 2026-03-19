local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Enums.ExtraKeysEnum);
local v3 = require(l_Parent_0.Enums.TouchControlsEnum);
local _ = require(script.Parent.ConfigTypes);
local l_FFlagEnableConsoleExpControls_0 = require(l_Parent_1.SharedFlags).FFlagEnableConsoleExpControls;
local v6 = {
    CharacterMovement = {
        layoutOrder = 1, 
        label = "CoreScripts.InGameMenu.Controls.CharacterMovementTitle", 
        id = "CharacterMovement"
    }, 
    Accessories = {
        layoutOrder = 2, 
        label = "CoreScripts.InGameMenu.Controls.AccessoriesTitle", 
        id = "Accessories"
    }, 
    Misc = {
        layoutOrder = 3, 
        label = "CoreScripts.InGameMenu.Controls.MiscellaneousTitle", 
        id = "Misc"
    }, 
    CameraMovement = {
        layoutOrder = 4, 
        label = "CoreScripts.InGameMenu.Controls.CameraMovementTitle", 
        id = "CameraMovement"
    }, 
    MenuItems = {
        layoutOrder = 5, 
        label = "CoreScripts.InGameMenu.Controls.MenuItemsTitle", 
        id = "MenuItems"
    }
};
local v7 = {
    MoveForward = {
        label = "CoreScripts.InGameMenu.Controls.MoveForward", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.W
                }, 
                {
                    Enum.KeyCode.Up
                }
            }, 
            group = v6.CharacterMovement, 
            layoutOrder = 1
        }
    }, 
    MoveBackward = {
        label = "CoreScripts.InGameMenu.Controls.MoveBackward", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.S
                }, 
                {
                    Enum.KeyCode.Down
                }
            }, 
            group = v6.CharacterMovement, 
            layoutOrder = 2
        }
    }, 
    MoveLeft = {
        label = "CoreScripts.InGameMenu.Controls.MoveLeft", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.A
                }, 
                {
                    Enum.KeyCode.Left
                }
            }, 
            group = v6.CharacterMovement, 
            layoutOrder = 3
        }
    }, 
    MoveRight = {
        label = "CoreScripts.InGameMenu.Controls.MoveRight", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.D
                }, 
                {
                    Enum.KeyCode.Right
                }
            }, 
            group = v6.CharacterMovement, 
            layoutOrder = 4
        }
    }, 
    Move = {
        label = "CoreScripts.InGameMenu.Controls.MoveGamepad", 
        gamepadInput = {
            input = {
                Enum.KeyCode.Thumbstick1
            }
        }, 
        touchInput = {
            thumbstickInput = {
                v3.BottomLeftRotate
            }, 
            tapToMoveInput = {
                v3.BottomLeftTap
            }
        }
    }, 
    Jump = {
        label = "CoreScripts.InGameMenu.Controls.Jump", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.Space
                }
            }, 
            group = v6.CharacterMovement, 
            layoutOrder = 5
        }, 
        gamepadInput = {
            input = {
                Enum.KeyCode.ButtonA
            }
        }, 
        touchInput = {
            thumbstickInput = {
                v3.BottomRight
            }, 
            tapToMoveInput = {
                v3.BottomRight
            }
        }
    }, 
    EquipUnequipTool = {
        label = "CoreScripts.InGameMenu.Controls.EquipUnequipTools", 
        keyboardInput = {
            input = {
                {
                    v2.NumSequence
                }
            }, 
            group = v6.Accessories, 
            layoutOrder = 1
        }, 
        touchInput = {
            thumbstickInput = {
                v3.BottomMid
            }, 
            tapToMoveInput = {
                v3.BottomMid
            }
        }
    }, 
    DropTool = {
        label = "CoreScripts.InGameMenu.Controls.DropTool", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.Backspace
                }
            }, 
            group = v6.Accessories, 
            layoutOrder = 2
        }
    }, 
    UseTool = {
        label = "CoreScripts.InGameMenu.Controls.UseTool", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.MouseLeftButton
                }
            }, 
            group = v6.Accessories, 
            layoutOrder = 3
        }, 
        gamepadInput = {
            xboxInput = {
                Enum.KeyCode.ButtonR2
            }, 
            playstationInput = {
                Enum.KeyCode.ButtonR2
            }
        }, 
        touchInput = {
            thumbstickInput = {
                v3.TopMidTap
            }, 
            tapToMoveInput = {
                v3.TopRightTap
            }
        }
    }, 
    SwitchTool = {
        label = "CoreScripts.InGameMenu.Controls.SwitchToolGamepad", 
        gamepadInput = {
            xboxInput = {
                Enum.KeyCode.ButtonL1, 
                Enum.KeyCode.ButtonR1
            }, 
            playstationInput = {
                Enum.KeyCode.ButtonL1, 
                Enum.KeyCode.ButtonR1
            }
        }
    }, 
    UISelectionToggle = {
        label = "CoreScripts.InGameMenu.Controls.GameMenuToggleGamepad", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.BackSlash
                }
            }, 
            group = v6.Misc, 
            layoutOrder = 1
        }
    }, 
    Screenshot = {
        label = "CoreScripts.InGameMenu.Controls.Screenshot", 
        keyboardInput = {
            macInput = {
                {
                    Enum.KeyCode.RightAlt, 
                    Enum.KeyCode.One
                }
            }, 
            winInput = {
                {
                    Enum.KeyCode.LeftAlt, 
                    Enum.KeyCode.One
                }
            }, 
            group = v6.Misc, 
            layoutOrder = 2
        }
    }, 
    RecordVideo = {
        label = "CoreScripts.InGameMenu.Controls.RecordVideo", 
        keyboardInput = {
            winInput = {
                {
                    Enum.KeyCode.F12
                }
            }, 
            group = v6.Misc, 
            layoutOrder = 3
        }
    }, 
    DevConsole = {
        label = "CoreScripts.InGameMenu.Controls.DevConsole", 
        keyboardInput = {
            macInput = {
                {
                    Enum.KeyCode.F9
                }, 
                {
                    v2.Fn, 
                    Enum.KeyCode.F9
                }
            }, 
            winInput = {
                {
                    Enum.KeyCode.F9
                }
            }, 
            group = v6.Misc, 
            layoutOrder = 4
        }
    }, 
    Mouselock = {
        label = "CoreScripts.InGameMenu.Controls.MouseLock", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.LeftShift
                }
            }, 
            group = v6.Misc, 
            layoutOrder = 5
        }
    }, 
    GraphicsLevel = {
        label = "CoreScripts.InGameMenu.Controls.GraphicsLevel", 
        keyboardInput = {
            macInput = {
                {
                    Enum.KeyCode.F10
                }, 
                {
                    v2.Fn, 
                    Enum.KeyCode.F10
                }
            }, 
            winInput = {
                {
                    Enum.KeyCode.F10
                }
            }, 
            group = v6.Misc, 
            layoutOrder = 6
        }
    }, 
    Fullscreen = {
        label = "CoreScripts.InGameMenu.Controls.ToggleFullscreen", 
        keyboardInput = {
            macInput = {
                {
                    Enum.KeyCode.LeftControl, 
                    Enum.KeyCode.LeftSuper, 
                    Enum.KeyCode.F
                }
            }, 
            winInput = {
                {
                    Enum.KeyCode.F11
                }
            }, 
            group = v6.Misc, 
            layoutOrder = 7
        }
    }, 
    PerfStats = {
        label = "CoreScripts.InGameMenu.Controls.PerformanceStats", 
        keyboardInput = {
            macInput = {
                {
                    v2.Fn, 
                    Enum.KeyCode.RightAlt, 
                    Enum.KeyCode.LeftSuper, 
                    Enum.KeyCode.F7
                }
            }, 
            winInput = {
                {
                    Enum.KeyCode.LeftControl, 
                    Enum.KeyCode.LeftShift, 
                    Enum.KeyCode.F7
                }
            }, 
            group = v6.Misc, 
            layoutOrder = 8
        }
    }, 
    Rotate = {
        label = "CoreScripts.InGameMenu.Controls.RotateCamera", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.MouseRightButton
                }
            }, 
            group = v6.CameraMovement, 
            layoutOrder = 1
        }
    }, 
    RotateCamera = {
        label = "CoreScripts.InGameMenu.Controls.RotateCameraGamepad", 
        gamepadInput = {
            xboxInput = {
                Enum.KeyCode.Thumbstick2
            }, 
            playstationInput = {
                Enum.KeyCode.Thumbstick2
            }
        }, 
        touchInput = {
            thumbstickInput = {
                v3.TopRightRotate
            }, 
            tapToMoveInput = {
                v3.TopMidRotate
            }
        }
    }, 
    ZoomInOut = {
        label = "CoreScripts.InGameMenu.Controls.ZoomInOutCamera", 
        keyboardInput = {
            input = {
                {
                    v2.MouseWheel
                }
            }, 
            group = v6.CameraMovement, 
            layoutOrder = 2
        }, 
        touchInput = {
            thumbstickInput = {
                v3.TopLeft
            }, 
            tapToMoveInput = {
                v3.TopLeft
            }
        }
    }, 
    ZoomIn = {
        label = "CoreScripts.InGameMenu.Controls.ZoomInCamera", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.I
                }
            }, 
            group = v6.CameraMovement, 
            layoutOrder = 3
        }
    }, 
    ZoomOut = {
        label = "CoreScripts.InGameMenu.Controls.ZoomOutCamera", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.O
                }
            }, 
            group = v6.CameraMovement, 
            layoutOrder = 4
        }
    }, 
    CameraZoomGamepad = {
        label = "CoreScripts.InGameMenu.Controls.CameraZoomGamepad", 
        gamepadInput = {
            xboxInput = {
                Enum.KeyCode.ButtonR3
            }, 
            playstationInput = {
                Enum.KeyCode.ButtonR3
            }
        }
    }, 
    FirstPersonCamera = {
        label = "CoreScripts.InGameMenu.Controls.ToggleCameraView", 
        gamepadInput = {
            spatialGamepadInput = {
                Enum.KeyCode.ButtonR3
            }
        }
    }, 
    RobloxMenu = {
        label = "CoreScripts.InGameMenu.Controls.RobloxMenu", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.Escape
                }
            }, 
            group = v6.MenuItems, 
            layoutOrder = 1
        }, 
        gamepadInput = {
            xboxInput = {
                Enum.KeyCode.ButtonStart
            }, 
            playstationInput = {
                Enum.KeyCode.ButtonStart
            }, 
            spatialGamepadInput = {
                Enum.KeyCode.ButtonSelect
            }
        }
    }, 
    MenuNavigationGamepad = {
        label = "CoreScripts.InGameMenu.Controls.MenuNavigationGamepad", 
        gamepadInput = {
            xboxInput = {
                v2.DPad
            }, 
            playstationInput = {
                v2.DPad
            }
        }
    }, 
    GameMenuToggleGamepad = {
        label = "CoreScripts.InGameMenu.Controls.GameMenuToggle", 
        gamepadInput = {
            playstationInput = {
                v2.TouchPad
            }, 
            xboxInput = {
                Enum.KeyCode.ButtonSelect
            }
        }
    }, 
    Backpack = {
        label = "CoreScripts.InGameMenu.Controls.Backpack", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.Backquote
                }
            }, 
            group = v6.MenuItems, 
            layoutOrder = 2
        }
    }, 
    Playerlist = {
        label = "CoreScripts.InGameMenu.Controls.Playerlist", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.Tab
                }
            }, 
            group = v6.MenuItems, 
            layoutOrder = 3
        }
    }, 
    Chat = {
        label = "CoreScripts.InGameMenu.Controls.Chat", 
        keyboardInput = {
            input = {
                {
                    Enum.KeyCode.Slash
                }
            }, 
            group = v6.MenuItems, 
            layoutOrder = 4
        }, 
        gamepadInput = {
            xboxInput = {
                Enum.KeyCode.ButtonL2
            }
        }
    }, 
    Back = {
        label = "CoreScripts.InGameMenu.Controls.BackGamepad", 
        gamepadInput = {
            input = {
                Enum.KeyCode.ButtonB
            }
        }
    }
};
if not l_FFlagEnableConsoleExpControls_0 then
    v7.Chat.gamepadInput = nil;
end;
return {
    ControlGroups = v6, 
    Controls = v7
};