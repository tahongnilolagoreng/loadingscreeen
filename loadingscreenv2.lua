-- Grow A Garden Loading Screen: Safe Server Teleport Notice

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Create the loading screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SafeServerLoadingScreen"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Background Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

-- Message Label
local TextLabel = Instance.new("TextLabel")
TextLabel.Text = "If being kicked from the server please do not close.\nWait patiently as the script is taking you to a less populated server."
TextLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
TextLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextWrapped = true
TextLabel.Parent = Frame

-- Optional fade-out after 5 seconds (can be adjusted or removed)
task.delay(5, function()
	local TweenService = game:GetService("TweenService")
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local tween = TweenService:Create(Frame, tweenInfo, {BackgroundTransparency = 1})
	tween:Play()
	tween.Completed:Wait()
	ScreenGui:Destroy()
end)