# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/aospa-alioth/manifest -b topaz
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16

# build rom
source $CIRRUS_WORKING_DIR/script/config
timeStart

mkfifo reading
tee "${BUILDLOG}" < reading &
build_message "Building Started"
progress &
./rom-build.sh lmi -t user -z  > reading & sleep 95m

retVal=$?
timeEnd
statusBuild
# end