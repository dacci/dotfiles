function Update-SymbolicLink {
  param(
    [string] $Path,
    [string] $Target
  )

  if (-not (Test-Path $Path) -or $(Get-ItemProperty $Path).LinkType -eq "SymbolicLink") {
    New-Item $Path -ItemType SymbolicLink -Target $Target -Force
  }
}

if ($IsWindows -or $env:OS -eq "Windows_NT") {
  $ProfileDir = "$HOME/AppData/Roaming"
} elseif ($IsMacOS) {
  $ProfileDir = "$HOME/Library/Application Support"
} elseif ($IsLinux) {
  if ($env:XDG_CONFIG_HOME) {
    $ProfileDir = $env:XDG_CONFIG_HOME
  } else {
    $ProfileDir = "$env:HOME/.config"
  }

  if (-not (Test-Path $ProfileDir)) {
    New-Item $ProfileDir -ItemType Directory
  }
} else {
  return
}

Get-ChildItem "$PSScriptRoot/home" | Foreach-Object {
  Update-SymbolicLink "$HOME/.$($_.Name)" $_.FullName
}

Get-ChildItem "$PSScriptRoot/config" | Foreach-Object {
  Update-SymbolicLink "$ProfileDir/$($_.Name)" $_.FullName
}

if (-not (Test-Path "$HOME/.vim/autoload")) {
  New-Item "$HOME/.vim/autoload" -ItemType Directory
}
Invoke-WebRequest `
  -Uri https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim `
  -OutFile "$HOME/.vim/autoload/plug.vim"
vim +PlugUpdate +q +q
