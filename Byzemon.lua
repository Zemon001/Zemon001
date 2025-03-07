local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local createButton = Instance.new("TextButton")
local copyButton = Instance.new("TextButton")
local killButton = Instance.new("TextButton")
local positionButton = Instance.new("TextButton")
local textBox = Instance.new("TextBox")

screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
frame.Parent = screenGui
frame.Size = UDim2.new(0.2, 0, 0.4, 0)
frame.Position = UDim2.new(0.4, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

createButton.Parent = frame
createButton.Size = UDim2.new(0.8, 0, 0.15, 0)
createButton.Position = UDim2.new(0.1, 0, 0.05, 0)
createButton.Text = "Create Script"
createButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
createButton.TextScaled = true
createButton.TextWrap = true

copyButton.Parent = frame
copyButton.Size = UDim2.new(0.8, 0, 0.15, 0)
copyButton.Position = UDim2.new(0.1, 0, 0.2, 0)
copyButton.Text = "Copy Script"
copyButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
copyButton.TextScaled = true
copyButton.TextWrap = true

positionButton.Parent = frame
positionButton.Size = UDim2.new(0.8, 0, 0.15, 0)
positionButton.Position = UDim2.new(0.1, 0, 0.35, 0)
positionButton.Text = "Get CFrame"
positionButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
positionButton.TextScaled = true
positionButton.TextWrap = true

killButton.Parent = frame
killButton.Size = UDim2.new(0.1, 0, 0.05, 0)
killButton.Position = UDim2.new(0.8, 0, 0, 0)
killButton.Text = "Kill"
killButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
killButton.TextScaled = true
killButton.TextWrap = true

textBox.Parent = frame
textBox.Size = UDim2.new(0.8, 0, 0.25, 0)
textBox.Position = UDim2.new(0.1, 0, 0.6, 0)
textBox.Text = "game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new()"
textBox.TextScaled = true
textBox.TextWrap = true
textBox.ClearTextOnFocus = false
textBox.BackgroundColor3 = Color3.fromRGB(128, 128, 128)

createButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local position = rootPart.Position
    textBox.Text = "game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new("..tostring(position)..")"
end)

copyButton.MouseButton1Click:Connect(function()
    setclipboard(textBox.Text)
end)

positionButton.MouseButton1Click:Connect(function()
    setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position))
end)

killButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local dragging = false
local dragStart = Vector2.new()
local startPos = Vector2.new()

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
