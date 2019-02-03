@ECHO OFF
SETLOCAL

PUSHD "%USERPROFILE%\.atom\packages"

FOR /D %%P IN (*) DO (
  PUSHD %%P
  apm install
  POPD
)

POPD
