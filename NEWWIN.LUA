local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local DiscordLabel = Instance.new("TextLabel") -- Added Discord text
local TimerLabel = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local UICorner = Instance.new("UICorner")

-- ScreenGui Settings
ScreenGui.Name = "ScreenBlocker"
ScreenGui.DisplayOrder = 999999999
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

-- Main Frame (70% of screen, centered)
Frame.Name = "MainFrame"
Frame.Size = UDim2.new(0.7, 0, 0.7, 0) 
Frame.Position = UDim2.new(0.15, 0, 0.15, 0) 
Frame.BackgroundTransparency = 0
Frame.Parent = ScreenGui

-- Black and White Gradient Background
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), 
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)) 
})
UIGradient.Rotation = 45
UIGradient.Parent = Frame

-- Rounded Corners
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

-- Title Label
TitleLabel.Name = "Title"
TitleLabel.Parent = Frame
TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TitleLabel.Size = UDim2.new(0.8, 0, 0.15, 0)
TitleLabel.Position = UDim2.new(0.5, 0, 0.15, 0) -- Slightly moved higher
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "RINGTA AUTO WIN"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.GothamBlack
TitleLabel.TextStrokeTransparency = 0.7
TitleLabel.TextStrokeColor3 = Color3.fromRGB(100, 100, 100)
TitleLabel.ZIndex = 2

-- Discord Label (Newly Added)
DiscordLabel.Name = "Discord"
DiscordLabel.Parent = Frame
DiscordLabel.AnchorPoint = Vector2.new(0.5, 0.5)
DiscordLabel.Size = UDim2.new(0.8, 0, 0.1, 0)
DiscordLabel.Position = UDim2.new(0.5, 0, 0.35, 0) -- Positioned under the title
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Text = "discord.gg/ringta"
DiscordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordLabel.TextScaled = true
DiscordLabel.Font = Enum.Font.GothamMedium
DiscordLabel.TextStrokeTransparency = 0.8
DiscordLabel.ZIndex = 2

-- Timer Label
TimerLabel.Name = "Timer"
TimerLabel.Parent = Frame
TimerLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TimerLabel.Size = UDim2.new(0.8, 0, 0.15, 0)
TimerLabel.Position = UDim2.new(0.5, 0, 0.8, 0)
TimerLabel.BackgroundTransparency = 1
TimerLabel.Text = "Pulling lever till 10 min"
TimerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TimerLabel.TextScaled = true
TimerLabel.Font = Enum.Font.GothamBold
TimerLabel.ZIndex = 2

-- Timer Logic
task.spawn(function()
    local countdown = 600 -- 10 minutes in seconds
    while countdown > 0 do
        TimerLabel.Text = "Pulling lever till " .. math.floor(countdown / 60) .. " min " .. (countdown % 60) .. " sec"
        task.wait(1) -- Update every second
        countdown -= 1
    end

    -- Switch text after 10 minutes
    local nextCountdown = 240 -- 4 minutes in seconds
    while nextCountdown > 0 do
        TimerLabel.Text = "4 mins till win - " .. math.floor(nextCountdown / 60) .. " min " .. (nextCountdown % 60) .. " sec"
        task.wait(1)
        nextCountdown -= 1
    end

    -- After final timer, show completion message
    TimerLabel.Text = "Restarting script"
end)
