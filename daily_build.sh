VOYAGER_ROOT=$HOME/Documents/voyager-group/voyager
BUILD_PATH=$VOYAGER_ROOT/build
BUILD_OUTPUT=/tmp/build.log
cd $VOYAGER_ROOT
git pull > $BUILD_OUTPUT
# -S: read password from the standard input instead of using the terminal.
# -k: reset the access token.
echo "1442760sh"$'\n' | sudo -kS ./bootstrap
cd $BUILD_PATH
if [ -f $BUILD_PATH/CMakeCache.txt ]; then
    rm $BUILD_PATH/CMakeCache.txt
fi
cmake ../ >> $BUILD_OUTPUT
source $BUILD_PATH/devel/setup.sh >> $BUILD_OUTPUT
update_data.py -r suzhou >> $BUILD_OUTPUT
make -j10 >> $BUILD_OUTPUT
