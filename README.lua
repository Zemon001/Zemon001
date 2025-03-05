local Player = game:GetService("Players")
local LocalPlayer = Player.LocalPlayer
local Char = LocalPlayer.Character
local Humanoid = Char.Humanoid
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GuiService = game:GetService("GuiService")

equipitem = function(v)
  if LocalPlayer.Backpack:FindFirstChild(v) then
    local a = LocalPlayer.Backpack:FindFirstChild(v)
    Humanoid:EquipTool(a)
  end
end


Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/G1GX/Fetching/refs/heads/main/Master/Fetch%25ngUI"))()
local Window = Library:CreateWindow({
  Title = "Synack.net",
  Logo = 79977248698994
})

AutoCast = true
AutoShake = true
AutoReel = true
AutoSell = true
AutoSellAll = true


spawn(function()
  while wait() do
    pcall(function()
      if AutoCast then
        local Rod = Char:FindFirstChildOfClass("Tool")
        Rod.events.cast:FireServer(100, 1)
      end
    end)
  end
end)

spawn(function()
  while wait() do
    pcall(function()
      if AutoShake then
        local PlayerGUI = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        local shakeUI = PlayerGUI:FindFirstChild("shakeui")
        if shakeUI and shakeUI.Enabled then
          local safezone = shakeUI:FindFirstChild("safezone")
          if safezone then
            local button = safezone:FindFirstChild("button")
            if button and button:IsA("ImageButton") and button.Visible then
              GuiService.SelectedObject = button
              VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
              VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end
          end
        end
      end
    end)
  end
end)

spawn(function()
  while wait() do
    pcall(function()
      if AutoReel then
        for i, v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
          if v:IsA "ScreenGui" and v.Name == "reel" then
            if v:FindFirstChild "bar" then ReplicatedStorage.events.reelfinished:FireServer(100, true)
            end
          end
        end
      end
    end)
  end
end)

spawn(function()
  while wait() do
    pcall(function()
      if AutoSell then game:GetService("ReplicatedStorage").events.Sell:InvokeServer()
      end
    end)
  end
end)


local Tab1 = Window:CreateTab({
  Title = "เมนูฟาร์ม",
  Desc = "Moon X HUB",
  Icon = 7743867310
})
local Tab2 = Window:CreateTab({
  Title = "เมนู(soon)",
  Desc = "Moon X HUB",
  Icon = 7743869517
})

local Section1 = Tab1:CreateSection({
  Title = "ฟาร์ม ออโต้",
  Side = "Left"
})

Section1:CreateToggle({
  Title = "ตกปลา",
  Value = false,
  Callback = function(v)
    AutoCast = (v)
    AutoShake = (v)
    AutoReel = (v)
  end
})

Section1:CreateToggle({
  Title = "ขายในมือ",
  Value = false,
  Callback = function(v)
    AutoSell = (v)
  end
})

Section1:CreateButton({
  Title = "ขายทั้งหมด",
  Mode = 1,
  Callback = function(v) game:GetService("ReplicatedStorage").events.SellAll:InvokeServer()
    AutoSellAll = (v)
  end
})

Section1:CreateLabel({
  Title = '<font color="#FFFFFF">Moon X HUB</font>\n<font color="#FF0000"> </font>\n<font color="#0461FF">Made By</font>\n<font color="#FFD700">Zemon Zx</font>',
  Side = "Center"
})

Section1:CreateImage({
  Title = "Moon X HUB | By Zemon Zx",
  Desc = "Description Image Toggle",
  Icon = 79977248698994,
  Toggle = false,
  Value = false,
  Callback = function(value)
    print(value)
  end
})


local Section2 = Tab2:CreateSection({
  Title = "รอเพิ่ม",
  Side = "Right"
})

Section2:CreateImage({
  Title = "By Zemon Zx",
  Desc = "Description Image only",
  Icon = 79977248698994
})

for i = 1, 10 do
  Library:Notify({
    Title = "This is a notificaiton",
    Desc = "This is a description notificaiton",
    Logo = 79977248698994,
    Time = 3
  })
  wait(2)
end


spawn(function()
  while wait() do
    if AutoCast then
      pcall(function()
        for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
          if v:IsA("Tool") and v.Name:lower():find("rod") then
            equipitem(v.Name)
          end
        end
      end)
    end
  end
end)
