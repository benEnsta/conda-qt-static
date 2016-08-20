ECHO ON
mkdir build

cd build

CALL ..\configure.bat -static -release -prefix "%CONDA_PREFIX%" -opengl desktop -opensource -confirm-license -nomake examples -nomake tools

echo "CONF OK"
call nmake
echo "NMAKE OK"

call nmake install


:: Add more build steps here, if they are necessary.

:: See
:: http://docs.continuum.io/conda/build.html
:: for a list of environment variables that are set during the build process.
