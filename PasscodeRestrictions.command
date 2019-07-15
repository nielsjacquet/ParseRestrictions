#!/usr/bin/env bash

##cosmetic functions and Variables
##Colors
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'
BLUE='\033[0;34m'

##Break function for readabillity
function BR {
  echo "  "
}

##DoubleBreak function for readabillity
function DBR {
  echo " "
  echo " "
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
echo "Type in the output filename"
read PRname

##Genereate UUID's
UUID1Upper=$(uuidgen)
UUID2Upper=$(uuidgen)
UUID3Upper=$(uuidgen)

UUID1=$(echo $UUID1Upper | tr '[:upper:]' '[:lower:]')
UUID2=$(echo $UUID2Upper | tr '[:upper:]' '[:lower:]')
UUID3=$(echo $UUID3Upper | tr '[:upper:]' '[:lower:]')

echo $UUID1
echo $UUID2
echo $UUID3

echo $PRname

PRfile="$DIR/$PRname""_PasscodeRestrictions.mobileconfig"

echo $PRfile

##Variables
allowSimple="false"
forcePIN="true"
maxFailedAttempts="10"
maxGracePeriod="5"
maxInactivity="5"
minLength="6"
pinHistory="3"
requireAlphanumeric="false"

##print the file
echo -e "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" >> $PRfile
echo -e "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">" >> $PRfile
echo -e "<plist version=\"1.0\">\n<dict>" >> $PRfile
echo -e "<key>HasRemovalPasscode</key>\n<false/>" >> $PRfile
echo -e "<key>PayloadContent</key>\n<array>\n<dict>" >> $PRfile
echo -e "<key>PayloadDescription</key>\n<string>Configures passcode settings</string>" >> $PRfile
echo -e "<key>PayloadDisplayName</key>\n<string>Passcode</string>" >> $PRfile
echo -e "<key>PayloadIdentifier</key>\n<string>com.apple.mobiledevice.passwordpolicy.$UUID1</string>" >> $PRfile
echo -e "<key>PayloadType</key>\n<string>com.apple.mobiledevice.passwordpolicy</string>" >> $PRfile
echo -e "<key>PayloadUUID</key>\n<string>$UUID1</string>" >> $PRfile
echo -e "<key>PayloadVersion</key>\n<integer>1</integer>" >> $PRfile
echo -e "<key>allowSimple</key>\n<$allowSimple/>" >> $PRfile
echo -e "<key>forcePIN</key>\n<$forcePIN/>" >> $PRfile
echo -e "<key>maxFailedAttempts</key>\n<integer>$maxFailedAttempts</integer>" >> $PRfile
echo -e "<key>maxGracePeriod</key>\n<integer>$maxGracePeriod</integer>" >> $PRfile
echo -e "<key>maxInactivity</key>\n<integer>$maxInactivity</integer>" >> $PRfile
echo -e "<key>minLength</key>\n<integer>$minLength</integer>" >> $PRfile
echo -e "<key>pinHistory</key>\n<real>$pinHistory</real>" >> $PRfile
echo -e "<key>requireAlphanumeric</key>\n<$requireAlphanumeric/>" >> $PRfile
echo -e "</dict>\n</array>" >> $PRfile
echo -e "<key>PayloadDisplayName</key>\n<string>$PRname"_PasscodeRestrictions"</string>" >> $PRfile
echo -e "<key>PayloadIdentifier</key>\n<string>com.apple.mobiledevice.passwordpolicy.$UUID2</string>" >> $PRfile
echo -e "<key>PayloadRemovalDisallowed</key>\n<true/>" >> $PRfile
echo -e "<key>PayloadType</key>\n<string>Configuration</string>" >> $PRfile
echo -e "<key>PayloadUUID</key>\n<string>$UUID3</string>" >> $PRfile
echo -e "<key>PayloadVersion</key>\n<integer>1</integer>" >> $PRfile
echo -e "</dict>\n</plist>" >> $PRfile
