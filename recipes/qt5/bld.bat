mkdir build
cd build
echo on
echo %CMAKE_GENERATOR%
cmake -G "%CMAKE_GENERATOR%" -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX="%PREFIX%" ../
set MSBuildLogger="C:\Program Files\AppVeyor\BuildAgent\Appveyor.MSBuildLogger.dll"
set MSBuildOptions=/v:m /logger:%MSBuildLogger% /p:Configuration=Release
echo %MSBuildOptions%
msbuild %MSBuildOptions% INSTALL.vcxproj
if errorlevel 1 exit 1

:: Add more build steps here, if they are necessary.

:: See
:: http://docs.continuum.io/conda/build.html
:: for a list of environment variables that are set during the build process.
