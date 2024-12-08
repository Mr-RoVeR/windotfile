j
$env:STARSHIP_CONFIG = "C:\Users\harsh\.config\starship.toml"
Invoke-Expression (&starship init powershell)

Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}
Import-Module -Name Terminal-Icons
Import-Module -Name Winget-Essentials
Import-Module -Name ModuleFast
Import-Module -Name ChocolateyGet


Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-Alias yt-vid 'yt-dlp'
function yt-vid {
    yt-dlp -f "bv*+ba/b" -S "res,ext:webm:m4a" --merge-output-format mkv -o "%(title)s.%(ext)s" $args
}
Set-Alias yt-ply 'yt-dlp'
function yt-ply {
    yt-dlp -f "bv*+ba/b" -S "res,ext:webm:m4a" --merge-output-format mkv -o "%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s" $args
}

function conv-help {
    Write-Host "ffmpeg -i input.mkv -i audio.m4a -map 0 -map 1 -c copy output.mkv"
}
#Nav Alias
Set-Alias .. 'back1'
Set-Alias ... 'back2'
Set-Alias .... 'back3'
Set-Alias ..... 'back4'

function back1 { Set-Location .. }
function back2 { Set-Location ../.. }
function back3 { Set-Location ../../.. }
function back4 { Set-Location ../../../.. }
