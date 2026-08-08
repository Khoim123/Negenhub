-- Global / Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- Nạp Modules
local Helper = loadstring(game:HttpGet("URL_TO_HELPER.lua"))()
local DataPersist = loadstring(game:HttpGet("URL_TO_DATAPERSIST.lua"))()
local LockBar = loadstring(game:HttpGet("URL_TO_LOCKBAR.lua"))()

-- Nạp Lib UI
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Khoim123/Fluent/refs/heads/master/Main.lua?t=" .. os.time()))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Khoim123/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Khoim123/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Negen Hub", SubTitle = "by Thanh Khôi",
    TabWidth = 120, Size = UDim2.fromOffset(520, 460),
    Acrylic = false, Theme = "Dark",
})

local Tabs = {
    Main     = Window:AddTab({ Title = "Main",     Icon = "anchor"   }),
    Shop     = Window:AddTab({ Title = "Shop",     Icon = ""         }),
    Travel   = Window:AddTab({ Title = "Travel",   Icon = ""         }),
    Others   = Window:AddTab({ Title = "Others",   Icon = ""         }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
}

-- Init các hệ thống
LockBar.Init()

-- TAB MAIN - LOCK BAR
Tabs.Main:AddToggle("LockBarToggle", {
    Title = "Lock Bar giữa BarFrame",
    Default = false,
    Callback = function(state)
        LockBar.SetState(state)
        Fluent:Notify({ Title = "Bar Lock", Content = state and "Đã BẬT" or "Đã TẮT", Duration = 3 })
    end,
})

-- Khởi tạo Config Manager
SaveManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:BuildConfigSection(Tabs.Settings)
InterfaceManager:SetLibrary(Fluent)
InterfaceManager:BuildInterfaceSection(Tabs.Settings)

Window:SelectTab(1)
