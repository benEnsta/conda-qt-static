@ECHO ON

call "%CONDA_PREFIX%"\bin\qmake.exe 

call nmake

call nmake install


:: Add more build steps here, if they are necessary.

:: See
:: http://docs.continuum.io/conda/build.html
:: for a list of environment variables that are set during the build process.
